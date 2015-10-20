<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="contactdetails1.ascx.cs" Inherits="UC_LIVE.Controls.contactdetails1" %>
<table width="927" height="70" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="460" valign="top"><table width="366" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="366" bgcolor="#FFFFFF"><table width="450" height="204" border="0" cellpadding="0" cellspacing="0" bgcolor="#F9F9F9">
          <tr>
            <td height="26" colspan="4" bgcolor="#EAEAEA" ><span style="padding-left:10px;"><strong>Client Information</strong></span></td>
          </tr>
          <tr>
            <td width="12">&nbsp;</td>
            <td width="183" height="60"><label >First Name</label>
              <asp:TextBox ID="FirstNameTextBox2" runat="server" ></asp:TextBox>
              <asp:RequiredFieldValidator id="valRequired2" runat="server" ControlToValidate="FirstNameTextBox"
    ErrorMessage="You must enter a value into First Name" Display="dynamic" ValidationGroup="ClaimValidation">* </asp:RequiredFieldValidator></td>
            <td width="150" valign="top"><span class="style8">
              <label >Surname</label>
              <br />
              <asp:TextBox ID="SurnameTextBox2" runat="server" 
                 ></asp:TextBox>
            </span></td>
            <td width="4" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td height="41">&nbsp;</td>
            <td><span class="style8">
              <label >Address1</label>
              <asp:TextBox ID="Address1TextBox2" runat="server" 
                 ></asp:TextBox>
            </span></td>
            <td><label class="style8">Address2</label>
              <asp:TextBox ID="Address2TextBox2" runat="server" 
                 ></asp:TextBox></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="77" valign="top">&nbsp;</td>
            <td valign="top"><span class="style8">
              <label >Post Code<br />
              </label>
              <asp:TextBox ID="PostCodeTextBox2" runat="server" Width="110px" MaxLength="7"></asp:TextBox>
              <asp:RegularExpressionValidator ID="PostCodeTextBoxValidator2" runat="server" ValidationGroup="ClaimValidation"     
                                    ErrorMessage="Valid Post Code Required" 
                                    ControlToValidate="PostCodeTextBox"     
                                    ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" Display="dynamic" />            
  &nbsp;
  </asp:RegularExpressionValidator>
            </span></td>
            <td valign="top"><label class="style8">City<br />
            </label>
              <asp:TextBox ID="CityTextBox2" runat="server" ></asp:TextBox></td>
            <td valign="top">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>      <br /></td>
    <td width="467" valign="top"><table width="450" height="187" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F9F9F9">
      <tr>
        <td height="26" colspan="4" bgcolor="#EAEAEA" ><span style="padding-left:10px;"><strong>Contact Details</strong></span></td>
      </tr>
      <tr>
        <td width="12">&nbsp;</td>
        <td width="183" height="60" valign="top"><span class="style8">
          <label >Phone<br />
          </label>
          <asp:TextBox ID="PhoneTextBox2" runat="server" 
                 ></asp:TextBox>
          <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone2" runat="server"  ValidationGroup="ClaimValidation"   
                                    ErrorMessage="Valid Phone Number Required" 
                                    ControlToValidate="PhoneTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />          
</span></td>
        <td width="197" valign="top"><span class="style8">
          <label >Mobile<br />
          </label>
          <asp:TextBox ID="TextBox1" runat="server"
                 ></asp:TextBox>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationGroup="ClaimValidation"    
                                    ErrorMessage="Valid Mobile Required" 
                                    ControlToValidate="MobileTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />          
</span></td>
        <td width="8" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td height="41">&nbsp;</td>
        <td><span class="style8" style="padding-top:10px;">
          <label >Email<br />
          </label>
          <asp:TextBox ID="EmailTextBox3" runat="server"></asp:TextBox>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Valid Email Required"  ControlToValidate="EmailTextBox" ValidationExpression="^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$" />          
</span></td>
        <td><span class="style8">
          <label >Fax<br />
          </label>
          <asp:TextBox ID="FaxTextBox2" runat="server"  
                 ></asp:TextBox>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationGroup="ClaimValidation"    
                                    ErrorMessage="Valid Fax Number Required" 
                                    ControlToValidate="FaxTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />          
