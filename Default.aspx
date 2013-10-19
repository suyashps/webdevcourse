<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>
<meta name="viewport" content="width=device-width, maximum-scale=1">
<meta charset='utf-8' />
    <!--<link href="http://getbootstrap.com/2.3.2/assets/css/bootstrap.css" rel="stylesheet">-->
    <!--<link href="http://getbootstrap.com/2.3.2/assets/css/bootstrap-responsive.css" rel="stylesheet">-->
    <!--<script src="js/bootstrap.min.js"></script>-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="css/main.css" rel="stylesheet">
<title>Suyash Sonawane</title>
  <script>
   /*   (function (i, s, o, g, r, a, m) {
          i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
              (i[r].q = i[r].q || []).push(arguments)
          }, i[r].l = 1 * new Date(); a = s.createElement(o),
          m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
      })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

      ga('create', 'UA-44111915-1', 'neu.edu');
      ga('send', 'pageview');
      */


      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-44111915-1']);
      _gaq.push(['_trackPageview']);

      (function () {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();


</script>
<script>
    $(document).ready(function () {

        $("#aboutClick").click(function () {
            $("#details").text("Hi there! I am maintaining this website as part of my web development course under our awesome Prof. Jose. Over the next few months I will experiment with HTML/CSS/Javascript/webservices and will write a blog about each experiment. Watch out!");
            _gaq.push(['_trackEvent', 'clicks', 'about']);
        });
        $("#blogClick").click(function () {
            window.open("blog/", "_blank");
            _gaq.push(['_trackEvent', 'clicks', 'blog']);
        });
        $("#expClick").click(function () {
            window.open("story/", "_blank");
            _gaq.push(['_trackEvent', 'clicks', 'experiments']);
        });
        $("#projectClick").click(function () {
            $("#details").text("I am developing a project idea centered around grabbing images from popular web services and showing them in some meaningful way to visting user. More info soon.");
            //Through this class project I am planning to cover certain areas of web development that I haven't touched before. I will try to make my code as reusable as possible. In the coming days I will explore the Instagram API and try out ways to display images on my web page. More coming soon!");
            _gaq.push(['_trackEvent', 'clicks', 'project']);
        });
        $("#contactClick").click(function () {
            $("#details").html("<p style='text-align:center;'>suyash-at-ccs.neu.edu</p><div class='resume' style='text-align:center;' onclick='resumeClicked();'>Resume</div>");
            _gaq.push(['_trackEvent', 'clicks', 'contact']);
        });
        $("#linkedin-icon").click(function () {
            window.open("http://www.linkedin.com/in/suyashsonawane/", "_blank");
            _gaq.push(['_trackEvent', 'clicks', 'linkedin']);
        });
        $("#flickr-icon").click(function () {
            window.open("http://www.flickr.com/photos/colours_of_life/sets/", "_blank");
            _gaq.push(['_trackEvent', 'clicks', 'flickr']);
        });
        $("#instagram-icon").click(function () {
            window.open("http://instagram.com/suyashps", "_blank");
            _gaq.push(['_trackEvent', 'clicks', 'instagram']);
        });

        if( !navigator.userAgent.match(/Android/i) &&
            !navigator.userAgent.match(/iPhone/i) &&
            !navigator.userAgent.match(/iOs/i) ){
        //show hover animation
            $('.social-icon-holder img').mouseenter(function (e) {
                $(this).animate({ height: '45', left: '0', top: '0', width: '45' }, 100);
                //$(this).fadeIn(200);
            }).mouseleave(function (e) {
                $(this).animate({ height: '40', left: '0', top: '0', width: '40' }, 100);
                //$(this).children('a').fadeOut(200);
            });
        }

        

        
    });

    function resumeClicked() {
        window.open("SUYASH_SONAWANE_2013_v2.6.pdf", "_blank");
        _gaq.push(['_trackEvent', 'clicks', 'resume']);
    };
</script>
  
</head>

<body>

<div class="pad">

<form id="form1" runat="server">
    </form>
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
            <div id="aboutClick" class="nav-block" style="background-color: #009fff;" onclick="_gaq.push(['_trackEvent', 'clicks', 'about']);">About</div>
            <div id="blogClick" class="nav-block" style="background-color: #FF3F00;" onclick="_gaq.push(['_trackEvent', 'clicks', 'blog']);">Blog</div>
            <div id="expClick" class="nav-block" style="background-color: #FFBF00;" onclick="_gaq.push(['_trackEvent', 'clicks', 'experiments']);">Experiments</div>
            <div id="projectClick" class="nav-block" style="background-color: #029F00;" onclick="_gaq.push(['_trackEvent', 'clicks', 'project']);">Project</div>
            <div id="contactClick" class="nav-block" style="background-color: #07519A;" onclick="_gaq.push(['_trackEvent', 'clicks', 'contact']);">Contact</div>
        </nav>
    </header>
    <div class="main-details">
            <div id="details"></div>
        </div>
    <footer>
        <div class="social-profile-footer">
            <div id="linkedin-icon" class="social-icon-holder">
                <img src="images/webicon-linkedin.png" />
            </div>
            <div id="flickr-icon" class="social-icon-holder">
                <img src="images/webicon-flickr.png" />
            </div>
            <div id="instagram-icon" class="social-icon-holder">
                <img src="images/webicon-instagram.png" />
            </div>
            </div>
    </footer>
</div>
</body>
</html>
