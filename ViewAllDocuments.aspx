<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAllDocuments.aspx.cs" Inherits="UC_LIVE.ViewAllDocuments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div>
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" 
            MultiPageID="RadMultiPage1" Height="23px" Width="950px">
            <Tabs>
                <telerik:RadTab runat="server" Text="Personal Injury Form" PageViewID="RadPageView1">
                
                </telerik:RadTab>
                 <telerik:RadTab runat="server" Text="RTA Form" PageViewID="RadPageView2">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Accident Claim Form" PageViewID="RadPageView3">
                </telerik:RadTab>
               
                <telerik:RadTab runat="server" Text="CarHireForm" PageViewID="RadPageView4">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Payment Request Letter" PageViewID="RadPageView5">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Loss of Used Dates" PageViewID="RadPageView6">
                </telerik:RadTab>
              
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="bodytext">
                <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="0">
               
              <iframe runat="server" ID="PersonInjuryForm" width="950" height="900"></iframe>
               
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="0">
          <iframe runat="server" ID="RTAFrom" width="950" height="900" ></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="0">
                         <iframe runat="server" ID="ClaimAdviceForm" width="950" height="900"></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="0">
                        <iframe runat="server" ID="NewCarHireForm" width="950" height="900"></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="0">
                  <iframe runat="server" ID="PaymentRequestLetter" width="950" height="900"></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView6" runat="server" TabIndex="0">
               <iframe runat="server" ID="LossOfUsedDates" width="950" height="900"></iframe>
            </telerik:RadPageView>
            
<%--            <%# Request.QueryString["ClaimID"].ToString() %>--%>
            
            
            
            </telerik:RadMultiPage>
    </div>
    </form>
</body>
</html>
