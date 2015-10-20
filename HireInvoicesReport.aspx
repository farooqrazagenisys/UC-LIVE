<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HireInvoicesReport.aspx.cs" Inherits="UC_LIVE.HireInvoicesReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div style="margin-bottom: 10px; width: 944px; background-color: White; border: solid 1px buttonface;">
<br /> <div style="margin-left:22px;">
         <telerik:RadTabStrip ID="HireInvoiceReport" runat="server" Skin="Windows7" 
            MultiPageID="RadMultiPage12" Height="30px" Width="900px" SelectedIndex="0">
            <Tabs>
                <telerik:RadTab runat="server" Text="Pending Invoices" 
                    PageViewID="RadPageView1" ID="Pending" Selected="True">                
                </telerik:RadTab>
                 <telerik:RadTab runat="server" Text="Paid Invoices" PageViewID="RadPageView2" ID="Paid">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Partially Paid" PageViewID="RadPageView3" ID="PartialPaid">
                </telerik:RadTab>           
              
            </Tabs>
                    </telerik:RadTabStrip>
            
            <telerik:RadMultiPage ID="RadMultiPage12" runat="server" SelectedIndex="0" CssClass="bodytext">
                <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="0">
               
              <iframe runat="server" ID="PendingInvoicesReport" width="900" height="400"></iframe>
               
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="1">
          <iframe runat="server" ID="PaidInvoicesReport" width="900" height="400" ></iframe>
            </telerik:RadPageView>
              <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="2">
                         <iframe runat="server" ID="PartiallyPaid" width="900" height="400"></iframe>
            </telerik:RadPageView>
           
            
            
            </telerik:RadMultiPage>
            
        </telerik:RadTabStrip>
        </div></div>

</asp:Content>
