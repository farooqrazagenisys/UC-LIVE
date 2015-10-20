<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="gridtestvalue.aspx.cs" Inherits="UC_LIVE.gridtestvalue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- content start -->
    <div class="module">
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
        function onRequestStart(sender, args) {
            if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
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
        AllowPaging="True" runat="server" GridLines="None" Width="100%"
        OnItemCommand="RadGrid1_ItemCommand"  Skin="Windows7" 
        style="margin-bottom: 0px">
        <ExportSettings HideStructureColumns="true" />
        <MasterTableView Width="100%" CommandItemDisplay="Top" 
            AutoGenerateColumns="False">
            <Columns>
                <telerik:GridBoundColumn DataField="CarHireID" DataType="System.Int32" 
                    HeaderText="CarHireID" ReadOnly="True" SortExpression="CarHireID" 
                    UniqueName="CarHireID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CarID" DataType="System.Int32" 
                    HeaderText="CarID" SortExpression="CarID" UniqueName="CarID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ContactID" DataType="System.Int32" 
                    HeaderText="ContactID" SortExpression="ContactID" UniqueName="ContactID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CarHireCompany" DataType="System.Int32" 
                    HeaderText="CarHireCompany" SortExpression="CarHireCompany" 
                    UniqueName="CarHireCompany">
                </telerik:GridBoundColumn>
            </Columns>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <CommandItemSettings ShowExportToWordButton="true" ShowExportToExcelButton="true"
                ShowExportToCsvButton="true" />
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSource1" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CarhireForm]" InsertCommand="insert into CarhireForm CarHireID, CarID, ContactID, CarHireCompany values(@CarHireID,@CarID, @ContactID, @CarHireCompany)"
        runat="server"></asp:SqlDataSource>
    <!-- content end -->
       
</asp:Content>
