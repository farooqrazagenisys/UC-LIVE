<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactDetails.ascx.cs" Inherits="UC_LIVE.Controls.ContactDetails" %>
<%--<%@ Register Assembly="ValidationAggregator" Namespace="ValidationAggregator" TagPrefix="cc2" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link href="../Styles/textstyles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style4
    {
        height: 48px;
    }
    .style8
    {
       
    }
    </style>


<%--  <div> 
              
               <asp:ValidationSummary ID="ValidationSummaryContact" HeaderText="You must enter a value in the following fields:" DisplayMode="BulletList" EnableClientScript="true" runat="server" ValidationGroup="ClaimValidation" />
                
             </div>  --%>
             
       <div style=""></div>      
              <div class="FormHeading" style="width:690px; font-size:16px;  padding: 10px 5px 8px 18px;
    color: #006699; float:left; " id="ContactInformation" runat="server">
                       Contact Information
                        
                        </div>
                    <div style="width:150px; font-size:16px;  padding: 10px 5px 8px 13px;
    color: #006699; float:left; " id="PersonalInformation" runat="server">
                      Personal Information
                        
                        
                        </div>
                        
                        <div style="margin-left:750px; margin-top:10px;" id="DisplayAddButton" runat="server" visible="false">
<asp:ImageButton ID="AddRecord" runat="server" Text="Add Record" OnClick="AddNewRecord" ValidationGroup="ClaimValidation"  ImageUrl="~/Images/Icons/AddContact.gif" AlternateText="Add New Contact"/>
<asp:Button ID="CancelButton1" runat="server" 
               Text="Cancel" onclick="CancelButton1_Click"  
                       />

</div>

<div style="margin-left:750px; margin-top:10px;" id="DisplayUpdateButton" runat="server" visible="false">
<asp:ImageButton ID="Updaterecord" runat="server" OnClick="UpdateRecordDetails"  AlternateText="Update Contact"
        ValidationGroup="ClaimValidation" Text="Update Record" 
        style="height: 25px" ImageUrl="~/Images/Icons/UpdateContact.gif" />
        </div>
                        
                        
  <table style="margin-left:18px;"> <tr><td valign="top" style="width:670px; background-color:#EEEEEE;">  
  
  
   <table style="width: 670px;   height:45px; " >
 <tr>
        
        
        <td  class="style8" style="padding-left:12px;padding-top:10px; width:90px;">
          <label>
               Title</label>
            <asp:DropDownList ID="Title" runat="server" Width="80">
                <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                <asp:ListItem Value="Ms">Ms.</asp:ListItem>
                <asp:ListItem Value="Miss">Miss.</asp:ListItem>
                <asp:ListItem Value="Dr">Dr.</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style8" Width="110" style="padding-top:10px; ">
            <label>
                First Name</label>
            <asp:TextBox ID="FirstNameTextBox" runat="server" Width="100"></asp:TextBox>
     
        </td>
        <td class="style8" Width="110" style="padding-top:10px;">
            <label>
                Surname</label>
            <asp:TextBox ID="SurnameTextBox" runat="server"></asp:TextBox>
        </td>
   <td class="style8" style="padding-top:10px; ">
            <asp:Label runat="server" ID="LabelCompany3" Text="Company Name"></asp:Label>
                       <asp:TextBox ID="CompanyTextBox1" runat="server"></asp:TextBox>
        </td>
        
     </tr>
    
     </table>
