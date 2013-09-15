<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset='utf-8' />
    <!--<link href="http://getbootstrap.com/2.3.2/assets/css/bootstrap.css" rel="stylesheet">-->
    <!--<link href="http://getbootstrap.com/2.3.2/assets/css/bootstrap-responsive.css" rel="stylesheet">-->
    <!--<script src="js/bootstrap.min.js"></script>-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="css/main.css" rel="stylesheet">
<title>Suyash Sonawane</title>
<script>
    function onAboutClick(){
        $("#details").text("Hi there! I am maintaining this website as part of my web development course under our awesome Prof. Jose. Over the next few months I will experiment with HTML/CSS/Javascript/webservices and will write a blog about each experiemnt. Watch out!");
    }
    function onBlogClick() {
        window.open("blog/", "_blank");
    }
    function onProjectClick() {
        $("#details").text("I am still decinding about the project topic. My aim is to cover certain areas of web development that I havent touched before. It should be useful for others as well. How about a combination of web services, images and javascript widgets? A webservice for applying instrgram-style image filter? Perhaps!");
    }
    function onContactClick() {
        $("#details").text("suyash-at-ccs.neu.edu");
    }
</script>
</head>

<body>

<div class="pad">

<form id="form1" runat="server">
<ul class="master_navigation">
    <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
    <li><a href="statistics/" target="_blank">Statistics</a></li>
    <li><a href="source/" target="_blank">Source</a></li>
    <li><a href="search/" target="_blank">Search</a></li>
    <li><a href="searchtree/" target="_blank">SearchTree</a></li>
    <li><a href="textview/" target="_blank">TextView</a></li>
    <li><a href="filelist.aspx" target="_blank">FileList</a></li>
    <li><a href="autofile.aspx" target="_blank">AutoFile</a></li>
    <li><a href="images/autoimage.aspx" target="_blank">Images</a></li>
    <li><a href="blog/" target="_blank">Blog</a></li>
</ul>

<br />
    <header>
            <div class="circular-profile"></div>
            <h3>Suyash Sonawane</h3>
        <nav class="main-nav">
            <div class="nav-block" onclick="onAboutClick();">About</div>
            <div class="nav-block" onclick="onBlogClick();">Blog</div>
            <div class="nav-block" onclick="onProjectClick();">Project</div>
            <div class="nav-block" onclick="onContactClick();">Contact</div>
        </nav>
    </header>
    <div class="main-details">
            <div id="details"></div>
        </div>
</form>
</div>
</body>
</html>
