<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="claims.aspx.cs" Inherits="UC_LIVE.claims" %>
<%@ Register src="Controls/ViewClaims.ascx" tagname="ViewClaims" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/grid.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
	<div style="float:left; width:950px;  background-color:White;"  >
	<div class="MainHeading">View Claims</div>
	<div style="padding-left:20px;">
    <uc1:ViewClaims ID="ViewClaims1" runat="server" />
    </div>
    </div>
</asp:Content>
