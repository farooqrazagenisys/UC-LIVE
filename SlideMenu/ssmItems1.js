/*
Configure menu styles below
NOTE: To edit the link colors, go to the STYLE tags and edit the ssm2Items colors
*/
YOffset=400; // no quotes!!
XOffset=0;
staticYOffset=0; // no quotes!!
slideSpeed=10 // no quotes!!
waitTime=100; // no quotes!! this sets the time the menu stays out for after the mouse goes off it.
menuBGColor="#FFFFFF";
menuIsStatic="no"; //this sets whether menu should stay static on the screen
menuWidth=110; // Must be a multiple of 10! no quotes!!
menuCols=1;
hdrFontFamily="verdana";
hdrFontSize="2";
hdrFontColor="white";
hdrBGColor = "#FFFFFF";
hdrAlign="center";
hdrVAlign="center";
hdrHeight="0";
linkFontFamily="Verdana";
linkFontSize="2";
linkBGColor="white";
linkOverBGColor="#FFFFFF";
linkTarget="_top";
linkAlign="Left";

barBGColor="";
barFontFamily="Verdana";
barFontSize="2";
barFontColor="white";
barVAlign="center";
barWidth=30; // no quotes!!
barText='<IMG SRC="../SlideMenu/slideheader.png">'; // <IMG> tag supported. Put exact html for an image to show.

///////////////////////////


    var url = window.location.toString();
    
    var query_string = url.split("?");
    
    var param_item = query_string[1].split("=");
    
     var ClaimID = param_item[1].split(",");



    
ssmItems1[0]=['<IMG src="../Images/buttons/IconPersonalInjury.gif" border="0">', "../PersonalInjuryForm.aspx?ClaimID=" + ClaimID, "_blank"]
ssmItems1[1]=['<IMG src="../Images/buttons/ClaimAdvice.gif" border="0">', "../ClaimAdviceForm.aspx?ClaimID=" + ClaimID, "_blank"]
ssmItems1[2]=['<IMG src="../Images/buttons/CarhireIcon.gif" border="0">', "../CarHireForm.aspx?ClaimID=" + ClaimID, "_blank"]
ssmItems1[3]=['<IMG src="../Images/buttons/PaymentIcon.gif" border="0">', "../PaymentRequestLetter.aspx?ClaimID=" + ClaimID, "_blank"]
ssmItems1[4]=['<IMG src="../Images/buttons/UsefulIcon.gif" border="0">', "../UsefulDates.aspx?ClaimID=" + ClaimID, "_blank"]
ssmItems1[5]=['<IMG src="../Images/buttons/IconAddDates.gif" border="0">', "../LossofUsedDates.aspx?ClaimID=" + ClaimID, "_blank"]

buildMenu1();

