<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm13.aspx.cs" Inherits="UC_LIVE.WebForm13" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.QuickStart" %>
<%@ Register TagPrefix="telerik" TagName="Header" Src="~/Common/Header.ascx" %>
<%@ Register TagPrefix="telerik" TagName="HeadTag" Src="~/Common/HeadTag.ascx" %>
<%@ Register TagPrefix="telerik" TagName="Footer" Src="~/Common/Footer.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <telerik:Header runat="server" ID="Header1" NavigationLanguage="CS"></telerik:Header>
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
    <!-- content start -->
    <div class="module" style="height: 110px; width: 92%">
        <asp:CheckBox ID="CheckBox1" Text="Export only data" runat="server"></asp:CheckBox>
        <br />
        <asp:CheckBox ID="CheckBox2" Text="Ignore paging (exports all pages)" runat="server">
        </asp:CheckBox>
        <br />
        <asp:CheckBox ID="CheckBox3" Text="Open exported data in new browser window" runat="server">
        </asp:CheckBox>
        <br />
        <br />
<asp:Button ID="Button1" CssClass="button" Width="150px" Text="Export to Excel" OnClick="Button1_Click"
runat="server"></asp:Button>
<asp:Button ID="Button2" CssClass="button" Width="150px" Text="Export to Word" OnClick="Button2_Click"
runat="server"></asp:Button>
<asp:Button ID="Button3" CssClass="button" Width="150px" Text="Export to CSV" OnClick="Button3_Click"
runat="server"></asp:Button>
    </div>
    <br />

    <script type="text/javascript">
        function onRequestStart(sender, args)
        {
            if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0)
            {
                args.set_enableAjax(false);
            }
        }
    </script>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <ClientEvents OnRequestStart="onRequestStart" />
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadGrid ID="RadGrid1" DataSourceID="SqlDataSource1" AllowSorting="True"
        AllowPaging="True" PageSize="10" runat="server" GridLines="None" Width="95%"
        OnItemCommand="RadGrid1_ItemCommand">
        <ExportSettings HideStructureColumns="true" />
        <MasterTableView Width="100%" CommandItemDisplay="Top">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <CommandItemSettings ShowExportToWordButton="true" ShowExportToExcelButton="true"
                ShowExportToCsvButton="true" />
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, PostalCode FROM Customers"
        runat="server"></asp:SqlDataSource>
    <!-- content end -->
    <telerik:Footer runat="server" ID="Footer1"></telerik:Footer>


</asp:Content>
