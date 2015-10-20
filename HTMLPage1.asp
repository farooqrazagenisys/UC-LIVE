<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
</head>
<body>

<%
'The Example HTML form and ASP code for sending a message
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Send a Message</TITLE>
</HEAD>
<BODY>
<%
if Request.Querystring("Action") = "Send" then
%>
<!--#include file="api_connect.asp"-->
<%
'// Verify that the parameters are correct
errorMessage=""
destinationaddress = request.querystring("DestinationAddress")
if Len(destinationaddress) < 1 or IsNumeric(destinationaddress) = false then
errorMessage = errorMessage & "Invalid Destination Address<br>"
end if
sourceaddress = request.querystring("SourceAddress")
if Len(request.querystring("SourceAddress")) < 1 or
(isNumeric(request.querystring("SourceAddress")) = false and len(sourceaddress) > 11)
or (isNumeric(request.querystring("SourceAddress")) = false AND len(sourceaddress) >
20) then
errorMessage = errorMessage & "Invalid Source Address<br>"
© Copyright NetSecrets Ltd 2009. All Rights Reserved. Company Registration No.: 04439226
FASTSMS (A Division Of NetSecrets Ltd)
Stockwood Business Park, Worcestershire B96 6SX
Tel: 0800 954 5305 Fax: 0870 479 3791 Email: helpdesk@fastsms.co.uk
end if
body = request.querystring("body")
if len(body) > 160 or len(body) < 1 then
errorMessage = errorMessage & "Invalid Message Body<br>"
end if
if len(errorMessage) = 0 then
'send the thing!
Set ParametersDict = CreateObject("Scripting.Dictionary")
ParametersDict.Add "Action", "Send"
ParametersDict.Add "DestinationAddress", destinationaddress
ParametersDict.Add "SourceAddress", sourceaddress
ParametersDict.Add "Body", body
ParametersDict.Add "ValidityPeriod", "86400"
resultcode = api_connect("MyUserName", "MyPassword", ParametersDict)
if resultcode > 0 then
response.write "Thank you, your message has been sent. The message ID is: " &
resultcode
else
response.write "An error occurred in sending your message. ID: " & resultcode
end if
else
response.write "An Error Occurred: " & errorMessage
end if
response.write "<hr>"
end if
%>
<!-- A Basic HTML Form for sending a message with the API -->
<FORM
action="http://<%=Request.ServerVariables("HTTP_HOST")%><%=Request.ServerVaria
bles("URL")%>" method="GET" name="sendForm">
<input type="hidden" name="Action" value="Send">
Destination Address: <INPUT name="DestinationAddress"
value="<%=Request.QueryString("DestinationAddress")%>">
<br>
Source Address: <INPUT name="SourceAddress"
value="<%=Request.QueryString("SourceAddress")%>">
<br>
Message: <TEXTAREA name="Body" rows="5"
cols="30"><%=Request.QueryString("body")%></TEXTAREA>
<br>
<INPUT type="Submit" value="Send Message">
</FORM>
</BODY>
</HTML>

</body>
</html>
