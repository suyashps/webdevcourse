﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exp_3_responsive.aspx.cs" Inherits="experiments_exp_3_responsive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Responsive CSS experiment</title>
<style type="text/css">
.textcontainer {
	border: solid 4px antiquewhite;	
	padding: 5px 10px;
	margin: 10px;
    display:block;
}
.homepage {
        width:100%;
        background-image:url("../images/bigsur.jpg");
        background-repeat:no-repeat;
        -webkit-background-size: 100%;
       -moz-background-size: 100%;
        background-size: 100%;
        color:antiquewhite;
}

@media screen and (max-width: 600px) {
	.for600 {
		background: red;
	}
 
}

@media screen and (min-width: 900px) {
	.for900 {
		background: green;
	}
}

@media screen and (min-width: 600px) and (max-width: 900px) {
	.for600-900 {
		background: blue;
	}

}

@media screen and (max-device-width: 480px) {
	.mobile {
		background: yellow;
	}
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    </form>
      
        <h4>About Experiment</h4>
        <p>
            In this expriment I am trying to change div colors based on different screen widths using media tags.
            I am using three thresholds for width - greater than 900, between 600-900 and less than 600. I am simply changing color based on width.
        </p>
        <h4>How to Test</h4>
        <p>
            Start with full screen browser page and gradually drag the right edge of the browser to reduce the page width. You will notice color changes as you make the width less than 600 pixels.
        Also notice the background image width automatically adjusting based on width. This is also achived using @media tag in my css.
    </p>
    <div class="homepage">
    <strong>This should go red for screen size less than 600px.</strong>
   	<div class="textcontainer for600">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
    <strong>This should go blue for screen size between 600px and 900px</strong>
    <div class="textcontainer for600-900">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </div>
    <strong>This should go green for screen size greater than 900px</strong>
	<div class="textcontainer for900">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </div>
        </div>
</body>
</html>
