<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PrintDocuments.aspx.cs" Inherits="UC_LIVE.PrintDocuments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div style="margin-bottom: 10px; width: 950px; background-color: White; border: solid 1px buttonface;">
        
             <div class="MainHeading" style="float: left; ">Claim Documents</div>
           <div style="width:100px; margin-top:17px; float:right; margin-right:19px; font-size:12px; "> <a id="ClaimDetails" runat="server" class="bodytext" > << Claim Details </a></div>
        
        
        <div style="clear:both"></div>        
          
          <div style="margin-left:22px;">
          
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" 
            MultiPageID="RadMultiPage1" Height="30px" Width="900px" SelectedIndex="3">
            <Tabs>
                <telerik:RadTab runat="server" Text="Personal Injury Form" PageViewID="RadPageView1" ID="PersonalInjury">
                
                </telerik:RadTab>
                 <telerik:RadTab runat="server" Text="RTA Form" PageViewID="RadPageView2" ID="RTAForm">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="ABI Claim Form" PageViewID="RadPageView3" ID="AccidentClaimForm">
                </telerik:RadTab>
               
                <telerik:RadTab runat="server" Text="Car Hire Form" PageViewID="RadPageView4" 
                    ID="CarHireForm" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Payment Request Letter" PageViewID="RadPageView5" ID="PaymentRequest">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Loss of Use Dates" PageViewID="RadPageView6" ID="UsedDates">
                </telerik:RadTab>
              
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="3" 
                  CssClass="bodytext">
                <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="0">
               
              <iframe runat="server" ID="PersonInjuryForm" width="900" height="2300"></iframe>
               
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="0">
          <iframe runat="server" ID="RTAFrom" width="900" height="2300" ></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="0">
                         <iframe runat="server" ID="ClaimAdviceForm" width="900" height="2300"></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="0">
                        <iframe runat="server" ID="NewCarHireForm" width="900" height="2300"></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="0">
                  <iframe runat="server" ID="PaymentRequestLetter" width="900" height="2300"></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView6" runat="server" TabIndex="0">
               <iframe runat="server" ID="LossOfUsedDates" width="900" height="2300"></iframe>
            </telerik:RadPageView>
            
<%--            <%# Request.QueryString["ClaimID"].ToString() %>--%>
            
           
            
            </telerik:RadMultiPage>
            </div>
            </div>
</asp:Content>
