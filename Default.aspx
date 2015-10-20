<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UC_LIVE.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div>




	<div style="margin-left:120px; width: 709px; height:130px; margin-top:30px; border:1px solid gray">
<div class="headingbg" id="DivWelcome" runat="server"></div>

<div style="margin-left:200px; margin-top:30px;">

		<asp:Button ID="AddNewClaim" runat="server" Text="Add New Claim" onclick="AddNewClaim_Click"/>
</div>
</div>

</div>

</asp:Content>
