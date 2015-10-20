<%@ Control Language="c#" AutoEventWireup="false" Inherits="Telerik.QuickStart.HeadTag" %>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="en" />
<meta name="description" content="<%= Description %>" />
<meta name="keywords" content="<%= KeyWords %>" />
<meta name="author" content="Telerik" />
<meta name="ResourceType" content="Demo" />
<meta name="ProductId" content="561" />
<meta name="ProductId" content="<%= ProductID %>" />


<%-- Use relative paths for the stylesheets and scripts in the <link> place holders below. 
     Page.ResolveUrl will be called on the server.
     A <script> element will be rendered for the scripts instead of the second <link>. --%>
<link runat="server" ID="QsfStyleSheetsLink" href="~/Common/styles09/qsf.css?2010q2" type="text/css" rel="stylesheet" />
<link runat="server" ID="QsfScriptsLink" href="~/Common/qsf.js?2010q2" type="text/javascript" /><asp:PlaceHolder runat="server" ID="ScriptTagPlaceHolder"></asp:PlaceHolder>

<link rel="icon" href="<%= Page.ResolveUrl("~/favicon.ico") %>" type="image/x-icon" />
<asp:PlaceHolder ID="RadStyleSheetManagerPlaceHolder" runat="server" />