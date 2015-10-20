<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="UC_LIVE.WebForm4" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Button ID="Button1" runat="server" Text="Show" onclick="showContents" />
    <asp:Button ID="Button2" runat="server" Text="Hide" onclick="hideContents" />
  
   <asp:Panel ID="Panel1" runat="server" Visible="false">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [ClaimTitle] FROM [Claim]" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>
    
    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" 
    DynamicHorizontalOffset="2"  onmenuitemclick="Menu1_MenuItemClick" 
    StaticSubMenuIndent="10px" CssClass="tab">
    <StaticSelectedStyle CssClass="StaticSelectedStyle"/>
    <StaticMenuItemStyle CssClass="StaticMenuItemStyle"/>
    <DynamicHoverStyle CssClass="DynamicHoverStyle" />
    <DynamicMenuStyle CssClass="DynamicMenuStyle"/>
    <DynamicSelectedStyle CssClass="DynamicSelectedStyle" />
    <DynamicMenuItemStyle CssClass="DynamicMenuItemStyle"/>
    <StaticHoverStyle CssClass="StaticHoverStyle" />
    <Items>
        <asp:MenuItem Text="Tab1" Value="0" Selected="true"></asp:MenuItem>
        <asp:MenuItem Text="Tab2" Value="1"></asp:MenuItem>
        <asp:MenuItem Text="Tab3" Value="2"></asp:MenuItem>
        <asp:MenuItem Text="Tab4" Value="3"></asp:MenuItem>
        <asp:MenuItem Text="Tab5" Value="4"></asp:MenuItem>
        <asp:MenuItem Text="Tab6" Value="5"></asp:MenuItem>
    </Items>

  </asp:Menu>

    <div class="tabContents">
<asp:MultiView runat="server" ActiveViewIndex="0" ID="multiTabs">
    <asp:View ID="View1" runat="server">
    View 1 <asp:Button runat="server" Text="Button" onclick="Unnamed1_Click"  />   
    </asp:View>
    
    <asp:View ID="View2" runat="server">
     View 2
    </asp:View>
    <asp:View ID="View3" runat="server">
    View 3
    </asp:View>
      <asp:View ID="View4" runat="server">
    View 4  
    </asp:View>
    <asp:View ID="View5" runat="server">
    View5
    </asp:View>
    <asp:View ID="View6" runat="server">
    View 6
    </asp:View>
    </asp:MultiView>
  </div>
  </asp:Panel>


</asp:Content>

