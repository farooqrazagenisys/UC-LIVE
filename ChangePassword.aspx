<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="UC_LIVE.ChangePassword1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div style="width:950px; background-color:White; clear:both; ">
	
<div class="MainHeading">Change Your Password</div>
	<div style="
	     margin-left:25px; font-family:Verdana; font-size:14px; padding:10px; ">
	<asp:ChangePassword ID="ChangePassword3" runat="server" Height="201px" Width="543px" ContinueButtonText="" TitleTextStyle-ForeColor="White" PasswordLabelText="Old Password: " TextBoxStyle-Width="150" >
	
	</asp:ChangePassword>
	
	</div>
	</div>
</asp:Content>
