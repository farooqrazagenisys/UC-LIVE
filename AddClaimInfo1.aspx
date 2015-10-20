<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddClaimInfo1.aspx.cs" Inherits="UC_LIVE.AddClaimInfo1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Controls/ContactDetails.ascx" TagName="ContactDetails" TagPrefix="uc1" %>
<%@ Register Src="Controls/ViewDocuments.ascx" TagName="ViewDocuments" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

h3
{
    font-size:8px;
    padding:2px;
    
    
    }

</style>

 <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />
    <!--[if lte IE 7]>
<style type="text/css">
html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>
<![endif]-->



  <script type="text/javascript">
      $(function() {
          $("#accordion").accordion();
      });
	</script>







</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div id="DisplayAccordion1" runat="server" style="margin-top: 25px;" class="demo">
            <div id="accordion">
                <h3>
                    <a href="#">Client Information</a></h3>
                    
                    <div>
                    
                    <table width="934" height="400" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial, Helvetica, sans-serif;">
  <tr>
    <td width="470" height="400" valign="top"><table width="366" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="366" bgcolor="#FFFFFF"><table width="465" height="425" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#F4FCFF">
           <tr>
            <td colspan="4" bgcolor="#dfe9f5" class="style9" style="height:30px;"><span style="padding-left:10px;" class="HeadingStyle">Personal Information 1</span></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="25" valign="top">&nbsp;</td>
            <td height="25" valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="35" valign="top"><asp:DropDownList ID="DropDownList2" runat="server">
              <asp:ListItem Value="Mr">Mr.</asp:ListItem>
              <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
              <asp:ListItem Value="Ms">Ms.</asp:ListItem>
              <asp:ListItem Value="Miss">Miss.</asp:ListItem>
              <asp:ListItem Value="Dr">Dr.</asp:ListItem>
            </asp:DropDownList></td>
            <td height="35" valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td width="17">&nbsp;</td>
            <td width="211" height="35" valign="top"><span class="style8">
              <label >First Name</label>
              <asp:TextBox ID="FirstNameTextBox2" runat="server" ></asp:TextBox>
              </span>
              <asp:RequiredFieldValidator ID="valRequired2" runat="server" ControlToValidate="FirstNameTextBox2"
    ErrorMessage="You must enter a value into First Name" Display="dynamic" validationgroup="ClaimValidation">* </asp:RequiredFieldValidator></td>
            <td width="211" height="35" valign="top"><span class="style8">
              <label >Surname</label>
              <br />
              <asp:TextBox ID="SurnameTextBox2" runat="server" 
                 ></asp:TextBox>
            </span></td>
            <td width="4" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td height="41">&nbsp;</td>
            <td width="211" height="35" valign="top"><span class="style8">
              <label >Address1</label>
              <br />
              <asp:TextBox ID="Address1TextBox2" runat="server" 
                 ></asp:TextBox>
            </span></td>
            <td width="211" height="35" valign="top"><label class="style8">Address2</label>
              <asp:TextBox ID="Address2TextBox2" runat="server" 
                 ></asp:TextBox></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="25" valign="top">&nbsp;</td>
            <td width="211" height="35" valign="top"><span class="style8">
              <label >Post Code<br />
              </label>
              <asp:TextBox ID="PostCodeTextBox" runat="server" Width="110px" MaxLength="7"></asp:TextBox>
              <asp:RegularExpressionValidator ID="PostCodeTextBoxValidator2" runat="server" validationgroup="ClaimValidation"     
                                    ErrorMessage="Valid Post Code Required" 
                                    ControlToValidate="PostCodeTextBox"     
                                    ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" Display="dynamic" />        
              &nbsp;
              
              &nbsp; </span></td>
            <td width="211" height="35" valign="top"><label class="style8">City<br />
            </label>
              <asp:TextBox ID="CityTextBox" runat="server" ></asp:TextBox></td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" valign="top">&nbsp;</td>
            <td height="35" valign="top"><span class="style8">
              <asp:Label ID="DriverInsurersTextBoxLabel2" runat="server" Text="Drivers Insurers"></asp:Label>
              <asp:TextBox ID="DriverInsurersTextBox2" runat="server"
                 ></asp:TextBox>
            </span></td>
            <td height="35" valign="top"><span class="style8">
              <asp:Label ID="DriverPolicyNoTextBox1Label" runat="server" Text="Driver Policy No"></asp:Label>
              &nbsp;
              <asp:TextBox ID="DriverPolicyNoTextBox2" runat="server" 
                 ></asp:TextBox>
            </span></td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td height="93" valign="top">&nbsp;</td>
            <td height="93" valign="top"><span class="style8">
              <asp:Label ID="NINumber2" runat="server" Text="NI Number"></asp:Label>
              &nbsp;<br />
              <asp:TextBox ID="NINoTextBox2" runat="server" 
                 ></asp:TextBox>
            </span></td>
            <td height="93" valign="top"><span class="style8">
              <asp:Label ID="DOB2" runat="server" Text="Date of Birth"></asp:Label>
              <asp:TextBox ID="DOBTextBox" runat="server"></asp:TextBox>
             
             </td>
            <td valign="top">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
    <td width="464" valign="top"><table width="366" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="366" valign="top" bgcolor="#FFFFFF"><table width="465" height="425" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#F4FCFF">
          <tr>
            <td colspan="4" bgcolor="#dfe9f5" class="style9" ><span style="padding-left:10px;" class="HeadingStyle">Contact Information</span></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="25" valign="top">&nbsp;</td>
            <td height="25" valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="35" valign="top"><span class="style8">
              <asp:DropDownList ID="ContactTypeID" runat="server" Height="30px" Width="170px">
                <asp:ListItem Value="0">Company Type</asp:ListItem>
                <asp:ListItem Value="1">Insurance Company</asp:ListItem>
                <asp:ListItem Value="2">Solicitor Company</asp:ListItem>
                <asp:ListItem Value="3">Engineer Company</asp:ListItem>
                <asp:ListItem Value="4">Car Hire Company</asp:ListItem>
                <asp:ListItem Value="5">Stroage Company</asp:ListItem>
                <asp:ListItem Value="6">Client</asp:ListItem>
              </asp:DropDownList>
            </span></td>
            <td height="35" valign="top"><span class="style8"><asp:Label ID="Label1" runat="server" Text="Company Name"></asp:Label>
              <br />
              <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="210px"></asp:TextBox></span></td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td width="17">&nbsp;</td>
            <td width="211" height="35" valign="top"><span class="style8">
              <label >Phone<br />
              </label>
              <asp:TextBox ID="PhoneTextBox" runat="server" 
                 ></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone2" runat="server"  ValidationGroup="ClaimValidation"   
                                    ErrorMessage="Valid Phone Number Required" 
                                    ControlToValidate="PhoneTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />              
