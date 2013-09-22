<%@ Page Language="C#"
    AutoEventWireup="true" %>
<!DOCTYPE html PUBLIC
    "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!-- Adapted from blog code by Peter Douglass. -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment - 1</title>
    <link href="../css/experiments.css" rel="Stylesheet" />
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