<div style="float:left;">
          <table style="width: 670px; vertical-align: top; height:40px; background-color:#EEEEEE;">
                           <tr>
        
        <td class="style8" style="padding-left:12px; width:70px; padding-top:10px;">
            <label>
                Address1</label>
            <asp:TextBox ID="Address1TextBox" runat="server" ></asp:TextBox>
        </td>
        <td class="style8" style="width:110px; padding-top:10px;">
            <label>
                Address2</label>
            <asp:TextBox ID="Address2TextBox" runat="server"></asp:TextBox>
        </td>
        <td class="style8" style="width:110px; padding-top:10px;">
            <label class="style8">
                City<br />
            </label>
            <asp:TextBox ID="CityTextBox" runat="server" Width="110"> </asp:TextBox>
        </td>
           <td class="style8" style="width:90px; padding-top:10px;"> 
         <div style="padding-bottom:2px; float:left">
                  Post Code
                  </div>
                <div style="padding-bottom:2px; float:left">  <asp:TextBox ID="PostCodeTextBox" runat="server" Width="70" MaxLength="9"></asp:TextBox></div>
          <div style="float:left">     <asp:RegularExpressionValidator ID="PostCodeTextBoxValidator" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Start Claim - Valid Post Code Required" Text="*" ControlToValidate="PostCodeTextBox" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" Display="dynamic" />
        </div>
        
        </td>
        
        <td class="style8" style="width:110; padding-top:10px;">
            <label>
                Country</label>
            <asp:TextBox ID="CountryTextBox" runat="server" Width="110" Text="United Kingdom"></asp:TextBox>
        </td>    
        </tr>
        </table>
          <table style="width: 670px; vertical-align: top;    height:40px; background-color:#EEEEEE;">
                           <tr>
          <td class="style8" style="padding-left:12px; width:120px; padding-top:10px; height:30px;">
        <div style="padding-bottom:2px;">
                  Phone
                  </div>
            <div style="float:left;">   <asp:TextBox ID="PhoneTextBox" runat="server" Width="100"></asp:TextBox></div>
              <div style="float:left;"> <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Start Claim - Valid Phone Required" Text="*" ControlToValidate="PhoneTextBox" Display="dynamic" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
        </div>
        </td>
        <td class="style8" style="width:120px; padding-top:10px;">
        <div style="padding-bottom:2px;">
                  Fax
                  </div>
           <div style="float:left;">    <asp:TextBox ID="FaxTextBox" runat="server" Width="100"></asp:TextBox></div>
              <div style="float:left;"> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Start Claim - Valid Fax Number Required" Text="*" ControlToValidate="FaxTextBox" Display="dynamic" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
        </div>
        </td>
        <td class="style8" style="width:120px; padding-top:10px;">
           <div style="padding-bottom:2px;">
                Mobile
                  </div>
             <div style="float:left;">  <asp:TextBox ID="MobileTextBox" runat="server" Width="100"></asp:TextBox></div>
            <div style="float:left;">   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Start Claim - Valid Mobile Required" Text="*" ControlToValidate="MobileTextBox" Display="dynamic" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
      </div>
        </td>
          <td class="style8" style="padding-top:10px;">
           <div style="padding-bottom:2px; padding-top:2px;">
                Email
        </div>
    <div style="float:left;"> <asp:TextBox ID="EmailTextBox" runat="server" Width="150"></asp:TextBox></div>
              <div style="float:left;"><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="ClaimValidation"  ControlToValidate="EmailTextBox" ValidationExpression="^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$" ErrorMessage="Start Claim - Valid Email Address Required" Text="*"/></div>
        </td>
            
            
            
            
        
    </tr>
 
    
    
</table>
</td><td valign="top"  style="background-color:#EEE; padding-left:12px;">

