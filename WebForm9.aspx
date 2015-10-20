<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="UC_LIVE.WebForm9" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<telerik:RadTimeView ID="RadTimeView1" runat="server">
</telerik:RadTimeView>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <telerik:GridRatingColumnEditor ID="GridRatingColumnEditor1" runat="server" />
    <telerik:RadDateTimePicker ID="RadDateTimePicker1" Runat="server" Culture="English (United Kingdom)">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<TimeView CellSpacing="-1" Culture="English (United Kingdom)"></TimeView>

<TimePopupButton ImageUrl="" HoverImageUrl=""></TimePopupButton>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>
    </telerik:RadDateTimePicker>
    <div>
    
        <br />
        <br />
        <br />
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" GridLines="None" ShowGroupPanel="True">
<MasterTableView AutoGenerateColumns="False" DataKeyNames="ClaimContactID" DataSourceID="SqlDataSource1">
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
        <telerik:GridBoundColumn DataField="ClaimContactID" DataType="System.Int32" HeaderText="ClaimContactID" ReadOnly="True" SortExpression="ClaimContactID" UniqueName="ClaimContactID">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ClaimID" HeaderText="ClaimID" SortExpression="ClaimID" UniqueName="ClaimID">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ContactID" DataType="System.Int32" HeaderText="ContactID" SortExpression="ContactID" UniqueName="ContactID">
        </telerik:GridBoundColumn>
    </Columns>
</MasterTableView>
            <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                <Selecting AllowRowSelect="True" />
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimContactID], [ClaimID], [ContactID] FROM [ClaimContact]"></asp:SqlDataSource>
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="2" Skin="Default">
            <Tabs>
                <telerik:RadTab runat="server" Text="Root RadTab1">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Root RadTab2">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Root RadTab3" Selected="True">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="Child RadTab 1">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Child RadTab 2">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Child RadTab 3">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Child RadTab 4">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
    
    </div>
    </form>
</body>
</html>
