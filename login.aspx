<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UC_LIVE.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
		
input[type="text"], textarea, select, checkboxes, input[type="password"]
{
    font-family: Arial, Sans-Serif;
    font-size: 13px;
    margin-bottom: -15px;
    display: block;
    padding: 4px;
    border: solid 1px #CCCCCC; 
    width: 135px; 
    background-image:url(../Images/inputfield_bg.png);
    margin-right:10px;
    margin-top:2px;
    background-repeat:repeat-x;
    font-weight:bold;
} 

</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div style="background-image:url(Images/LoginBg.png);">
	<div style="margin-left:100px; margin-top:20px;    width: 850px; height: 460px;">
		<br />
		<br />
		<br />
		<asp:Login ID="Login1" runat="server"  BackColor="#F8F8F8" BorderColor="#FCFCFCc" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" Height="164px" Width="475px">
		<TitleTextStyle CssClass="headingbg"/>
	</asp:Login>
		<br />
		<br />
		<br />
		<br />
		<asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#F8F8F8" BorderColor="#FCFCFCc" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" Height="131px" Width="473px">
			<TitleTextStyle CssClass="headingbg"/>
		</asp:PasswordRecovery>
		<br />
	</div>
	</div>
</asp:Content>