<table class="style8" style="padding-left:12px;">
                            <tr>
                            <td id="CompanyInfo1" runat="server" style="padding-top:10px;margin-left:2px;">
                            
    <asp:Label ID="ChooseCompany" runat="server" Text="Choose Company" Height="25"></asp:Label>
            <br />
                            
            <asp:DropDownList ID="ContactTypeID" runat="server" Width="130">
               
                <asp:ListItem Value="1" Text="Insurance">Insurance</asp:ListItem>
                <asp:ListItem Value="2" Text="Solicitor">Solicitor</asp:ListItem>
                <asp:ListItem Value="3" Text="Engineer">Engineer</asp:ListItem>
                <asp:ListItem Value="4" Text="CarHire">CarHire</asp:ListItem>
                <asp:ListItem Value="5" Text="Storage">Storage</asp:ListItem>
                <asp:ListItem Value="6" Text="Client">Client</asp:ListItem>
            </asp:DropDownList>
        </td>
     </tr><tr>
        <td id="CompanyInfo2" runat="server">
            <asp:Label ID="CompanyName" runat="server" Text="Company Name"></asp:Label>          
            <asp:TextBox ID="CompanyTextBox" runat="server" Width="199px"></asp:TextBox>
        </td>
        </tr>
        <tr>
         <td class="style8" id="CompanyInfo3" runat="server">
            <div style="padding-bottom:5px; width:150px;"><asp:Label ID="VATRegisteredLable" runat="server" Text="VAT Registered"></asp:Label>
            </div>
       
      <asp:DropDownList ID="VATApplicableChoice" runat="server">
                <asp:ListItem Value="Yes" Text="Yes">
                </asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </asp:DropDownList>
        </td>
        </tr>
  
  </table>

 <table style="width: 200px; vertical-align: top; padding-left:10px; height:60px; background-color:#EEEEEE;">
    <tr><td></td>
    
    </tr>
      
    
      <tr>
        <td class="style8" style="padding-left:12px; width:150px;">
           
           
           <div style="float:left"> <asp:Label ID="DOB" runat="server" Text="Date of Birth"></asp:Label></div>
             <div style="float:left"><asp:TextBox ID="DOBTextBox" runat="server"></asp:TextBox></div>
            <div style="float:left"> <cc1:CalendarExtender ID="DOBTextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="DOBTextBox" Format="dd/MM/yyyy">
            </cc1:CalendarExtender></div>
            <div style="float:left"> <asp:RegularExpressionValidator ID="DateValidator1" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Start Claim - Valid Date of Birth Required" Text="*" ControlToValidate="DOBTextBox" Display="dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
        
        </div>
        </td>
          </tr><tr>
           <td class="style8" style="padding-left:12px;">
            <asp:Label ID="NINumber1" runat="server" Text="NI Number"></asp:Label>
            &nbsp;<asp:TextBox ID="NINoTextBox" runat="server"></asp:TextBox>
        </td>
          </tr><tr>
     
          </tr><tr>
        <td class="style8" style="padding-left:12px;">
            <asp:Label ID="DriverInsurersTextBoxLabel" runat="server" Text="Insurer"></asp:Label>
            <asp:TextBox ID="DriverInsurersTextBox" runat="server"></asp:TextBox>
        </td>
          </tr><tr>
        <td class="style8" style="padding-left:12px;">
            <asp:Label ID="DriverPolicyNoTextBox1Label" runat="server" Text="Policy No"></asp:Label>
            &nbsp;<asp:TextBox ID="DriverPolicyNoTextBox1" runat="server"></asp:TextBox>
        </td>
    
          <td class="style8" style="padding-left:12px;">
           
        </td>
    
        </tr>

</table></td></tr></table>

   <div class="FormHeading" id="Attachement" runat="server">
                       Attachement<span  style="font-size:12px; padding:10px; color:Black; width:500px; height:40px;">Please attach the any file with extension (.jpg
                         <asp:FileUpload ID="UploadImage" runat="server" Font-Size=small/>
                        
                        </div>
<asp:Panel ID="BankDetailsPanel" runat="server">
              <table style="margin-left:13px;"> <tr><td valign="top" class="style8"  >
                <td class="style8" style="background-color:#EEE; padding-left:10px; width:900px; height:150px;">
            <asp:Label ID="BankDetailsLable" runat="server" Text="Bank Details"></asp:Label>
             <asp:TextBox ID="BankDetailsTextBox" runat="server" Height="78px" Width="600px"></asp:TextBox>
             
             </td>
        <td class="style4" style="text-align: right;">
            <asp:HiddenField ID="ContactUpdateIDHidden" runat="server" />
           
        </td>
     
        
        </tr>
        

</table>
</asp:Panel>
<table>
<tr><td style="padding-left:12px;">
 
</td>
</tr>

</table>