</span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="60" valign="top">&nbsp;</td>
        <td valign="top"><span class="style8">
          <label >Post Code<br />
          </label>
          <asp:TextBox ID="PostCodeTextBox3" runat="server" Width="110px" MaxLength="7"></asp:TextBox>
          <asp:RegularExpressionValidator ID="PostCodeTextBoxValidator3" runat="server" ValidationGroup="ClaimValidation"     
                                    ErrorMessage="Valid Post Code Required" 
                                    ControlToValidate="PostCodeTextBox"     
                                    ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" Display="dynamic" />    
          &nbsp;
          </asp:RegularExpressionValidator>
        </span></td>
        <td valign="top"><label class="style8">City<br />
        </label>
          <asp:TextBox ID="CityTextBox3" runat="server" ></asp:TextBox></td>
        <td valign="top">&nbsp;</td>
      </tr>
    </table>
      <br />
    <br /></td>
  </tr>
</table>
<table style="width:917px; height: 398px;">
             
             <tr><td style="font-size:large;" colspan="2">Client Information</td></tr>
   
     <tr>
		    <td class="style8" >                   
             <asp:DropDownList ID="ContactTypeID" runat="server" Height="30px" Width="170px">
             <asp:ListItem Value="0">Company Type</asp:ListItem>  
            <asp:ListItem Value="1">Insurance Company</asp:ListItem>  
            <asp:ListItem Value="2">Solicitor Company</asp:ListItem>            
            <asp:ListItem Value="3">Engineer Company</asp:ListItem>
            <asp:ListItem Value="4">Car Hire Company</asp:ListItem>
              <asp:ListItem Value="5">Stroage Company</asp:ListItem>
            <asp:ListItem Value="6">Client</asp:ListItem>
        
        </asp:DropDownList></td>
         <td >
			 <asp:Label ID="CompanyName" runat="server" Text="Company Name"></asp:Label>
           
	<br />
			 <asp:TextBox ID="CompanyTextBox" runat="server" Height="16px" Width="210px"></asp:TextBox>
           
        </td>
         <td >
             &nbsp;</td>
     </tr>
     
     <tr>
                <td class="style8" valign="middle">
             <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="Mr">Mr.</asp:ListItem>  
            <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
            <asp:ListItem Value="Ms">Ms.</asp:ListItem>
            <asp:ListItem Value="Miss">Miss.</asp:ListItem>
            <asp:ListItem Value="Dr">Dr.</asp:ListItem>
        </asp:DropDownList></td>
        <td valign="bottom" class="style8" style="padding-top:10px;">
               <label >Email<br />
			   </label>
             <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Valid Email Required"  ControlToValidate="EmailTextBox" ValidationExpression="^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$" />
         
        </td>
         <td >
             &nbsp;</td>
     </tr>
       <tr>
         <td class="style8" >
         <label >First Name</label>
         <asp:TextBox ID="FirstNameTextBox" runat="server" ></asp:TextBox>
			 <asp:RequiredFieldValidator id="valRequired" runat="server" ControlToValidate="FirstNameTextBox"
    ErrorMessage="You must enter a value into First Name" Display="dynamic" ValidationGroup="ClaimValidation">*
</asp:RequiredFieldValidator>
         </td>
       <td class="style8">
                  <label >Surname</label>
         <asp:TextBox ID="SurnameTextBox" runat="server" 
                 ></asp:TextBox>
         </td>
         <td >
                  &nbsp;</td>
     </tr>
      
       <tr>
         <td class="style8" >
          <label >Address1</label>
         <asp:TextBox ID="Address1TextBox" runat="server" 
                 ></asp:TextBox>
         </td>
          <td >
              <label class="style8">Address2</label>     
         <asp:TextBox ID="Address2TextBox" runat="server" 
                 ></asp:TextBox>
         </td>
         <td >
               &nbsp;</td>
     </tr>
        <tr>
                 <td class="style8">
                 <label >Post Code<br />
					 </label>
         <asp:TextBox ID="PostCodeTextBox" runat="server" Width="110px" MaxLength="7"></asp:TextBox>  
         <asp:RegularExpressionValidator ID="PostCodeTextBoxValidator" runat="server" ValidationGroup="ClaimValidation"     
                                    ErrorMessage="Valid Post Code Required" 
                                    ControlToValidate="PostCodeTextBox"     
                                    ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" Display="dynamic" />&nbsp;</asp:RegularExpressionValidator></td>     <td >
          <label class="style8">City<br />
					 </label>
         <asp:TextBox ID="CityTextBox" runat="server" ></asp:TextBox>
         </td> 
    
    
      
         <td >
             &nbsp;</td>
     </tr>
       <tr>
    <td class="style8" >
            <label >Country</label>
         <asp:TextBox ID="CountryTextBox" runat="server" 
                 ></asp:TextBox>
        </td>
               <td class="style8">
                  <label >Phone<br />
				   </label>
             <asp:TextBox ID="PhoneTextBox" runat="server" 
                 ></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server"  ValidationGroup="ClaimValidation"   
                                    ErrorMessage="Valid Phone Number Required" 
                                    ControlToValidate="PhoneTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
                                    
                 
        </td>
         <td >
             &nbsp;</td>
     </tr>
      <tr>
      
          <td class="style8" >
            <label >Fax<br />
             </label>
             <asp:TextBox ID="FaxTextBox" runat="server"  
                 ></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="ClaimValidation"    
                                    ErrorMessage="Valid Fax Number Required" 
                                    ControlToValidate="FaxTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
            </td>
         <td class="style8">
          <label >Mobile<br />
			 </label>
             <asp:TextBox ID="MobileTextBox" runat="server"
                 ></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="ClaimValidation"    
                                    ErrorMessage="Valid Mobile Required" 
                                    ControlToValidate="MobileTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
        </td>
         <td >
             &nbsp;</td>
     </tr>
     <tr>