</span></td>
            <td width="211" height="35" valign="top"><span class="style8"><label >Mobile<br />
            </label>
              <asp:TextBox ID="MobileTextBox" runat="server"                   ></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Valid Mobile Required" ControlToValidate="MobileTextBox" Display="dynamic" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" /></spna></td>
            <td width="4" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td height="41">&nbsp;</td>
            <td width="211" height="35" valign="top"><span class="style8" style="padding-top:10px;">
              <label >Email<br />
              </label>
              <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationGroup="ClaimValidation" ErrorMessage="Valid Email Required"  ControlToValidate="EmailTextBox" ValidationExpression="^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$" />              
</span></td>
            <td width="211" height="35" valign="top"><span class="style8">
              <label >Fax<br />
              </label>
              <asp:TextBox ID="FaxTextBox" runat="server"  
                 ></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator55" runat="server" ValidationGroup="ClaimValidation"    
                                    ErrorMessage="Valid Fax Number Required" 
                                    ControlToValidate="FaxTextBox"  Display="dynamic"    
                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />              
</span></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="25" valign="top">&nbsp;</td>
            <td width="211" height="35" valign="top"><span class="style8">
              <label >
                <asp:Label ID="VATRegisteredLable" runat="server" Text="	VAT Registered"></asp:Label>
                <br />
              </label>
              <asp:DropDownList ID="VATApplicableChoice2" runat="server">
                <asp:ListItem Value="Yes" Text="Yes"> </asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
              </asp:DropDownList>
              &nbsp; </span></td>
            <td width="211" height="35" valign="top"><span class="style8">
              <asp:Label ID="DriverInsurersTextBoxLabel4" runat="server" Text="Drivers Insurers"></asp:Label>
              <br />
<asp:TextBox ID="DriverInsurersTextBox4" runat="server"
                 ></asp:TextBox>
            </span></td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" valign="top">&nbsp;</td>
            <td height="35" valign="top"><span class="style8">
              <asp:Label ID="DriverInsurersTextBoxLabel3" runat="server" Text="Drivers Insurers"></asp:Label>
              <asp:TextBox ID="DriverInsurersTextBox3" runat="server"
                 ></asp:TextBox>
            </span></td>
            <td height="35" valign="top"><span class="style8">
              <asp:Label ID="DriverPolicyNoTextBox1Label3" runat="server" Text="Driver Policy No"></asp:Label>
&nbsp;
<asp:TextBox ID="DriverPolicyNoTextBox3" runat="server" 
                 ></asp:TextBox>
            </span></td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td height="108" valign="top">&nbsp;</td>
            <td height="35" valign="top">&nbsp;</td>
            <td height="35" valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
                    
                    
                    
                     </div>
                    
                    <h3>
                    <a href="#">Accident Circumstances</a></h3>
                    
                    <div>test </div>
                    
                    <h3>
                    <a href="#">Witnesses</a></h3>
                    
                    <div>test </div>
                    
                    <h3>
                    <a href="#">Party at Fault</a></h3>
                    
                    <div>test </div>
                    
                    <h3>
                    <a href="#">Hospital & GP</a></h3>
                    
                    <div>test </div>
                    
                     <h3>
                    <a href="#">Additional Information</a></h3>
                    
                    <div>test </div>
                    
                     
                    
                    
                   
                    
             </div>  
                
  </div>
  

  
</asp:Content>
