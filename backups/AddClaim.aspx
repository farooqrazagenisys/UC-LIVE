<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddClaim.aspx.cs" Inherits="UC_LIVE.AddClaim" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Controls/ContactDetails.ascx" TagName="ContactDetails" TagPrefix="uc1" %>
<%@ Register Src="Controls/ViewDocuments.ascx" TagName="ViewDocuments" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #DivMessage
        {
            height: 65px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />
    <!--[if lte IE 7]>
<style type="text/css">
html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>
<![endif]-->

    <script type="text/javascript">
        $(document).ready(function() {

            $("#accordion").accordion({ animated: 'bounceslide'
			 , autoHeight: false
            , header: "h3"
            });

        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  <h5>
        Claim Details</h5>--%>
    <div style="width: 950px; margin-left: 1px;">
        <div style="margin-right: 60px; float: right; height: 25px; width: 100px;" runat="server" id="DivClaim">
            <asp:ImageButton ID="AddClaimButton" OnClick="AddNewClaim" runat="server" ValidationGroup="ClaimValidation" Text="Add Claim"  /><%--ImageUrl="Images/Icons/NewClaim.gif"--%>
            <asp:ImageButton ID="UpdateClaim" OnClick="UpdateClaimClick" runat="server" ValidationGroup="ClaimValidation" Text="Update Claim" ImageUrl="Images/Icons/UpdateClaim.gif" />
        </div>
        <%-- <asp:ValidationSummary ID="ValidationSummary1" HeaderText="You must enter a value in the following fields:" DisplayMode="BulletList" EnableClientScript="true" runat="server" ValidationGroup="ClaimValidation" />--%>
     
     
     
     
     
     
     
      <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="2" Skin="Windows7">
            <Tabs>
                <telerik:RadTab runat="server" Text="Client Information">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Accident Circumstances">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Witnesses" Selected="True" >
              
                </telerik:RadTab>
                   <telerik:RadTab runat="server" Text="Hospital & GP" >
              
                </telerik:RadTab>
                   <telerik:RadTab runat="server" Text="Additonal Information" >
              
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" BorderWidth="1" BorderColor="DarkGray" SelectedIndex="0"   >
            <telerik:RadPageView ID="ClientInformation" runat="server" Width="100%"><table style="width: 500px; height: 370px;"><tr><td><table style="height: 364px; width: 350px;"><tr><td><uc1:ContactDetails ID="ContactDetails1" runat="server" ViewMode="Full"></uc1:ContactDetails></td></tr></table></td><td valign="top">
           
            <table style="width: 217px; height: 350px; margin-left: 0px;"><tr><td style="height: 27px;"></td></tr><tr><td class="style8"><label>Claim Title</label><asp:TextBox ID="ClaimTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ClaimTitle1" runat="server" ControlToValidate="ClaimTitle" Display="Dynamic" ErrorMessage="You must enter a value into Claim Title" ValidationGroup="ClaimValidation">* </asp:RequiredFieldValidator></td></tr><tr><td class="style8"><label>ClaimType<br /></label><asp:DropDownList ID="ClaimType" runat="server" AutoPostBack="True" DataSourceID="ClaimTypeDropDown" DataTextField="ClaimType" DataValueField="ClaimTypeID" OnSelectedIndexChanged="ClaimType_SelectedIndexChanged"></asp:DropDownList><asp:SqlDataSource ID="ClaimTypeDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ClaimTypeID], [ClaimType] FROM [ClaimTypes]"></asp:SqlDataSource></td></tr><tr>
                <td class="style8"><label>Claim Handler</label><asp:TextBox ID="RefferedBy" runat="server"></asp:TextBox></td></tr><tr><td class="style8" valign="top"><label>Accident Date</label><asp:TextBox ID="AccidentDate" runat="server"></asp:TextBox><cc1:CalendarExtender ID="AccidentDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="AccidentDate"></cc1:CalendarExtender><asp:RegularExpressionValidator ID="DateValidator2" runat="server" ControlToValidate="AccidentDate" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" /></td></tr><tr><td class="style8"><label>Accident Location</label><asp:TextBox ID="AccidentLocation" runat="server"></asp:TextBox></td></tr>
                <tr><td class="style8"><label>Road Condition</label><asp:TextBox ID="RoadCondition" runat="server"></asp:TextBox><asp:HiddenField ID="ClaimUpdateID" runat="server" /></td></tr></table>
          
            
            
            
            </td><td valign="top"><asp:Panel ID="Panel1" runat="server" Visible="False"><table style="width: 250px; height: 351px;"><tr><td style="height: 27px;"></td></tr><tr><td>Owner same as driver<asp:DropDownList ID="OwnerDetailsDropDown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"><asp:ListItem Text="No" Value="No"></asp:ListItem><asp:ListItem Text="Yes" Value="Yes"></asp:ListItem></asp:DropDownList></td>
                <td></td></tr><tr><td class="style8"><label id="OwnerFirstNameLabel" runat="server">First Name</label> <asp:TextBox ID="OwnerFirstName" runat="server"></asp:TextBox></td><td class="style8"><label>Vehicle Make</label><asp:TextBox ID="VehicleMake" runat="server"></asp:TextBox></td></tr><tr><td class="style8"><label id="OwnerSurnameLabel" runat="server">Surname</label> <asp:TextBox ID="OwnerSurname" runat="server"></asp:TextBox></td><td class="style8"><label>Vehicle Model</label><asp:TextBox ID="VehicleModel" runat="server"></asp:TextBox></td></tr><tr><td class="style8">
                <label id="OwnerOwnerAddress1Label" runat="server">Address1</label> <asp:TextBox ID="OwnerAddress111" runat="server"></asp:TextBox></td><td class="style8"><label>Vehicle Reg.</label><asp:TextBox ID="VehicleReg" runat="server"></asp:TextBox></td></tr><tr><td class="style8"><label id="OwnerOwnerAddress2Label" runat="server">Address2</label> <asp:TextBox ID="OwnerAddress2" runat="server"></asp:TextBox></td><td class="style8"><label id="LabelInsuranceCover" runat="server">Insurance Cover</label> <asp:TextBox ID="OwnerInsuranceCover" runat="server"></asp:TextBox></td></tr><tr><td class="style8"><label id="OwnerCityLabel" runat="server">&#160;City</label> 
                <asp:TextBox ID="OwnerCity" runat="server"></asp:TextBox></td><td class="style8"><label id="LabelOwnerDriverPolicy" runat="server">Drivers Policy No</label> <asp:TextBox ID="OwnerDriverPolicyNo22" runat="server"></asp:TextBox></td></tr><tr><td class="style8"><label id="OwnerPostCodeLabel" runat="server">Post Code</label> <asp:TextBox ID="OwnerPostCode" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="PostCodeTextBoxValidator1" runat="server" ControlToValidate="OwnerPostCode" Display="Dynamic" ErrorMessage="Valid Post Code Required" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" ValidationGroup="ClaimValidation"></asp:RegularExpressionValidator></td><td class="style8"></label>Vehicle Roadworthy<asp:TextBox ID="VehicleRoadworthy" runat="server"></asp:TextBox></td></tr>
                <tr><td class="style8"><label id="OwnerPhoneLabel" runat="server">Phone Number</label> <asp:TextBox ID="OwnerPhoneNo" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="OwnerPhoneNo" Display="Dynamic" ErrorMessage="Valid Phone Number Required - Owner Details section" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" ValidationGroup="ClaimValidation"></asp:RegularExpressionValidator></td><td class="style8"></td></tr></table></asp:Panel></td></tr></table><asp:HiddenField ID="VehicleOwnerUpdateID" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="VehicleUpdateId" runat="server" /><div style="float: right; margin-top: -35px;"><asp:ImageButton ID="Button1" runat="server" ImageUrl="Images/Icons/NextStep.gif" OnClick="Button1_Click" Text="Next Step" ValidationGroup="ClaimValidation" /></div></telerik:RadPageView>
            <telerik:RadPageView ID="AccidentCircumstances" runat="server" Width="100%"><table style="width: 94%; height: 186px;"><tr><td valign="top"><table style="width: 339px; height: 125px;"><tr><td class="style8">Anyone Injured </td><td class="style8">Existing CFA </td></tr><tr><td class="style8"><asp:DropDownList ID="AnyoneInjured" runat="server"><asp:ListItem Text="Yes" Value="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:DropDownList></td><td class="style8"><asp:DropDownList ID="ExistingCFA" runat="server"><asp:ListItem Text="Yes" Value="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:DropDownList></td></tr><tr><td class="style8">Passenger Claims </td><td class="style8">Previous Accidents </td></tr><tr><td class="style8"><asp:DropDownList ID="PassengerClaims" runat="server"><asp:ListItem Text="Yes" Value="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:DropDownList></td><td class="style8"><asp:DropDownList ID="PreviousAccidents" runat="server"><asp:ListItem Text="Yes" Value="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:DropDownList></td></tr><tr><td class="style8">Any Witnesses </td><td class="style8">Police Attended </td></tr><tr><td class="style8"><asp:DropDownList ID="AnyWitnesses" runat="server"><asp:ListItem Text="Yes" Value="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:DropDownList></td><td class="style8"><asp:DropDownList ID="PoliceAttended" runat="server"><asp:ListItem Text="Yes" Value="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:DropDownList></td></tr><tr><td class="style8">Police Officer Name </td><td class="style8">Police Log No </td></tr><tr><td class="style8"><asp:TextBox ID="PoliceOfficerName" runat="server"></asp:TextBox></td><td class="style8"><asp:TextBox ID="PoliceLogNo" runat="server"></asp:TextBox></td></tr><tr><td class="style8">Police Address </td><td class="style8">Is First Party Dealing? </td></tr><tr><td class="style8"><asp:TextBox ID="PoliceAddress" runat="server" TextMode="MultiLine"></asp:TextBox></td><td class="style8"><asp:DropDownList ID="DropDownFirstPartyDealing" runat="server"><asp:ListItem Text="Yes" Value="Yes"></asp:ListItem><asp:ListItem Text="No" Value="No"></asp:ListItem></asp:DropDownList></td></tr></table></td><td><table style="width: 250px; height: 105px; margin-left: 0px; padding-top: 30px;"><tr><td class="style8">Accident circumstances </td></tr><tr><td><asp:TextBox ID="AccidentInfo" runat="server" Height="142px" TextMode="MultiLine" Width="225px"></asp:TextBox></td></tr></table></td><td><table style="width: 250px; height: 105px; margin-left: 0px; padding-top: 30px;"><tr><td class="style8">Vehicle Roadworthy and Damage </td></tr><tr><td><asp:TextBox ID="DamageToVehcle" runat="server" Height="142px" TextMode="MultiLine" Width="225px"></asp:TextBox></td></tr></table></td></tr></table>
                <div style="clear: both;"></div><div style="float: right; margin-top: -35px;"><asp:ImageButton ID="Button2" runat="server" ImageUrl="Images/Icons/BackIcon.gif" OnClick="Button2_Click" Text="Back Step" ValidationGroup="ClaimValidation" /><asp:ImageButton ID="Button3" runat="server" ImageUrl="Images/Icons/NextStep.gif" OnClick="Button3_Click" Text="Next Step" ValidationGroup="ClaimValidation" /></div></telerik:RadPageView>
            <telerik:RadPageView ID="PartyatFault" runat="server" Width="100%"><table style="width: 94%; height: 186px;"><tr><td valign="top"><table style="width: 180px; height: 179px;"><tr><td class="style8"><lable>First Name</lable><asp:TextBox ID="PFirstName" runat="server"></asp:TextBox></td><td class="style8"><label>Surname</label><asp:TextBox ID="PSurname" runat="server"></asp:TextBox></td></tr><tr><td class="style8"><label>Phone</label><asp:TextBox ID="PPhone" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" ControlToValidate="PPhone" Display="dynamic" ErrorMessage="Valid Phone Number Required for Party At Fault Section" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" ValidationGroup="ClaimValidation" /></td><td class="style8"><label>Mobile</label><asp:TextBox ID="PMobile" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="PMobile" Display="dynamic" ErrorMessage="Valid Mobile Number Required for Party At Fault Section" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" ValidationGroup="ClaimValidation" /></td></tr><tr><td class="style8"><label>Address1</label><asp:TextBox ID="PAddress1" runat="server"></asp:TextBox></td><td class="style8"><label>Address2</label><asp:TextBox ID="PAddress2" runat="server"></asp:TextBox></td></tr><tr><td class="style8"><label>City</label><asp:TextBox ID="PCity" runat="server"></asp:TextBox></td><td class="style8"><label>Post Code</label><asp:TextBox ID="PPostCode" runat="server"></asp:TextBox><asp:HiddenField ID="PartyatFaultUpdateID" runat="server" /><asp:HiddenField ID="PVehicleUpdateID" runat="server"></asp:HiddenField><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PPostCode" Display="Dynamic" ErrorMessage="Valid Post Code Required for Party at Fault Section" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" ValidationGroup="ClaimValidation" /></td></tr><tr><td class="style8"><label>Driver Policy No</label><asp:TextBox ID="PDriverPolicyNo" runat="server"></asp:TextBox></td><td class="style8"><label>TP Claim Ref No*</label><asp:TextBox ID="PInsuranceReferenceNo" runat="server"></asp:TextBox></td></tr></table></td><td><table style="width: 140px; height: 192px; margin-left: 0px;"><tr><td class="style8" valign="top">Who was to blame and why </td></tr><tr><td valign="top"><asp:TextBox ID="WhotoBlame" runat="server" Height="70" TextMode="MultiLine" Width="350"></asp:TextBox><asp:Panel ID="Panel2" runat="server"><table style="width: 250px;"><td class="style8" valign="top"><label>Vehicle Make</label><asp:TextBox ID="PVehicleMake" runat="server"></asp:TextBox></td><td class="style8" valign="top"><label>Vehicle Model</label><asp:TextBox ID="PVehileModel" runat="server"></asp:TextBox></td></tr><tr><td class="style8" valign="top"><label>Vehicle Reg.</label><asp:TextBox ID="PVehicleReg" runat="server"></asp:TextBox></td><td class="style8" valign="top"></label>Vehicle Roadworthy<asp:TextBox ID="PVehicleRoadworthy" runat="server"></asp:TextBox></td></tr><tr><td class="style8" valign="top"><label>Insurance Cover</label><asp:TextBox ID="PInsuranceCover" runat="server"></asp:TextBox></td><td valign="top"></td></tr></table></asp:Panel></td></tr></table></td><td></td></tr></table>
                <br /><div style="float: right; margin-top: -35px;"><asp:ImageButton ID="BtnPartyatFaultBack" runat="server" ImageUrl="Images/Icons/BackIcon.gif" OnClick="PartatFaultBack" Text="Back Step" ValidationGroup="ClaimValidation" /><asp:ImageButton ID="BtnPartyatFaultNext" runat="server" ImageUrl="Images/Icons/NextStep.gif" OnClick="PartatFaultNext" Text="Next Step" ValidationGroup="ClaimValidation" /><br /></div></telerik:RadPageView>
            <telerik:RadPageView ID="Witnesses" runat="server" Width="100%"><table style="width: 94%; height: 200px;"><tr><td><table style="width: 249px; height: 179px;"><tr><td class="FormHeading" colspan="2">Witness 1 </td></tr><tr><td class="style8"><lable>First Name</lable><asp:TextBox ID="W1FirstName" runat="server"></asp:TextBox></td><td class="style8"><label>Surname</label><asp:TextBox ID="W1Surname" runat="server"></asp:TextBox></td></tr><tr><td class="style8"><label>Phone</label><asp:TextBox ID="W1Phone" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="W1Phone" Display="dynamic" ErrorMessage="Valid Phone Number Required for Witness1" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" ValidationGroup="ClaimValidation" /></td><td class="style8"><label>Mobile</label><asp:TextBox ID="W1Mobile" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="W1Mobile" Display="dynamic" ErrorMessage="Valid Phone Number Required for Witness1" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" ValidationGroup="ClaimValidation" /></td></tr><tr><td class="style8"><label>Address1</label><asp:TextBox ID="W1Address1" runat="server" TextMode="MultiLine"></asp:TextBox></td><td class="style8"><label>Address2</label><asp:TextBox ID="W1Address2" runat="server" TextMode="MultiLine"></asp:TextBox></td></tr><tr><td><label></label></td></tr><tr><td class="style8"><label>City Name </label><asp:TextBox ID="W1CityTitle" runat="server"></asp:TextBox></td><td class="style8"><label>Post Code</label><asp:TextBox ID="W1Postcode" runat="server"></asp:TextBox><asp:HiddenField ID="WitnessID1UpdateID" runat="server" /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="W1Postcode" Display="Dynamic" ErrorMessage="Valid Post Code Required for Witness1" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" ValidationGroup="ClaimValidation" /></td></tr></table></td><td><table style="width: 186px; height: 192px; margin-left: 0px;"><tr><td><table style="width: 249px; height: 179px;"><tr><td class="FormHeading" colspan="2">Witnesses 2 </td></tr><tr><td class="style8"><lable>First Name</lable><asp:TextBox ID="W2FirstName" runat="server"></asp:TextBox></td><td class="style8"><label>Surname<asp:TextBox ID="W2Surname" runat="server"></asp:TextBox></label></td></tr><tr><td class="style8"><label>Phone</label><asp:TextBox ID="W2Phone" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="W2Phone" Display="dynamic" ErrorMessage="Valid Phone Number Required for Witness2" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" /></td><td class="style8"><label>Mobile</label><asp:TextBox ID="W2Mobile" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="W2Mobile" Display="dynamic" ErrorMessage="Valid Phone Number Required for Witness2" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" /></td></tr><tr><td class="style8"><label>Address1</label><asp:TextBox ID="W2Address1" runat="server" TextMode="MultiLine"></asp:TextBox></td><td class="style8"><label>Address2</label><asp:TextBox ID="W2Address2" runat="server" TextMode="MultiLine"></asp:TextBox></td></tr><tr><td><label></label></td></tr><tr><td class="style8"><label>City Name </label><asp:TextBox ID="W2City" runat="server"></asp:TextBox></td><td class="style8"><label>Post Code</label><asp:TextBox ID="W2Postcode" runat="server"></asp:TextBox><asp:HiddenField ID="WitnessID2UpdateID" runat="server" /><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="W2Postcode" Display="Dynamic" ErrorMessage="Valid Post Code Required for Witness2" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" ValidationGroup="ClaimValidation" /></td></tr></table></td></tr></table></td><td></td></tr></table>
                <br /><br /><div style="float: right; margin-top: -35px;"><asp:ImageButton ID="BtnWitessBack" runat="server" ImageUrl="Images/Icons/BackIcon.gif" OnClick="WitnessBtnBack" Text="Back Step" ValidationGroup="ClaimValidation" /><asp:ImageButton ID="BtnWitnessNext" runat="server" ImageUrl="Images/Icons/NextStep.gif" OnClick="WitnessBtnNext" Text="Next Step" ValidationGroup="ClaimValidation" /></div></telerik:RadPageView>
            <telerik:RadPageView ID="GPHospital" runat="server" Width="100%"><table style="width: 94%; height: 186px;"><tr><td><table style="width: 249px; height: 179px;"><tr><td class="FormHeading" colspan="2">GP Details </td></tr><tr><td class="style8"><lable>First Name</lable><asp:TextBox ID="GPFirstName" runat="server"></asp:TextBox></td><td class="style8"><label>Surname</label><asp:TextBox ID="GPSurname" runat="server"></asp:TextBox></td></tr><tr><td class="style8"><label>Phone</label><asp:TextBox ID="GPPhone" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="GPPhone" Display="dynamic" ErrorMessage="Valid Phone Number Required for GP Section" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" /></td><td class="style8"><label>DateAttended</label><asp:TextBox ID="GPDateAttended" runat="server"></asp:TextBox><cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="GPDateAttended"></cc1:CalendarExtender><asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="GPDateAttended" Display="Dynamic" ErrorMessage="Valid Date Required - Date Attended GP" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" /></td></tr><tr><td class="style8"><label>Address1</label><asp:TextBox ID="GPAddress1" runat="server" TextMode="MultiLine"></asp:TextBox></td><td class="style8"><label>Address2</label><asp:TextBox ID="GPAddress2" runat="server" TextMode="MultiLine"></asp:TextBox></td></tr><tr><td><label></label></td></tr><tr><td class="style8"><label>City Name </label><asp:TextBox ID="GPCityName" runat="server"></asp:TextBox></td><td class="style8"><label>Post Code</label><asp:TextBox ID="GPPostCode" runat="server"></asp:TextBox><asp:HiddenField ID="HiddenField1" runat="server" /><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="GPPostCode" Display="Dynamic" ErrorMessage="Valid Post Code Required for GP Section" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" ValidationGroup="ClaimValidation" /></td></tr><tr><td class="style8"><label>Other Losses </label><asp:TextBox ID="GPOtherlosses" runat="server"></asp:TextBox></td><td class="style8"><label>Injury Sustained</label><asp:TextBox ID="InjurySustained" runat="server"></asp:TextBox><asp:HiddenField ID="GPUpdateID" runat="server" /></td></tr></table></td><td><table style="width: 186px; height: 192px; margin-left: 0px;"><tr><td><table style="width: 249px; height: 179px;"><tr><td class="FormHeading" colspan="2">Hospital Details </td></tr><tr><td class="style8"><lable>Hospital Name</lable><asp:TextBox ID="HospitalName" runat="server"></asp:TextBox></td><td class="style8"><label>Department<asp:TextBox ID="Department" runat="server"></asp:TextBox></label></td></tr><tr><td class="style8"><label>Phone</label><asp:TextBox ID="HospitalPhone" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="HospitalPhone" Display="dynamic" ErrorMessage="Valid Phone Number Required for GP Section" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" ValidationGroup="ClaimValidation" /></td><td class="style8"><label>Date Attended</label><asp:TextBox ID="HospitalDateAttended" runat="server"></asp:TextBox><cc1:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="HospitalDateAttended"></cc1:CalendarExtender><asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="HospitalDateAttended" Display="Dynamic" ErrorMessage="Valid Date Required - Date Attended Hospital" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" /></td></tr><tr><td class="style8"><label>Address1</label><asp:TextBox ID="HospitalAddress1" runat="server" TextMode="MultiLine"></asp:TextBox></td><td class="style8"><label>Address2</label><asp:TextBox ID="HospitalAddress2" runat="server" TextMode="MultiLine"></asp:TextBox></td></tr><tr><td><label></label></td></tr><tr><td class="style8"><label>City Name </label><asp:TextBox ID="HospitalCity" runat="server"></asp:TextBox></td><td class="style8"><label>Post Code</label><asp:TextBox ID="HospitalPostCode" runat="server"></asp:TextBox><asp:HiddenField ID="HospitalUpdatID" runat="server" /><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="HospitalPostCode" Display="Dynamic" ErrorMessage="Valid Post Code Required for Hospital Section" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$" ValidationGroup="ClaimValidation" /></td></tr></table></td></tr></table></td><td></td></tr><tr><td colspan="3"><div style="float: right; margin-top: 5px; margin-right: 5px;"><asp:ImageButton ID="GPBACK" runat="server" ImageUrl="Images/Icons/BackIcon.gif" Text="Back Step" ValidationGroup="ClaimValidation" /><asp:ImageButton ID="GPNEXT" runat="server" ImageUrl="Images/Icons/NextStep.gif" Text="Next Step" ValidationGroup="ClaimValidation" /></div></td></tr></table></telerik:RadPageView>
            <telerik:RadPageView ID="AdditionalInformation" runat="server" Width="100%"><table style="margin-bottom: 50px; margin-top: 0px;"><tr><td style="padding-top: 50px;" valign="top"><h3>Enter additional information</h3><asp:TextBox ID="AdditionalInfo" runat="server" Height="140px" TextMode="MultiLine" Width="850px"></asp:TextBox></td></tr></table><div id="msg" runat="server"></div><div style="float: right; margin-top: -35px;"><asp:ImageButton ID="Button5" runat="server" ImageUrl="Images/Icons/BackIcon.gif" OnClick="Button5_Click" Text="Back Step" ValidationGroup="ClaimValidation" /></div></telerik:RadPageView>
            <telerik:RadPageView ID="AllocateSuppliers1" runat="server" Width="100%"><table style="height: 256px; width: 484px;"><tr style="width: 150px; height: 50px;"><td class="style8">Allocate Insurance <br /><asp:DropDownList ID="AllocateInsurance" runat="server" DataSourceID="InsruanceDropdownSQL" DataTextField="Company" DataValueField="ContactID"></asp:DropDownList><asp:SqlDataSource ID="InsruanceDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ContactID], [Company] FROM [Contact] WHERE ([ContactTypeID] = 1) order by [company]"></asp:SqlDataSource></td><td class="style8">Allocate Engineer <br /><asp:DropDownList ID="AllocateEngineer" runat="server" DataSourceID="EngineerDropdownSQL" DataTextField="Company" DataValueField="ContactID"></asp:DropDownList><asp:SqlDataSource ID="EngineerDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ContactID], [Company] FROM Contact WHERE (ContactTypeID = 3) ORDER BY Company"></asp:SqlDataSource><br /></td></tr><tr style="width: 150px; height: 50px;"><td class="style8">Allocate Solicitor<br /><asp:DropDownList ID="AllocateSolicitor" runat="server" DataSourceID="SolicitorDropdownSQL" DataTextField="Company" DataValueField="ContactID"></asp:DropDownList><asp:SqlDataSource ID="SolicitorDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ContactID], [Company] FROM [Contact] WHERE ([ContactTypeID] = 2) order by [company]"></asp:SqlDataSource></td><td class="style8">Allocate Car hire<br /><asp:DropDownList ID="AllocateCarhire" runat="server" DataSourceID="CarhireDropdownSQL" DataTextField="Company" DataValueField="ContactID"></asp:DropDownList><asp:SqlDataSource ID="CarhireDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ContactID], [Company] FROM Contact WHERE (ContactTypeID = 4) ORDER BY Company"></asp:SqlDataSource><br /></td></tr><tr style="width: 150px; height: 50px;"><td class="style8">Allocate Storage<br /><asp:DropDownList ID="AllocateStorage" runat="server" DataSourceID="StorageDropdownSQL" DataTextField="Company" DataValueField="ContactID"></asp:DropDownList><asp:SqlDataSource ID="StorageDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ContactID], [Company] FROM [Contact] WHERE ([ContactTypeID] = 5) order by [company]"></asp:SqlDataSource><br /></td><td class="style7"><asp:Button ID="Button4" runat="server" Height="33px" OnClick="AllocateSuppliers" Text="Allocate Suppliers" Width="155px" /><asp:HiddenField ID="AllocateClaimUpdateID" runat="server" /></td></tr></table></telerik:RadPageView>
        </telerik:RadMultiPage>
        <%-- <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="ajax__tab_lightblue-theme">
            <cc1:TabPanel runat="server" ID="TabPanel1">
                <HeaderTemplate>
                    Client Information
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel2" runat="server" CssClass="newtab">
                <HeaderTemplate>
                    Accident Circumstances
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel runat="server" ID="TabPanel3">
                <HeaderTemplate>
                    Party at Fault
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel runat="server" ID="TabPanel9">
                <HeaderTemplate>
                    Witnesses
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel5" runat="server" CssClass="newtab">
                <HeaderTemplate>
                    GP
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel runat="server" ID="TabPanel4">
                <HeaderTemplate>
                    Additional Information
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel runat="server" ID="TabAllocateSuppier">
                <HeaderTemplate>
                    Allocate Supplier
                </HeaderTemplate>
                <ContentTemplate>
                   
                </ContentTemplate>
            </cc1:TabPanel>
        </cc1:TabContainer>--%>
        <div id="DisplayAccordion" runat="server" style="margin-top: 25px;">
            <div id="accordion">
                <h3>
                    <a href="#">Core Documents</a></h3>
                <div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="PersonalInjuryIcon" runat="server" Font-Size="Small" ImageUrl="~/Images/Icons/IconPersonalInjury.gif" OnClick="PersonalInjuryIcon_Click" />
                    </div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="CarHireForm" runat="server" OnClick="Button6_Click1" Font-Size="Small" ImageUrl="~/Images/Icons/CarhireIcon.gif" />
                    </div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="ClaimAdviceButton1" runat="server" OnClick="ClaimAdviceButton1_Click" Font-Size="Small" ImageUrl="~/Images/Icons/ClaimIcon.gif" />
                    </div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="PaymentRequestButton" runat="server" OnClick="PaymentRequestButton_Click" Font-Size="Small" ImageUrl="~/Images/Icons/PaymentIcon.gif" /></div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="ViewDates" runat="server" ImageUrl="~/Images/Icons/UsefulIcon.gif" OnClick="ViewDates_Click" />
                    </div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="IconAddDates" runat="server" ImageUrl="~/Images/Icons/IconAddDates.gif" OnClick="IconAddDates_Click" />
                    </div>
                    <br />
                </div>
                <h3>
                    <a href="#">Automated Documents</a></h3>
                <div>
                    <div runat="server" id="DivDoucments">
                        <uc2:ViewDocuments ID="ViewDocuments1" runat="server" />
                    </div>
                </div>
                <h3>
                    <a href="#">Uploaded Documents</a></h3>
                <div style="height: 100px">
                    <div style="margin-left: 700px;">
                        <asp:ImageButton ID="AddDocument" runat="server" Text="Upload Document" OnClick="AddDocument_Click" ImageUrl="~/Images/Icons/UploadButton.gif" />
                    </div>
                    <cc1:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="920" CssClass="ajax__tab_lightblue-theme">
                        <cc1:TabPanel runat="server" HeaderText="ClientDocs" ID="TabPanel7">
                            <HeaderTemplate>
                                Client Docs
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:SqlDataSource ID="ClientsDataSourceUploaded" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Documents] ,[ClaimDoc] where ClaimDoc.ContactTypeID=7 and ClaimID=@ClaimID and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'File' order by Documents.DocID desc" UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="InsuranceDocs" ID="TabPanel8">
                            <HeaderTemplate>
                                Insurance Docs
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:GridView ID="InsuranceDocsUploaded" CssClass="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DocID" DataSourceID="InsuranceDataSourceUploaded" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="White" CssClass="RowStyle1" />
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="DocTitleTextBox3" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocFile","~/Images/{0}") %>' Text='<%# Eval("DocTitle") %>' Target="_blank"></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                                    </Columns>
                                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                    <EditRowStyle BackColor="#FDFDFD" />
                                    <FooterStyle CssClass="FooterStyle1" />
                                    <HeaderStyle CssClass="HeaderStyle1" />
                                    <PagerStyle CssClass="PagesStyle1" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="InsuranceDataSourceUploaded" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Documents] ,[ClaimDoc] where ClaimDoc.ContactTypeID=1 and ClaimID=@ClaimID and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'File' order by Documents.DocID desc" UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        </ContentTemplate></cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="EngineerDocs" ID="TabPanel6">
                            <HeaderTemplate>
                                Engineers Docs
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:GridView ID="EngineersDocsUploaded" CssClass="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DocID" DataSourceID="EngineersDataSourceUploaded" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="#EFF3FB" CssClass="RowStyle1" />
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" ShowCancelButton="true" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="DocTitleTextBox3" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocFile","~/Images/{0}") %>' Text='<%# Eval("DocTitle") %>' Target="_blank"></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DocStatus" HeaderText="Status" SortExpression="DocStatus" />
                                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                                    </Columns>
                                    <EditRowStyle BackColor="#FDFDFD" />
                                    <FooterStyle CssClass="FooterStyle1" />
                                    <HeaderStyle CssClass="HeaderStyle1" />
                                    <PagerStyle CssClass="PagesStyle1" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="EngineersDataSourceUploaded" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Documents] , [ClaimDoc] where ClaimDoc.ContactTypeID=3 and ClaimID=@ClaimID
