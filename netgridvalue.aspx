<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="netgridvalue.aspx.cs" Inherits="UC_LIVE.netgridvalue" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
.customheaderstyle
{
 
    background-color:Gray;
    font-family:Microsoft Sans Serif;
    text-align:left;
    height:25px;
    font-size:11px;
    
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" HeaderStyle-CssClass="customheaderstyle" Width="920">
        <Columns>
            <asp:BoundField DataField="CarHireID" HeaderText="CarHireID" 
                InsertVisible="False" ReadOnly="True" SortExpression="CarHireID" />
            <asp:BoundField DataField="CarID" HeaderText="CarID" SortExpression="CarID" />
            <asp:BoundField DataField="ContactID" HeaderText="ContactID" 
                SortExpression="ContactID" />
            <asp:BoundField DataField="CarHireCompany" HeaderText="CarHireCompany" 
                SortExpression="CarHireCompany" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [CarhireForm]"></asp:SqlDataSource>
</asp:Content>
