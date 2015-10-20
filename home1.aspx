<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="home1.aspx.cs" Inherits="UC_LIVE.home" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Controls/ViewClaims.ascx" TagName="ViewClaims" TagPrefix="uc2" %>
<%@ Register Src="Controls/ViewTaskList.ascx" TagName="ViewTaskList" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 950px; height: 950px; background-color: #FFF">
        <div style="width: 475px; float: left; margin-left: 12px;">
            <div style="width: 450px; margin-top: 20px; margin-right: 0px; margin-left: 10px;">
                <div style="float: left;">
                    <a href="AddClaim.aspx">
                        <img src="Images/Dashboard/Icon_new.png" border="0" alt="Add New Claim" /></a></div>
                <div style="float: left; padding-left: 10px; width: 89px;">
                    <a href="SearchClaims.aspx?action=latest">
                        <img src="Images/Dashboard/Icon_search.png" border="0" alt="Search Claims"/></a></div>
      <%--          <div style="float: left; padding-left: 10px;">
                    <a href="SampleReport.aspx">
                    <img src="Images/Dashboard/Icon_accounts.png" border="0" /></a></div>--%>
                <div style="float: left; padding-left: 10px; width: 82px;">
                    <a href="SearchContacts.aspx">
                        <img src="Images/Dashboard/Icon_clients.png" border="0" alt="Search Clients" /></a></div>
                             <div style="float: left; padding-left: 10px; padding-top:2px;">
                         <a href="exportcontacts.aspx">
                        <img src="Images/Dashboard/Icon_export.png" border="0" alt="Export Contacts"/></a></div>
                          <div style="float: left; padding-left: 10px;">
                         <a href="SendSMS.aspx">
                        <img src="Images/Dashboard/Icon_sms.png" border="0" alt="Send SMS" /></a></div>
       
                   
                     
                   
            </div>
            <div style="width: 440px; float: left; height: 235px; margin-top: 20px; margin-left: 10px;">
                <uc3:ViewTaskList ID="ViewTaskList1" runat="server" />
            </div>
        </div>
        <div style="float: left; width: 430px; margin-right:10px; margin-top: 20px; height: 200px; background-color: #FFF">
            <telerik:RadChart ID="RadChart1" runat="server" Height="269px" Skin="Default2006"
                Width="446px" AutoLayout="True" AutoTextWrap="True" DataSourceID="ChartDataSource"
                DefaultType="Pie">
                <Series>
                    <telerik:ChartSeries Name="ClaimType" DataYColumn="Column1" DataLabelsColumn="ClaimType"
                        Type="Pie">
                        <Appearance>
                            <FillStyle MainColor="150, 150, 150" SecondColor="194, 194, 194">
                            </FillStyle>
                            <Border Color="Silver" />
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <PlotArea>
                    <XAxis>
                        <Appearance Color="Silver" MajorTick-Color="Silver">
                            <MajorGridLines Color="Silver"></MajorGridLines>
                        </Appearance>
                    </XAxis>
                    <YAxis>
                        <Appearance Color="Silver" MinorTick-Color="Silver" MajorTick-Color="Silver">
                            <MajorGridLines Color="Silver"></MajorGridLines>
                            <MinorGridLines Color="224, 224, 224" />
                        </Appearance>
                    </YAxis>
                    <Appearance Dimensions-Margins="18%, 22%, 12%, 10%">
                        <FillStyle MainColor="White" FillType="Solid" SecondColor="White">
                        </FillStyle>
                        <Border Color="Silver" />
                    </Appearance>
                </PlotArea>
                <Appearance>
                    <FillStyle MainColor="WhiteSmoke">
                    </FillStyle>
                    <Border Color="Silver" />
                </Appearance>
                <ChartTitle>
                    <Appearance Position-AlignedPosition="Top">
                    </Appearance>
                    <TextBlock Text="Claim Types">
                        <Appearance TextProperties-Color="Gray" TextProperties-Font="Microsoft San Sarif">
                        </Appearance>
                    </TextBlock>
                </ChartTitle>
                <Legend>
                    <Appearance Dimensions-Margins="18%, 1%, 1px, 1px">
                        <Border Color="Silver" />
                    </Appearance>
                </Legend>
            </telerik:RadChart>
            <asp:SqlDataSource ID="ChartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT ClaimTypes.ClaimType, Sum(Claim.ClaimId)
FROM Claim, ClaimTypes where Claim.ClaimTypeID=ClaimTypes.ClaimTypeID

GROUP BY ClaimType"></asp:SqlDataSource>
        </div>
        <div style="float: right;">
            <%--<div style="width:850px;" >
<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/Icons/latestclaims.png" onclick="ImageButton1_Click" />
</div>--%>
            <div style="width: 925px; clear: both;">
                <asp:Panel ID="Panel1" runat="server">
                    <uc2:ViewClaims ID="ViewClaims1" runat="server" />
                </asp:Panel>
            </div>
</asp:Content>
