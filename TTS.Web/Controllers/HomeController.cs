﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Collections.ObjectModel;
using System.Speech.Synthesis;
using System.Threading;

using TTS.Web.Helpers;
using TTS.Web.Models;

namespace TTS.Web.Controllers
{
    public class HomeController : Controller
    {

        private static int currentDelayIndex = 0;
        private const int DELAY_FREQUENCY = 3;
        private const int SPEECH_DELAY = 1 * 1000;

        public static SpeechProcessor SpeechProcessor { get; set; }

        public ActionResult Index()
        {
            IndexModel model = new IndexModel() {
                InstalledVoices = MvcApplication.InstalledVoices
            };

            return View(model);
        }

        public ActionResult Log() {
            LogModel model = new LogModel() {
                SpeechRequests = SpeechLog.Instance(Request.MapPath("/")).ReadLog()
            };

            return View(model);
        }

        public ActionResult Speak(string text, int voiceTypeIdx, int speechRate) {
            currentDelayIndex++;
            if (currentDelayIndex % DELAY_FREQUENCY == 0) {
                // Slow shit down occasionally to fuck with spammers
                Thread.Sleep(SPEECH_DELAY);
                currentDelayIndex = 0;
            }
            

            Char[] splitText = text.ToCharArray();

            String[] sentence = new String[splitText.Length];

            String newSentence = "";

            int i = 0;
            foreach (char word in splitText)
            {
                sentence[i] = word + " ";
                i++;
            }

            foreach (string str in sentence)
                newSentence = String.Concat(newSentence, str);

            newSentence = String.Concat(newSentence, text);

            int hashCode = SpeechProcessor.Instance.EnqueueSpeech(newSentence, MvcApplication.InstalledVoices[voiceTypeIdx], speechRate);

            SpeechLog.Instance(Request.MapPath("/")).LogRequest(text, Request.UserHostName);

            return Json(new {
                success = true,
                hashCode = hashCode,
                error = String.Empty
            });
        }

        public ActionResult Status(int hashCode) {
            string status = String.Empty;
            switch (SpeechProcessor.Instance.GetStatus(hashCode)) {
                case SpeechStatus.Speaking:
                    status = "Speaking...";
                    break;
                case SpeechStatus.Done:
                    status = "Done!";
                    break;
                default:
                    throw new Exception("Unknown speech status!");
            }

            return Json(new {
                success = true,
                status = status
            });
        }

        public ActionResult Tenses()
        {
            return View();
        }

        public ActionResult Say(string text)
        {
            Console.WriteLine("Masuk lo");

            currentDelayIndex++;
            if (currentDelayIndex % DELAY_FREQUENCY == 0)
            {
                // Slow shit down occasionally to fuck with spammers
                Thread.Sleep(SPEECH_DELAY);
                currentDelayIndex = 0;
            }

            int hashCode = SpeechProcessor.Instance.EnqueueSpeech(text, MvcApplication.InstalledVoices[0], -1);

            SpeechLog.Instance(Request.MapPath("/")).LogRequest(text, Request.UserHostName);


            return Json(new
            {
                success = true,
                hashCode = hashCode,
                error = String.Empty
            });
        }
    }
}
