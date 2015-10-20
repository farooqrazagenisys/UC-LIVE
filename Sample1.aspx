<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sample1.aspx.cs" Inherits="UC_LIVE.Sample1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
   
    
 <div style="height:800px; width:948px; margin-right: 0px; background-color:White; border:solid 1px buttonface;">



<div class="MainHeading">Add Claim Details</div>

    <div >
    
    
    
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" MultiPageID="RadMultiPage1" SelectedIndex="0">
        
        <Tabs>
        <telerik:RadTab Text="1- Client Information" runat="server" TabIndex="0">
        
      
        
        </telerik:RadTab>
        <telerik:RadTab Text="2- Accident Circumstances" runat="server" TabIndex="1">
        
        
        
        </telerik:RadTab>
         <telerik:RadTab Text="3- Witnesses" runat="server"  TabIndex="2"></telerik:RadTab>
          <telerik:RadTab Text="4- Hospital & GP" runat="server"  TabIndex="3"></telerik:RadTab>
           <telerik:RadTab Text="5- Additonal Information" runat="server"  TabIndex="4"></telerik:RadTab>
                   <telerik:RadTab Text="6- Complete Claim" runat="server"  TabIndex="5"></telerik:RadTab>
        </Tabs>
        
        
        
        </telerik:RadTabStrip>
    
   <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" 
                Width="345px" CssClass="bodytext">
                
                <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="0">
              <div style="margin:10px; clear" class="bodytext" >
              
      <div style="float:left; padding-right:5px;"><br />    
      <telerik:RadComboBox ID="RadComboBox1" runat="server" Skin="Windows7" Width="50">
       
              <Items>
                  <telerik:RadComboBoxItem runat="server" Text="Mr" Value="RadComboBoxItem1" />
                  <telerik:RadComboBoxItem runat="server" Text="Mrs" Value="RadComboBoxItem2" />
                  <telerik:RadComboBoxItem runat="server" Text="Miss" Value="RadComboBoxItem3" />
                         <telerik:RadComboBoxItem runat="server" Text="MS" Value="RadComboBoxItem3" />
                                <telerik:RadComboBoxItem runat="server" Text="Dr" Value="RadComboBoxItem3" />
              </Items>
       
          </telerik:RadComboBox>
         
              
                 </div>
                 
                       <div style="float:left;">  First Name<br />    
         <telerik:RadNumericTextBox ID="RadNumericTextBox2" runat="server" Skin="Windows7" Culture="English (United Kingdom)" Width="125px" Type="Currency">
                  </telerik:RadNumericTextBox>
           
              
                 </div>
                 
                   
              
           </div>    
                </telerik:RadPageView>
   
                <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="1">
              
              
         
              dafs
                                
                  </telerik:RadPageView>
                    
                    
                <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="2"> 
                   
                   witnesss
                   
                   </telerik:RadPageView>
                   
                        <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="3">
                   
                   at falut
                   
                   </telerik:RadPageView>
                   
                        <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="4">
                   
                   sdfa
                   
                   </telerik:RadPageView>
                   
                        <telerik:RadPageView ID="RadPageView6" runat="server" TabIndex="5">
                   
                 dsfah
                   
                   </telerik:RadPageView>
                   
                             <telerik:RadPageView ID="RadPageView7" runat="server" TabIndex="6">
                   
               sadf
                   
                   </telerik:RadPageView>
                   
                         
                   
                   
                   
                   
                   </telerik:RadMultiPage>
                   
    
    </div>
 
 </div>
    
    
    
    
   
    
    
</asp:Content>
