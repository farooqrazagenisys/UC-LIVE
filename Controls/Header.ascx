<%@ Control AutoEventWireup="false" Inherits="Telerik.QuickStart.Header" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.QuickStart"%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/search.ascx" TagPrefix="qsf" TagName="Search" %>
<%@ Register Src="~/Common/HeaderProductsBar.ascx" TagPrefix="qsf" TagName="HeaderProductsBar" %>
<%@ Register Src="~/Common/HeaderSEOInfo.ascx" TagPrefix="qsf" TagName="HeaderSEOInfo" %>
<%@ Register Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Import Namespace="Telerik.QuickStart" %>

<qsf:HeaderSEOInfo ID="hsi1" runat="server" />

<div class="head1 qsfClear">
<a href="~/" class="radLogo" id="radLogo" runat="server">ASP.NET Controls</a>

<qsf:HeaderProductsBar ID="hpb1" runat="server" />

</div> <!-- head1 -->

<div class="head2 qsfClear">
<div class="qsfSearch"><qsf:Search runat="server" ID="Search1" /></div>
<ul class="qsfLinks">
<li><a class="download" href="http://www.telerik.com/account/free-trials.aspx" onclick="return openInNewWindow(this)">Download</a></li>
<%--<li><a class="videos" href="http://tv.telerik.com/" onclick="return openInNewWindow(this)">Videos</a></li>
<li><a class="help" href="http://www.telerik.com/support/documentation-and-tutorials.aspx" title="RadControls Online Documentation" onclick="return openInNewWindow(this)">Help</a></li>--%>
<li><a class="forums" href="http://www.telerik.com/support.aspx" onclick="return openInNewWindow(this)">Support Resources</a></li>
</ul>
</div> <!-- head2 -->

<table class="qsfTable" cellspacing="0" summary="Telerik RadControls for ASP.NET AJAX">
<tr>
<td class="qsfLeft">
	<asp:PlaceHolder ID="leftNavigation" Runat="server" />
</td> <!-- qsfLeft -->
<td class="qsfRight">

<div class="titleRight">
	<div class="titleLeft qsfClear">
		<h1>
			<asp:Literal runat="server" id="ProductImage" />
			<asp:HyperLink runat="server" ID="ProductHyperLink"><%= ProductInfo.ControlName%></asp:HyperLink> / <asp:Literal runat="server" ID="ExampleName" />
		</h1>
		<asp:Panel ID="QsfRatingPanel" runat="server" CssClass="demoRate qsfClear">
			<em>Rate this demo:</em>
			<telerik:RadRating ID="RadRating1" runat="server" ItemCount="5" SelectionMode="Continuous" Precision="Item" OnClientLoad="OnClientQSFDemoLoad"
				OnClientRated="OnClientQSFDemoRated" Skin="WebBlue" EnableToolTips="false" ToolTip="Rate this demo and provide feedback." />
			<em><asp:LinkButton ID="FeedbackButton" runat="server" Text="Feedback" OnClientClick="ShowQSFDemoCommentToolTip(); return false;"></asp:LinkButton></em>
			<telerik:RadXmlHttpPanel ID="RadXmlHttpPanel1" runat="server" OnClientResponseEnded="OnClientQSFDemoCommentResponseEnded" 
				OnServiceRequest="RadXmlHttpPanel1_ServiceRequest" EnableClientScriptEvaluation="true"></telerik:RadXmlHttpPanel>
		</asp:Panel>
	</div>
</div>

<script type="text/javascript">
var qsfDemoWebServicePath = '<%= ResolveUrl("~/Common/RatingWebService.asmx") %>';
var qsfCurrentDemo = "<%= HttpContext.Current.Request.Url.AbsolutePath.ToLowerInvariant() %>";
var qsfDemoCommentXmlHttpPanelId = "<%= RadXmlHttpPanel1.ClientID %>";
</script>

<div class="demoArea qsfClear">

	<div class="codeNskin">
		Run example in: <asp:HyperLink runat="server" id="CSharpLink" Text="C#" EnableViewState="false" /> <asp:HyperLink runat="server" id="VBLink" Text="VB.NET" EnableViewState="false" />
		<asp:PlaceHolder runat="server" ID="SkinPanel">
			<span>Change Skin:</span><telerik:QSFSkinManager runat="server" ID="RadSkinManager1" ShowChooser="True" PersistenceKey="QsfSkin" PersistenceMode="Session" Skin="Vista" />
		</asp:PlaceHolder>
	</div>

	<div class="innerArea qsfClear" id="exampleContainer">
	
	<asp:Panel runat="server" ID="DbResetPanel" CssClass="infoPanel">
	<div id="qsfDbResetNotice" class="infoInner">
		Next database reset in <strong id="qsfResetTimeout" runat="server"></strong>
	</div>
	</asp:Panel>
