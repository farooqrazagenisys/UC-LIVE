<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="AdminDetails.aspx.cs" Inherits="UC_LIVE.AdminDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 

	<div style="margin-right:100px; margin-top:64px;    width: 850px; height: 460px;">
    
 

<div style="width:850px;  margin-top:-25px; background-color:White; clear:both; ">

<div style="height:15px; background-color:#006699; width:850px; "></div>

<br />

	<table style="width:287px; height: 398px; margin-left:50px;">
   
     <tr><td  colspan="2"><p style="font-family:Microsoft Sans Serif; font-size:24px; color:#006699">Administration Details</p>
     <div id="Message" runat="server" style="font-family:Microsoft Sans Serif; color:#006699" ></div>
     
     </td></td></tr>
     
     <tr>
		 
               <%-- <td class="style8" >
    
                
                
             <asp:DropDownList ID="ContactTypeID" runat="server" Height="30px" Width="170px">
                <asp:ListItem Value="12">Administration Details</asp:ListItem>
        </asp:DropDownList></td>--%>
         <td class=style8>
			 <asp:Label ID="CompanyName" runat="server" Text="Company Name"></asp:Label>
           
	<br />
			 <asp:TextBox ID="CompanyTextBox" runat="server"  Width="210px"></asp:TextBox>           
        </td>
       
     
                <td class="style8" valign="middle">
             <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="Mr">Mr.</asp:ListItem>  
            <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
            <asp:ListItem Value="Ms">Ms.</asp:ListItem>
            <asp:ListItem Value="Miss">Miss.</asp:ListItem>
            <asp:ListItem Value="Dr">Dr.</asp:ListItem>
        </asp:DropDownList></td>
     
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
       <td  class=style8>
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
          <td class=style8>
              <label >Address2</label>     
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
         <asp:TextBox ID="PostCodeTextBox" runat="server" Width="40" MaxLength="7"></asp:TextBox>  
         <asp:RegularExpressionValidator ID="PostCodeTextBoxValidator" runat="server" ValidationGroup="ClaimValidation"     
                                    ErrorMessage="Valid Post Code Required" 
                                    ControlToValidate="PostCodeTextBox"     
                                    ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" Display="dynamic" />&nbsp;</asp:RegularExpressionValidator></td>     <td >
          <label class=style8>City<br />
					 </label>
         <asp:TextBox ID="CityTextBox" runat="server" ></asp:TextBox>
         </td> 
    
    
      
         <td >
             &nbsp;</td>
     </tr>
       <tr>
    <td class="style8" >
    
    
    
    
   
      <label >Phone<br />
				   </label>
             <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server"  ValidationGroup="ClaimValidation"   
                                    ErrorMessage="Valid Phone Number Required" 
                                    ControlToValidate="PhoneTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
            <br />
             Fax <br />
     <asp:TextBox ID="FaxTextBox" runat="server" 
                 ></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ValidationGroup="ClaimValidation"   
                                    ErrorMessage="Valid Fax Number Required" 
                                    ControlToValidate="FaxTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />

                         
                 

                
        </td>
           
         <td >
             &nbsp;</td>
     </tr>
     
     <tr>
        <td valign="bottom" class="style8" style="padding-top:10px;">
               <label >Email<br />
			   </label>
             <asp:TextBox ID="EmailTextBox" runat="server" Width="250"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Valid Email Required"  ControlToValidate="EmailTextBox" ValidationExpression="^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$" />
         
       <br />
           
<asp:Label ID="VATLABEL" Text="VAT Value" runat="server"></asp:Label><br />
<asp:TextBox ID="VATVALUE" runat="server"></asp:TextBox>
   
   <br />
 <asp:Label ID="VATRegisteredLable" runat="server" Text="VAT Registered"></asp:Label><br />
	<asp:DropDownList ID="VATApplicableChoice" runat="server">
	<asp:ListItem Value="Yes" Text="Yes">
    </asp:ListItem>
    <asp:ListItem Value="No" Text="No"></asp:ListItem>
	</asp:DropDownList>

       
        </td>
     
     </tr>
     
     
     
     
     
     <tr>


<tr>
<td class="style8" colspan="2">
<%--<div id="ImageDisplay" runat="server"></div>--%>
    Company Logo</tr>
 

<tr>
<td class="style10" colspan="2">
<%--<div id="ImageDisplay" runat="server"></div>--%>
<asp:FileUpload ID="UploadImage" runat="server" />
</tr>
<tr>
<td class=style8>
	
		<asp:Label ID="BankDetailsLable" runat="server" Text="Bank Details"></asp:Label></td>
<td>
		&nbsp;</td>

</tr>
<tr>

<td colspan="2">
	<asp:TextBox ID="BankDetailsTextBox" runat="server" Height="120px" Width="450px" TextMode="MultiLine"></asp:TextBox>

</td>

</tr>

<tr>
<td class=style8>
	
		<asp:Label ID="Label1" runat="server" Text="Company Information" ></asp:Label></td>
<td>
		&nbsp;</td>

</tr>
<tr>

<td colspan="2">
	<asp:TextBox ID="CompanyInfoTextBox" runat="server" Height="120px" Width="450px" TextMode="MultiLine"></asp:TextBox>

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
			 
            
			   
             </td>
         <td class="style5">
             &nbsp;</td>
     </tr>
    </table>



 </div></div></div>
</asp:Content>
