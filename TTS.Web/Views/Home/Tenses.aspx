<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>English For Kids</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

        <link type="text/css" rel="Stylesheet" href="/Content/Styles/MyStyle.css" />

        <script type="text/javascript" language="javascript" src="/Content/Scripts/jQuery.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container">
            <div class="jumbotron text-center">
                <h2>Learning English</h2>
            </div>
            <a href="/"><button class="tablink button-tab">Home</button></a>
            <button class="tablink button-tab" onclick="openPage('News', this, 'gray')"  id="defaultOpen">Learning by Reading</button>
              
            <div id="News" class="tabcontent">
                <button class="collapsible">Present Tense</button>
                <div class="content content-one">
                    <p>This is the tense which you use to state what's being happen right now or what's happen frequently</p>
                    <h4>The Formula</h4>
                    <div class="formula-box">
                        <h4>S &nbsp;+&nbsp;bare Verb&nbsp;+&nbsp;the rest of the sentence</h4>
                    </div>

                    <br>

                    <p><b style="font-size:14pt;">Example : </b>I read newspaper every morning</p>
                    <p style="font-size:8pt;margin-left: 9%">By every morning he means it's a habit.</p>

                    <br>
                    <p><button class="icon fa fa-play-circle-o" id="present"></button>&nbsp;&nbsp;<b style="font-size:14pt;">Listening : Present Tense</b></p>
                </div>
                <button class="collapsible">Past Tense</button>
                <div class="content">
                <p>This is the tense which you use to state what's already happening in the past. Whether that is a thing
                    that had been done or still being do until now.
                </p>
                <h4>The Formula</h4>
                <div class="formula-box">
                        <h4>S &nbsp;+&nbsp;2nd form of Verb&nbsp;+&nbsp;the rest of the sentence</h4>
                </div>
                <br>
                <p><b style="font-size:14pt;">Example : </b> I was drunk this morning.</p>
                <p style="font-size:8pt;margin-left: 9%">was drunk means he/she already finish drinking that coffee.</p>
                <br>
                <p><button class="icon fa fa-play-circle-o" id="past"></button>&nbsp;&nbsp;<b style="font-size:14pt;">Listening : Past Tense</b></p>
                </div>
                <button class="collapsible">Future Tense</button>
                <div class="content">
                <p>This is the tense which you use to state something that has not yet happened or that does not exist yet</p>                
                <h4>The Formula</h4>
                <div class="formula-box">
                        <h4>S &nbsp;+&nbsp;1st form Verb&nbsp;+&nbsp;Will or Shall&nbsp;+&nbsp;the rest of the sentence</h4>
                </div>
                <br>
                <p><b style="font-size:14pt;">Example : </b>I will drink that coffee tonight</p>
                <p style="font-size:8pt;margin-left: 9%">will drink means, he has not yet drinking that coffee</p>
                <br>
                <p><button class="icon fa fa-play-circle-o" id="future"></button>&nbsp;&nbsp;<b style="font-size:14pt;">Listening : Future Tense</b></p>
                </div>
                </div>
            </div>
    <script>
        $(document).ready(function () {
            $('#present').on('click', function () {
                var data = {
                    text: "Simple Present Tense. The Formula is Subject plus bare Verb plus the rest of the sentence, Example : I read newspaper every morning. By every morning he means it's a habit.",
                };

                $.ajax({
                    type: 'POST',
                    url: '/Home/Say',
                    data: data,
                    success: function (response) {
                        if (response.success) {
                            window.setTimeout(function () {
                                checkStatus(response.hashCode);
                            }, 100);
                        }
                    }
                });
            })

            $('#past').on('click', function () {
                var data = {
                    text: "Simple Past Tense. The Formula is Subject plus second form of Verb plus the rest of the sentence, Example : I was drunk this morning. Was drunk means he or she already finish drinking that coffee.",
                };

                $.ajax({
                    type: 'POST',
                    url: '/Home/Say',
                    data: data,
                    success: function (response) {
                        if (response.success) {
                            window.setTimeout(function () {
                                checkStatus(response.hashCode);
                            }, 100);
                        }
                    }
                });
            })

            $('#future').on('click', function () {
                var data = {
                    text: "Simple Future Tense. The Formula is Subject plus first form of Verb plus Will or Shall plus the rest of the sentence, Example : I will drink that coffee tonight. Will drink means, he has not yet drinking that coffee",
                };

                $.ajax({
                    type: 'POST',
                    url: '/Home/Say',
                    data: data,
                    success: function (response) {
                        if (response.success) {
                            window.setTimeout(function () {
                                checkStatus(response.hashCode);
                            }, 100);
                        }
                    }
                });
            })
        })

        function openPage(pageName,elmnt,color) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
              tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].style.backgroundColor = "";
            }
              document.getElementById(pageName).style.display = "block";
              elmnt.style.backgroundColor = color;
            }
            
            // Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpen").click();
    </script>
    </body>
</html>