and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'File' order by Documents.DocID desc">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="SolicitorDocs" ID="TabPanel10">
                            <HeaderTemplate>
                                Solicitor Docs
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:GridView ID="SolicitorDocsUploaded" CssClass="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DocID" DataSourceID="SolicitorsDataSourceUploaded" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="#EFF3FB" CssClass="RowStyle1" />
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" ShowCancelButton="true" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="DocTitleTextBox3" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocFile","~/Images/{0}") %>' Text='<%# Eval("DocTitle") %>' Target="_blank"></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DocStatus" HeaderText="Status" SortExpression="DocStatus" />
                                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                                        <%--	<asp:TemplateField HeaderText=" ">
							<EditItemTemplate>
								<asp:TextBox ID="ViewDetailsTextBox8" runat="server" Text='View Details'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("DocID", "~/UpdateDocument22.aspx?DocID={0}") %>' Text='View Details' ForeColor="GrayText"></asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateField>--%>
                                    </Columns>
                                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                    <EditRowStyle BackColor="#FDFDFD" />
                                    <FooterStyle CssClass="FooterStyle1" />
                                    <HeaderStyle CssClass="HeaderStyle1" />
                                    <PagerStyle CssClass="PagesStyle1" />
                                    <RowStyle CssClass="RowStyle1" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SolicitorsDataSourceUploaded" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Documents] ,[ClaimDoc] where ClaimDoc.ContactTypeID=2 and ClaimID=@ClaimID and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'File' order by Documents.DocID desc" UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="CarhireDocs" ID="TabPanel11">
                            <HeaderTemplate>
                                Carhire Docs
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:GridView ID="CarhireUploaded" CssClass="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DocID" DataSourceID="CarhireDatasourceUploaded" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="#EFF3FB" CssClass="RowStyle1" />
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" ShowCancelButton="true" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="DocTitleTextBox3" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocFile","~/Images/{0}") %>' Text='<%# Eval("DocTitle") %>' Target="_blank"></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DocStatus" HeaderText="Status" SortExpression="DocStatus" />
                                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                                        <%--	<asp:TemplateField HeaderText=" ">
							<EditItemTemplate>
								<asp:TextBox ID="TextBoxViewDetailsTextBox4" runat="server" Text='View Details'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("DocumentID", "~/UpdateDocument22.aspx?DocumentID={0}") %>' Text='View Details' ForeColor="GrayText"></asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateField>--%>
                                    </Columns>
                                    <EditRowStyle BackColor="#FDFDFD" />
                                    <FooterStyle CssClass="FooterStyle1" />
                                    <HeaderStyle CssClass="HeaderStyle1" />
                                    <PagerStyle CssClass="PagesStyle1" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="CarhireDatasourceUploaded" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Documents] ,[ClaimDoc] where ClaimDoc.ContactTypeID=4 and ClaimID=@ClaimID and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'File' order by Documents.DocID desc" UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="Storage" ID="TabPanel12">
                            <HeaderTemplate>
                                Storage
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:GridView ID="StorageDocsUploaded" CssClass="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DocID" DataSourceID="StorageDatasourceUploaded" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" ShowCancelButton="true" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="DocTitleTextBox3" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocFile","~/Images/{0}") %>' Text='<%# Eval("DocTitle") %>' Target="_blank"></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DocStatus" HeaderText="Status" SortExpression="DocStatus" />
                                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                                        <%--		<asp:TemplateField HeaderText=" ">
							<EditItemTemplate>
								<asp:TextBox ID="ViewDetailsTextBox9" runat="server" Text='View Details'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("DocID", "~/UpdateDocument22.aspx?DocID={0}") %>' Text='View Details' ForeColor="GrayText"></asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateField>--%>
                                    </Columns>
                                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                    <EditRowStyle BackColor="#FDFDFD" />
                                    <FooterStyle CssClass="FooterStyle1" />
                                    <HeaderStyle CssClass="HeaderStyle1" />
                                    <PagerStyle CssClass="PagesStyle1" />
                                    <RowStyle CssClass="RowStyle1" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="StorageDatasourceUploaded" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Documents] ,[ClaimDoc] where ClaimDoc.ContactTypeID=5 and ClaimID=@ClaimID and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'File' order by Documents.DocID desc" UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DocTitle" Type="String" />
                                        <asp:Parameter Name="DocBody" Type="String" />
                                        <asp:Parameter Name="DocLink" Type="String" />
                                        <asp:Parameter Name="DocStatus" Type="Int32" />
                                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                                        <asp:Parameter Name="DocID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
                <h3>
                    <a href="#">Invoices</a></h3>
                <div>
                    <div style="margin-left: 0px;" runat="server" id="DivInvoices">
                        <div style="text-align: right; margin-bottom: 15px; margin-right: 3px;">
                        </div>
                        <div style="float: left;">
                            <asp:ImageButton ID="CarhireInvoiceButton" runat="server" Text="Carhire Invoice" OnClick="CarhireInvoiceButton_Click" ImageUrl="~/Images/Icons/CarhrieInovice.gif" />
                        </div>
                        <div style="float: left;">
                            <asp:ImageButton ID="StorageInvoiceButton" runat="server" Text="Storage Invoice" OnClick="StorageInvoiceButton_Click" ImageUrl="~/Images/Icons/StorageInvoice.gif" />
                        </div>
                        <div style="float: left;">
                            <asp:ImageButton ID="RefferalInvoiceButton" runat="server" Text="Refferal Invoice" OnClick="RefferalInvoiceButton_Click" ImageUrl="~/Images/Icons/refferalInvoice.gif" />
                        </div>
                        <br />
                        <br />
                        <%--<asp:GridView runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DocID" EmptyDataText="There are no data records to display." GridLines="None"  CssClass="GridView1" ForeColor="#333333" ID="ClientDocsUploaded" DataSourceID="DocsSqlDataSource1" Height="150px">
