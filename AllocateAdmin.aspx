<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="AllocateAdmin.aspx.cs" Inherits="UC_LIVE.AllocateAdmin" %>
<%@ Register src="Controls/ContactDetails.ascx" tagname="ContactDetails" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="width:850px; margin-right:150px; margin-top:8px; background-color:White; clear:both;" class="style8">
	
		<div style="height:15px; background-color:#006699; width:850px;">
		
              
            </div>
<div class="MainHeading">Create Users</div>
	<div style=" margin-left:30px;" >
	
	
	<div style="background-color:#EEE;  padding-left:20px; padding-top:10px;">
                <table><tr><td style="width:120px;"> 
<div style="padding-bottom:2px;">
                	 Choose Account</div>
             <asp:DropDownList ID="ContactTypeID" runat="server" >
                <asp:ListItem Value="12">Admin Account</asp:ListItem>
        </asp:DropDownList></td>
         <td >
			 <asp:Label ID="CompanyName" runat="server" Text="Company Name"></asp:Label>
           
	
			 <asp:TextBox ID="CompanyTextBox" runat="server" ></asp:TextBox>
   </td>
   <td>
    <label >Company Logo<br />
					 </label>
<%--<div id="ImageDisplay" runat="server"></div>--%>
<asp:FileUpload ID="UploadImage" runat="server" />

</td>
<td style="padding-left:10px;"> 
<div style="padding-bottom:2px;">
<asp:Label ID="VATRegisteredLable" runat="server" Text="VAT Registered"></asp:Label>
</div>
<asp:DropDownList ID="VATApplicableChoice" runat="server">
	<asp:ListItem Value="Yes" Text="Yes">
    </asp:ListItem>
    <asp:ListItem Value="No" Text="No"></asp:ListItem>
	</asp:DropDownList>
</td>
     </tr>
     </table><table>
     <tr>
                <td valign="middle" style="width:68px;">
                 
       <div style="padding-bottom:1px;">Title</div>
             <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="Mr">Mr.</asp:ListItem>  
            <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
            <asp:ListItem Value="Ms">Ms.</asp:ListItem>
            <asp:ListItem Value="Miss">Miss.</asp:ListItem>
            <asp:ListItem Value="Dr">Dr.</asp:ListItem>
        </asp:DropDownList></td>
      
         <td >
         <label >First Name</label>
         <asp:TextBox ID="FirstNameTextBox" runat="server" ></asp:TextBox>
			 <asp:RequiredFieldValidator id="valRequired" runat="server" ControlToValidate="FirstNameTextBox"
    ErrorMessage="You must enter a value into First Name" Display="dynamic" ValidationGroup="ClaimValidation">*
</asp:RequiredFieldValidator>
         </td>
       <td >
                  <label >Surname</label>
         <asp:TextBox ID="SurnameTextBox" runat="server" 
                 ></asp:TextBox>
         </td>
         </tr></table><table><tr>
    

         <td >
          <label >Address1</label>
         <asp:TextBox ID="Address1TextBox" runat="server" 
                 ></asp:TextBox>
         </td>
          <td >
              <label >Address2</label>     
         <asp:TextBox ID="Address2TextBox" runat="server" 
                 ></asp:TextBox>
         </td>
    <td style="padding-top:10px;">
       <div style="padding-bottom:1px;">Post Code</div>
					 </label>
         <asp:TextBox ID="PostCodeTextBox" runat="server" Width="40" MaxLength="7"></asp:TextBox>  
         <asp:RegularExpressionValidator ID="PostCodeTextBoxValidator" runat="server" ValidationGroup="ClaimValidation"     
                                    ErrorMessage="Valid Post Code Required" 
                                    ControlToValidate="PostCodeTextBox"     
                                    ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" Display="dynamic" />&nbsp;</asp:RegularExpressionValidator></td>     <td >
          <label >City<br />
					 </label>
         <asp:TextBox ID="CityTextBox" runat="server" ></asp:TextBox>
         </td>  
         
         

    <td >
    
                     <label >Country<br />
					 </label>
         <asp:TextBox ID="CountryTextBox" runat="server" 
                 ></asp:TextBox>
        </td></tr></table><table><tr>
               <td style="width:100px;">
                   <div style="padding-bottom:2px;">
                Phone
                  </div>
             <asp:TextBox ID="PhoneTextBox" runat="server" 
                 ></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server"  ValidationGroup="ClaimValidation"   
                                    ErrorMessage="Valid Phone Number Required" 
                                    ControlToValidate="PhoneTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
                                    
                 
        </td>
                       <td style="width:100px;">
                   <div style="padding-bottom:2px;">
                Fax
                  </div>
             <asp:TextBox ID="FaxTextBox" runat="server" 
                 ></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ValidationGroup="ClaimValidation"   
                                    ErrorMessage="Valid Fax Number Required" 
                                    ControlToValidate="FaxTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
                                    
                 
        </td>
       <td valign="bottom" style="padding-top:10px;">
       Email
			 <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Valid Email Required"  ControlToValidate="EmailTextBox" ValidationExpression="^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$" />
         
        </td>

<%--<div id="ImageDisplay" runat="server"></div>--%>

</tr><table><tr><td>
		<asp:Label ID="BankDetailsLable" runat="server" Text="Bank Details"></asp:Label>
	<asp:TextBox ID="BankDetailsTextBox" runat="server" Height="113px" Width="221px"></asp:TextBox>

</td>

</tr>

<tr>

<td>&nbsp;</td>
<td>
	&nbsp;</td>

</tr>

       <tr>
         <td class="style4" colspan="2" style="text-align:right;">
          <asp:HiddenField ID="ContactUpdateIDHidden" runat="server" />
                 <asp:Button ID="Updaterecord" runat="server" onclick="UpdateRecordDetails" Text="Update Record" ValidationGroup="ClaimValidation"  />
                 <asp:Button ID="AddRecord" runat="server" Text="Add Record" onclick="AddNewRecord" ValidationGroup="ClaimValidation" />
			 
                
             </td>
         <td class="style5">
             &nbsp;</td>
     </tr>
    </table>


</div>
    </div>
    </div>
</asp:Content>
