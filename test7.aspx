<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test7.aspx.cs" Inherits="UC_LIVE.test7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="915" CssClass="ajax__tab_lightblue-theme">
	<cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
		<HeaderTemplate>
			Standard
		
		
</HeaderTemplate>
		


<ContentTemplate>
		standard data
		<asp:Panel>
		     
		     
		     	</asp:Panel>
		
		
		
		
		
		
</ContentTemplate>
		


</cc1:TabPanel>
		<cc1:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
		<HeaderTemplate>
			Premier
		
		
</HeaderTemplate>
		


<ContentTemplate>
		Premier data
		
		
</ContentTemplate>
		


</cc1:TabPanel>
		<cc1:TabPanel runat="server" HeaderText="TabPanel3" ID="TabPanel3">
		<HeaderTemplate>
			Family
		
		
</HeaderTemplate>
		


<ContentTemplate>
		Family data
		
		
</ContentTemplate>
		


</cc1:TabPanel>
		
		
		</cc1:TabContainer>
</asp:Content>