<RowStyle BackColor="#EFF3FB" CssClass="RowStyle1"></RowStyle>

<AlternatingRowStyle CssClass="AlternatingRowStyle"></AlternatingRowStyle>
<Columns>
<asp:BoundField DataField="DocID" HeaderText="DocID" ReadOnly="True" SortExpression="DocID" InsertVisible="False"></asp:BoundField>
<asp:BoundField DataField="DocTitle" HeaderText="DocTitle" SortExpression="DocTitle"></asp:BoundField>
<asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated"></asp:BoundField>
	<asp:BoundField DataField="DateUpdated" HeaderText="DateUpdated" SortExpression="DateUpdated" />
</Columns>

<EditRowStyle BackColor="#FDFDFD"></EditRowStyle>

<FooterStyle CssClass="FooterStyle1"></FooterStyle>

<HeaderStyle CssClass="HeaderStyle1"></HeaderStyle>

<PagerStyle CssClass="PagesStyle1"></PagerStyle>
</asp:GridView>

				<asp:SqlDataSource ID="DocsSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DocID], [DocTitle], [DateCreated], [DateUpdated] FROM [Documents]"></asp:SqlDataSource>--%>
                        <asp:SqlDataSource ID="InvoiceSqlDataSource1" runat="server"></asp:SqlDataSource>
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="InvoiceID" DataSourceID="SqlDataSource2" EmptyDataText="" ForeColor="Black" GridLines="Horizontal" CssClass="GridView1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Height="100px">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" ReadOnly="True" SortExpression="InvoiceID" InsertVisible="False" />
                                <asp:BoundField DataField="InvoiceTitle" HeaderText="InvoiceTitle" SortExpression="InvoiceTitle" />
                                <asp:BoundField DataField="InvoiceType" HeaderText="InvoiceType" SortExpression="InvoiceType" />
                                <asp:BoundField DataField="TotalVAT" HeaderText="TotalVAT" SortExpression="TotalVAT" />
                                <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                                <asp:BoundField DataField="AmountPaid" HeaderText="AmountPaid" SortExpression="AmountPaid" />
                                <asp:BoundField DataField="AmountDue" HeaderText="AmountDue" SortExpression="AmountDue" />
                                <asp:BoundField DataField="GrandTotal" HeaderText="Grand Total" SortExpression="GrandTotal" />
                                <asp:BoundField DataField="InvoiceStatus" HeaderText="InvoiceStatus" SortExpression="InvoiceStatus" />
                                <asp:TemplateField HeaderText=" " SortExpression="InvoiceTitle">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="InvoiceTitleTextBox" runat="server" Text='<%# Bind("InvoiceTitle") %>'></asp:TextBox></EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="viewInvoice" runat="server" NavigateUrl='<%# Eval("InvoiceID", "AmountPaid.aspx?InvoiceID={0}") %>' Text='Add Partial Payment'></asp:HyperLink></ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Invoice] WHERE [InvoiceID] = @InvoiceID" InsertCommand="INSERT INTO [Invoice] ([InvoiceTitle], [TotalAmount], [TotalVAT], [AmountDue], [AdditionalInstructions], [InvoiceHeader], [ContactID], [ClaimID], [InvoiceHeaderImage], [InvoiceType], [InvoiceStatus], [AmountPaid]) VALUES (@InvoiceTitle, @TotalAmount, @TotalVAT, @AmountDue, @AdditionalInstructions, @InvoiceHeader, @ContactID, @ClaimID, @InvoiceHeaderImage, @InvoiceType, @InvoiceStatus, @AmountPaid)" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT [InvoiceID], [InvoiceTitle], [TotalAmount], [TotalVAT], [AmountDue],[GrandTotal], [AdditionalInstructions], [InvoiceHeader], [ContactID], [ClaimID], [InvoiceHeaderImage], [InvoiceType], [InvoiceStatus], [AmountPaid] FROM [Invoice]" UpdateCommand="UPDATE [Invoice] SET [InvoiceTitle] = @InvoiceTitle, [TotalAmount] = @TotalAmount, [TotalVAT] = @TotalVAT, [AmountDue] = @AmountDue, [AdditionalInstructions] = @AdditionalInstructions, [InvoiceHeader] = @InvoiceHeader, [ContactID] = @ContactID, [ClaimID] = @ClaimID, [InvoiceHeaderImage] = @InvoiceHeaderImage, [InvoiceType] = @InvoiceType, [InvoiceStatus] = @InvoiceStatus, [AmountPaid] = @AmountPaid WHERE [InvoiceID] = @InvoiceID">
                            <DeleteParameters>
                                <asp:Parameter Name="InvoiceID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="InvoiceTitle" Type="String" />
                                <asp:Parameter Name="TotalAmount" Type="Decimal" />
                                <asp:Parameter Name="TotalVAT" Type="Decimal" />
                                <asp:Parameter Name="AmountDue" Type="Decimal" />
                                <asp:Parameter Name="AdditionalInstructions" Type="String" />
                                <asp:Parameter Name="InvoiceHeader" Type="String" />
                                <asp:Parameter Name="ContactID" Type="Int32" />
                                <asp:Parameter Name="ClaimID" Type="Int32" />
                                <asp:Parameter Name="InvoiceHeaderImage" Type="String" />
                                <asp:Parameter Name="InvoiceType" Type="String" />
                                <asp:Parameter Name="InvoiceStatus" Type="Int32" />
                                <asp:Parameter Name="AmountPaid" Type="Decimal" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="InvoiceTitle" Type="String" />
                                <asp:Parameter Name="TotalAmount" Type="Decimal" />
                                <asp:Parameter Name="TotalVAT" Type="Decimal" />
                                <asp:Parameter Name="AmountDue" Type="Decimal" />
                                <asp:Parameter Name="AdditionalInstructions" Type="String" />
                                <asp:Parameter Name="InvoiceHeader" Type="String" />
                                <asp:Parameter Name="ContactID" Type="Int32" />
                                <asp:Parameter Name="ClaimID" Type="Int32" />
                                <asp:Parameter Name="InvoiceHeaderImage" Type="String" />
                                <asp:Parameter Name="InvoiceType" Type="String" />
                                <asp:Parameter Name="InvoiceStatus" Type="Int32" />
                                <asp:Parameter Name="AmountPaid" Type="Decimal" />
                                <asp:Parameter Name="InvoiceID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
        <div runat="server" id="DivMessage">
        </div>
        <%--		<asp:Button ID="RedirectClaim" runat="server" Text="Add New Claim" OnClick="RedirectClaim_Click" />--%><%--<asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />--%><br />
    </div>
</asp:Content>
