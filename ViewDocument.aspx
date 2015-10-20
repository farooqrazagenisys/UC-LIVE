<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocument.aspx.cs" Inherits="UC_LIVE.ViewDocument" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #maindiv
        {
            width: 800px;
            text-align: center;
            margin: 0 auto;
        }
        #ViewDescription
        {
            font-size: medium;
        }
        #ViewContactInfo
        {
            text-align: left;
            margin-left: 45px;
            margin-top: 25px;
            font-size: 12px;
            line-height: 1.5em;
            font-family: Arial;
            width: 696px;
        }
        #ViewDescription
        {
            text-align: left;
            margin-left: 25px;
            margin-right: 25px;
            margin-top: 25px;
            font-size: 12px;
            line-height: 1.5em;
            font-family: Arial;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="maindiv">
        <div style="height: 1157px;">
            <div id="DocumentHeader" runat="server">
            </div>
            <div id="ViewTitle" runat="server">
            </div>
            <div id="ViewContactInfo" runat="server" style="text-align: left; width: 550px; float: left;
                margin-left: 25px;">
            </div>
            <div id="ClaimReference" runat="server" style="width: 200px; padding-top: 30px; float: left;
                font-family: Arial; font-size: 12px; text-align: left;">
            </div>
            <div id="ViewDescription" runat="server" style="clear: both; padding-top: 20px;">
            </div>
                      <div id="FooterValue" runat="server" style="margin-bottom:5px;">
        </div>
        </div>
  
    </div>

    </form>
</body>
</html>