<td class="style8" colspan="2" style="padding-top:10px; padding-bottom:10px;">

<asp:FileUpload ID="UploadImage" runat="server" />
</tr>
<tr>
<td class="style8">
	
	<asp:Label ID="VATRegisteredLable" runat="server" Text="	VAT Registered"></asp:Label>


</td>
<td class="style8"> 
		<asp:Label ID="BankDetailsLable" runat="server" Text="Bank Details"></asp:Label></td>

</tr>
<tr>
<td valign="top" class="style8"> 
	

	<asp:DropDownList ID="VATApplicableChoice" runat="server">
	<asp:ListItem Value="Yes" Text="Yes">
    </asp:ListItem>
    <asp:ListItem Value="No" Text="No"></asp:ListItem>
	</asp:DropDownList>


</td>
<td>
	<asp:TextBox ID="BankDetailsTextBox" runat="server" Height="113px" Width="221px"></asp:TextBox>

</td>

</tr>
       <tr>
      
        <td class="style8" >
            <asp:Label ID="DOB" runat="server" Text="Date of Birth"></asp:Label>
             <asp:TextBox ID="DOBTextBox" runat="server"></asp:TextBox>
             <cc1:calendarextender ID="DOBTextBox_CalendarExtender" runat="server" 
                 Enabled="True" TargetControlID="DOBTextBox" Format="dd/MM/yyyy">
             </cc1:calendarextender>
               <asp:RegularExpressionValidator ID="DateValidator1" runat="server" ValidationGroup="ClaimValidation"    
                                    ErrorMessage="Valid Date of Birth Required" 
                                    ControlToValidate="DOBTextBox"  Display="dynamic"    
                                    ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
             
           </td>
         <td class="style8">
            <asp:Label ID="NINumber1" runat="server" Text="NI Number"></asp:Label>		
             &nbsp;<asp:TextBox ID="NINoTextBox" runat="server" 
                 ></asp:TextBox>
           </td>
         <td class="style5">
             &nbsp;</td>
     </tr>
 <tr>
      
        <td class="style8" >
            <asp:Label ID="DriverInsurersTextBoxLabel" runat="server" Text="Drivers Insurers"></asp:Label>
             <asp:TextBox ID="DriverInsurersTextBox" runat="server"
                 ></asp:TextBox>
                     </td>
         <td class="style8">
            <asp:Label ID="DriverPolicyNoTextBox1Label" runat="server" Text="Driver Policy No"></asp:Label>		
             &nbsp;<asp:TextBox ID="DriverPolicyNoTextBox1" runat="server" 
                 ></asp:TextBox>
           </td>
         <td class="style5">
             &nbsp;</td>
     </tr>



<tr>

<td>&nbsp;</td>
<td>
	&nbsp;</td>

</tr>

       <tr>
         <td class="style4" colspan="2" style="text-align:right;">
          <asp:HiddenField ID="ContactUpdateIDHidden" runat="server" />
          
          
                 
			 
             <asp:ImageButton ID="Updaterecord" runat="server" onclick="UpdateRecordDetails" ValidationGroup="ClaimValidation" Text="Update Record" ImageUrl="~/Images/Icons/UpdateContact.gif"/>
             <asp:ImageButton ID="AddRecord" runat="server" Text="Add Record" onclick="AddNewRecord" ValidationGroup="ClaimValidation" ImageUrl="~/Images/Icons/AddContact.gif"/>
             
             
             
             
             </td>
         <td class="style5">
             &nbsp;</td>
     </tr>
    </table>

    
    