﻿<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
    <title>Experiment - 1</title>
    <link href="../css/experiments.css" rel="Stylesheet" />
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-44111915-1', 'neu.edu');
        ga('send', 'pageview');

</script>
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $( document ).ready(function() {
            var colors = ['blue', '#6fcab6', '#858878', 'red', '#a8e420', 'green', 'yellow', 'white'];
            $("#round1").click(function () {
                var random = Math.floor(Math.random() * colors.length);
                var colr = colors[random];
            $("#round1").css("background-color", colr);
            });
            //$("round2").css("background", "url('../images/jumping.jpg')at");
        });
    </script>
</head>
    
<body>
<form id="form1" runat="server">

<div id="section1" class="section" draggable="true">
    <h1>Heading1</h1>
    <a href="#">Link1</a>
</div>
<div id="section2" class="section" draggable="true">
     <h1>Heading2</h1>
</div>
<div id="section3" class="section" drggable="true">
        <img class="circular-image"src="../images/jumping.jpg" />
</div>
    <div id="round2" class="rounded-area">
        <img />
</div>
<div id="round1" class="rounded-area">
   Click me!
</div>
    
</form>
</body>
</html>
