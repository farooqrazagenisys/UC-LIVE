<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="userlist.aspx.cs" Inherits="UC_LIVE.userlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<div style="margin-left:100px; margin-right:50px; margin-top:50px;    width: 850px; height: 460px;">
	<br />
	<br />
	Find Users<br />
	<br />
	<br />
	Enter Username&nbsp;
	<asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox> 
	
	<br />
	<br />
	<asp:Button ID="FindUsers" runat="server" Text="Find Users" onclick="FindUsers_Click" />
	
	<br />
	
	<asp:GridView ID="GridView1" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None">
		<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
		<RowStyle BackColor="#EFF3FB" />
		<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
		<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
		<EditRowStyle BackColor="#2461BF" />
		<AlternatingRowStyle BackColor="White" />
	</asp:GridView>
	<br />
	<br />
	</div>
</asp:Content>
