<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewRecord.aspx.cs" Inherits="UC_LIVE.NewRecord" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="Controls/ContactDetails.ascx" tagname="ContactDetails" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	

	<div style="background-color:White; margin-top:0px;">
	 <div class="MainHeading" style="float:left;" runat="server" id="MainHeading">	
	
	</div>
<uc1:ContactDetails ID="ContactDetails1" runat="server" ViewMode="ContactDetails" />




	</div>
</asp:Content>
