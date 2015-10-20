<%@ Page Title="" Language="C#" MasterPageFile="~/UserView.Master" AutoEventWireup="true" CodeBehind="AddUserClaim.aspx.cs" Inherits="UC_LIVE.AddUserClaim" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Controls/ContactDetails.ascx" TagName="ContactDetails" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="clear:both; height:10px;"></div>


 <div style=" background-color:White; width: 948px;  border: solid 1px buttonface;">
        <div class="MainHeading">
            Claim Details <span style="font-size: 11px; padding-left: 11px;">To save your data at
                any time go to step 7 (Save Claim) and click save </span><span style="margin-left: 300px;">
                    <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/CoreDocs.png"
                         />--%></span>
            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="BulletList" EnableClientScript="true"
                runat="server" ValidationGroup="ClaimValidation" CssClass="ErrorMessage" />
            <%--   <div id="ClaimHeading" runat="Server" style="float:left; width:200px;"></div> --%>
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" MultiPageID="RadMultiPage1"
                SelectedIndex="0">
                <Tabs>
                    <telerik:RadTab Text="1- Start Claim" runat="server" TabIndex="0">
                    </telerik:RadTab>
                    <telerik:RadTab Text="2- Accident Circumstances" runat="server" TabIndex="1">
                    </telerik:RadTab>
                    <telerik:RadTab Text="3- Party at Fault" runat="server" TabIndex="2">
                    </telerik:RadTab>
                    <telerik:RadTab Text="4- Witnesses" runat="server" TabIndex="2">
                    </telerik:RadTab>
                    <telerik:RadTab Text="5- Medical" runat="server" TabIndex="3">
                    </telerik:RadTab>
                    <telerik:RadTab Text="6- Additional Info" runat="server" TabIndex="4">
                    </telerik:RadTab>
                    <telerik:RadTab Text="7- Save Claim" runat="server" TabIndex="5">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="bodytext">
                <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="0">
                    <div style="width: 905px; font-size: 16px; padding: 10px 5px 8px 20px; color: #006699;
                        float: left;">
                        About the Claim
                    </div>
                    <table style="width: 880px; vertical-align: top; margin-left: 20px; height: 60px;
                        background-color: #EEEEEE;">
                        <tr>
                            <td class="style8" style="padding-left: 12px; width: 105px;">
                                <div style="padding-bottom: 4px;">
                                    ClaimType</div>
                                <asp:DropDownList ID="ClaimType" runat="server" AutoPostBack="True" DataSourceID="ClaimTypeDropDown"
                                    DataTextField="ClaimType" DataValueField="ClaimTypeID" OnSelectedIndexChanged="ClaimType_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ClaimTypeDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ClaimTypeID], [ClaimType] FROM [ClaimTypes]">
                                </asp:SqlDataSource>
                                <%--           <asp:DropDownList ID="ClaimType1" runat="server" DataSourceID="SqlDataSource6"
                                    DataTextField="ClaimType" DataValueField="ClaimTypeID" OnSelectedIndexChanged="ClaimType_SelectedIndexChanged"  visible="false">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ClaimTypeID], [ClaimType] FROM [ClaimTypes] where [ClaimTypes].[ClaimTypeID]=1">
                                </asp:SqlDataSource>
                                
                                             <asp:DropDownList ID="ClaimType3" runat="server"  DataSourceID="SqlDataSource7"
                                    DataTextField="ClaimType" DataValueField="ClaimTypeID" OnSelectedIndexChanged="ClaimType_SelectedIndexChanged"  visible="false">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ClaimTypeID], [ClaimType] FROM [ClaimTypes]">
                                </asp:SqlDataSource>--%>
                            </td>
                            <td class="style8" style="width: 130px;">
                                <label>
                                    Claim Title</label><asp:TextBox ID="ClaimTitle" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                        ID="ClaimTitle1" runat="server" ControlToValidate="ClaimTitle" Display="Dynamic"
                                        ErrorMessage="Start Claim - Claim Title Required" ValidationGroup="ClaimValidation">* </asp:RequiredFieldValidator>
                            </td>
                            <td class="style8" style="width: 130px;">
                                <label>
                                    Claim Handler</label><asp:TextBox ID="RefferedBy" runat="server"></asp:TextBox>
                            </td>
                            <%-- <td class="style8" style="width: 80px;">
                               
                                   User Fee</label><asp:TextBox ID="UserFee" runat="server" Width="50"></asp:TextBox><div
                                        style="float: left;">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server"
                                            ControlToValidate="AccidentDate" Display="Dynamic" ErrorMessage="Start Claim - Valid Accident Date Required"
                                            Text="*" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" />
                            </td>--%>
                            
                            
                            <td class="style8" Width="150">
                                <label>
                                    Accident Location</label><asp:TextBox ID="AccidentLocation" runat="server" Width="150"></asp:TextBox>
                            </td>
                            
                            <td class="style8">
                            <div style="float: left; width:180px;">
                                    Accident Date & Time 
                                 <%--   <asp:TextBox ID="AccidentDate" runat="server" Width="70"></asp:TextBox></div>
                                <div style="float: left;">--%>
                                
                                   
                                
                                
                                 <%--   <cc1:CalendarExtender ID="AccidentDate_CalendarExtender" runat="server" Enabled="True"
                                        Format="dd/MM/yyyy" >
                                    </cc1:CalendarExtender>--%>
                                    <telerik:RadDateTimePicker ID="RadDateTimePicker1" runat="server">
                                    </telerik:RadDateTimePicker>
                              
                                
                                </div>
                                 <%-- <div style="float: left;">
                                  <asp:RegularExpressionValidator ID="DateValidator2" runat="server" ControlToValidate="AccidentDate"
                                        Display="Dynamic" ErrorMessage="Start Claim - Valid Accident Date Required" Text="*"
                                        ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" /></div>--%>
                            </td>
                            
                            <td id="RoadConditionsTd" runat="server" class="style8" style="padding-bottom: 10px;
                                width: 110px;" visible="false">
                                <div style="padding-bottom: 6px; padding-top: 8px;">
                                    Road Condition</div>
                                <asp:DropDownList ID="RoadConditionDropdown" runat="server" Width="100">
                                    <asp:ListItem Text="Cloudy" Value="Cloudy"> </asp:ListItem>
                                    <asp:ListItem Text="Damp" Value="Damp"> </asp:ListItem>
                                    <asp:ListItem Text="Dry" Value="Dry"> </asp:ListItem>
                                    <asp:ListItem Text="Sunny" Value="Sunny"> </asp:ListItem>
                                    <asp:ListItem Text="Snow" Value="Snow"> </asp:ListItem>
                                    <asp:ListItem Text="Icy" Value="Icy"> </asp:ListItem>
                                    <asp:ListItem Text="Wet" Value="Wet"> </asp:ListItem>
                                </asp:DropDownList>
                                <%--            <asp:TextBox ID="RoadCondition" runat="server"></asp:TextBox>--%>
                                <asp:HiddenField ID="ClaimUpdateID" runat="server" />
                            </td>
                            
                            
                            
                        </tr>
                    </table>
                    <div>
                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                            <div class="FormHeading" style="font-weight: normal;">
                                About the Vehicle
                            </div>
                            <table style="width: 905px; margin-left: 20px; background-color: #EEE; margin-top: 5px;">
                                <tr>
                                    <td class="style8" style="width: 100px; padding-left: 12px;">
                                        <label>
                                            Vehicle Make</label><asp:TextBox ID="VehicleMake" runat="server" Width="100"> </asp:TextBox>
                                    </td>
                                    <td class="style8" style="width: 100px;">
                                        <label>
                                            Vehicle Model</label><asp:TextBox ID="VehicleModel" runat="server" Width="100"></asp:TextBox>
                                    </td>
                                    <td class="style8" style="width: 100px;">
                                        <label>
                                            Vehicle Reg.</label><asp:TextBox ID="VehicleReg" runat="server" Width="100"></asp:TextBox>
                                    </td>
                                    <%--   <td class="style8" style="width: 100px;">
                                        <label>
                                            Insurance Cover</label><asp:TextBox ID="OwnerInsuranceCover" runat="server" Width="100"></asp:TextBox>
                                    </td>
                                    <td class="style8" style="width: 100px;">
                                        <label>
                                            Drivers Policy No</label><asp:TextBox ID="OwnerDriverPolicyNo22" runat="server" Width="100"> </asp:TextBox>
                                    </td>--%>
                                    <td id="VehicleRoadWorthTD" runat="server" class="style8" width="110">
                                        Vehicle Roadworthy<asp:TextBox ID="VehicleRoadworthy" runat="server" Width="100"></asp:TextBox>
                                    </td>
                                    <td class="style8" style="padding-bottom: 8px;">
                                        <div style="padding-bottom: 5px;">
                                            Owner same as driver</div>
                                        <asp:DropDownList ID="OwnerDetailsDropDown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                            Width="110">
                                            <asp:ListItem Text="Yes" Value="Yes"> </asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"> </asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="VehicleOwner" runat="server" Visible="false">
                                <div class="FormHeading">
                                    About the Vehicle Owner
                                </div>
                                <table style="width: 905px; margin-left: 20px; background-color: #EEE">
                                    <tr>
                                        <td class="style8" style="padding-left: 12px; width: 70px;">
                                            <div style="padding-bottom: 4px;">
                                                Title</div>
                                            <asp:DropDownList ID="OwnerTitle" runat="server">
                                                <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                                                <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                                                <asp:ListItem Value="Ms">Ms.</asp:ListItem>
                                                <asp:ListItem Value="Miss">Miss.</asp:ListItem>
                                                <asp:ListItem Value="Dr">Dr.</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style8" style="width: 110px;">
                                            <label id="OwnerFirstNameLabel" runat="server">
                                                First Name</label>
                                            <asp:TextBox ID="OwnerFirstName" runat="server"> </asp:TextBox>
                                        </td>
                                        <td class="style8">
                                            <label id="OwnerSurnameLabel" runat="server">
                                                Surname</label>
                                            <asp:TextBox ID="OwnerSurname" runat="server"> </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                </panel><table style="width: 905px; margin-left: 20px; background-color: #EEE">
                                    <tr>
                                        <td class="style8" style="width: 110px; padding-left: 12px;">
                                            <label id="OwnerOwnerAddress1Label" runat="server">
                                                Address1</label>
                                            <asp:TextBox ID="OwnerAddress111" runat="server"> </asp:TextBox>
                                        </td>
                                        <td class="style8" style="width: 110px;">
                                            <label id="OwnerOwnerAddress2Label" runat="server">
                                                Address2</label>
                                            <asp:TextBox ID="OwnerAddress2" runat="server"> </asp:TextBox>
                                        </td>
                                        <td class="style8" style="width: 110px;">
                                            <label id="OwnerCityLabel" runat="server">
                                                &#160;City</label>
                                            <asp:TextBox ID="OwnerCity" runat="server"> </asp:TextBox>
                                        </td>
                                        <td class="style8" style="width: 110px;">
                                            <label id="OwnerPostCodeLabel" runat="server">
                                                Post Code</label>
                                            <asp:TextBox ID="OwnerPostCode" runat="server"> </asp:TextBox><asp:RegularExpressionValidator
                                                ID="PostCodeTextBoxValidator1" runat="server" ControlToValidate="OwnerPostCode"
                                                Display="Dynamic" ErrorMessage="Vehicle Owner Details - Valid Post Code Required"
                                                Text="*" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$"
                                                ValidationGroup="ClaimValidation"> </asp:RegularExpressionValidator>
                                        </td>
                                        <td class="style8">
                                            <label id="OwnerPhoneLabel" runat="server">
                                                Phone Number
                                            </label>
                                            <asp:TextBox ID="OwnerPhoneNo" runat="server" Style="width: 110px;"> </asp:TextBox><asp:RegularExpressionValidator
                                                ID="RegularExpressionValidator14" runat="server" ControlToValidate="OwnerPhoneNo"
                                                Display="Dynamic" ErrorMessage="Vehicle Owner - Valid Phone Required" Text="*"
                                                ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))"
                                                ValidationGroup="ClaimValidation"> </asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </asp:Panel>
                        <uc1:ContactDetails ID="ContactDetails1" runat="server" ViewMode="Full"></uc1:ContactDetails>
                        <asp:Panel ID="DriveLicencePanel" runat="server" Visible="false">
                            <div class="FormHeading" style="font-weight: normal;">
                                Licence Details
                            </div>
                            <table style="width: 905px; margin-left: 20px; background-color: #EEE">
                                <tr>
                                    <td class="style8" style="padding-left: 12px; width: 120px; padding-top: 10px;">
                                        <label>
                                            Driver Licence No:</label>
                                        <asp:TextBox ID="DriverLicenceNumber" runat="server" Width="100"> </asp:TextBox>
                                    </td>
                                    <td class="style8" style="padding-top: 10px;" width="120">
                                        <label>
                                            Issue Date</label>
                                        <asp:TextBox ID="IssueDate" runat="server" Width="100"> </asp:TextBox><cc1:CalendarExtender
                                            ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="IssueDate">
                                        </cc1:CalendarExtender>
                                        <div style="float: left;">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server"
                                                ControlToValidate="IssueDate" Display="Dynamic" ErrorMessage="Start Claim - Valid Issue Date Required"
                                                Text="*" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" /></div>
                                    </td>
                                    <td class="style8" style="padding-top: 10px; width: 120px;">
                                        <label>
                                            Expiry Date</label>
                                        <div style="float: left;">
                                            <asp:TextBox ID="ExpiryDate" runat="server" Width="100"> </asp:TextBox><cc1:CalendarExtender
                                                ID="CalendarExtender2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ExpiryDate">
                                            </cc1:CalendarExtender>
                                        </div>
                                        <div style="float: left;">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server"
                                                ControlToValidate="ExpiryDate" Display="Dynamic" ErrorMessage="Start Claim - Valid Expiry Date Required"
                                                Text="*" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" /></div>
                                    </td>
                                    <td class="style8" style="padding-top: 10px; width: 120px;" width="110">
                                        <label>
                                            Category</label>
                                        <asp:TextBox ID="LicenseCategory" runat="server" Width="100"> </asp:TextBox>
                                    </td>
                                    <td class="style8" style="padding-top: 10px;">
                                        <label>
                                            Identification</label>
                                        <asp:TextBox ID="Identification" runat="server"> </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                    <asp:HiddenField ID="VehicleOwnerUpdateID" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="VehicleUpdateId" runat="server" />
                    <div style="float: right; margin-top: -35px;">
                        <%--   <asp:ImageButton ID="Button1" runat="server" ImageUrl="Images/Icons/NextStep.gif" OnClick="Button1_Click" Text="Next Step" ValidationGroup="ClaimValidation" />--%>
                    </div>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="1">
                    <table style="width: 94%; height: 186px;">
                        <tr>
                            <td style="margin-left: 20px;" valign="top">
                                <div style="padding: 10px 5px 10px 18px; font-size: 16px;">
                                    About the Accident
                                </div>
                                <table style="width: 870px; height: 60px; margin-left: 20px; background-color: #EEE">
                                    <tr>
                                        <td class="style8" style="width: 110px; padding-left: 12px;">
                                            <div style="padding-bottom: 4px;">
                                                Anyone Injured</div>
                                            <asp:DropDownList ID="AnyoneInjured" runat="server" Width="90">
                                                <asp:ListItem Text="Yes" Value="Yes"> </asp:ListItem>
                                                <asp:ListItem Text="No" Value="No"> </asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style8" style="width: 110px;">
                                            <div style="padding-bottom: 4px;">
                                                Existing CFA</div>
                                            <asp:DropDownList ID="ExistingCFA" runat="server" Width="90">
                                                <asp:ListItem Text="Yes" Value="Yes"> </asp:ListItem>
                                                <asp:ListItem Text="No" Value="No"> </asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td id="PassengerClaimsDropDown" runat="server" class="style8" style="width: 110px"
                                            visible="false">
                                            <div style="padding-bottom: 4px;">
                                                Passenger Claims</div>
                                            <asp:DropDownList ID="PassengerClaims" runat="server" Width="90">
                                                <asp:ListItem Text="Yes" Value="Yes"> </asp:ListItem>
                                                <asp:ListItem Text="No" Value="No"> </asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style8" style="width: 110px;">
                                            <div style="padding-bottom: 4px;">
                                                Previous Accidents</div>
                                            <asp:DropDownList ID="PreviousAccidents" runat="server" Width="90">
                                                <asp:ListItem Text="Yes" Value="Yes"> </asp:ListItem>
                                                <asp:ListItem Text="No" Value="No"> </asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style8" style="width: 100px;">
                                            <div style="padding-bottom: 4px;">
                                                Any Witnesses</div>
                                            <asp:DropDownList ID="AnyWitnesses" runat="server" AutoPostBack="true" OnTextChanged="WitnessVisiblityTab"
                                                Width="90">
                                                <asp:ListItem Text="Yes" Value="Yes"> </asp:ListItem>
                                                <asp:ListItem Text="No" Value="No"> </asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style8" style="width: 110px;">
                                            <div style="padding-bottom: 4px; width: 120px;">
                                                Is First Party Dealing</div>
                                            <asp:DropDownList ID="DropDownFirstPartyDealing" runat="server" Width="90">
                                                <asp:ListItem Text="Yes" Value="Yes"> </asp:ListItem>
                                                <asp:ListItem Text="No" Value="No"> </asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style8">
                                            <div style="padding-bottom: 5px;">
                                                Police Attended
                                            </div>
                                            <asp:DropDownList ID="PoliceAttended" runat="server" AutoPostBack="true" OnTextChanged="PolicePanleVisibility">
                                                <asp:ListItem Text="No" Value="No"> </asp:ListItem>
                                                <asp:ListItem Text="Yes" Value="Yes"> </asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel ID="PolicePanel" runat="server" Visible="false">
                                    <table>
                                        <tr>
                                            <td>
                                                <div style="width: 600px; font-size: 16px; padding: 10px 5px 10px 20px; color: #006699;
                                                    float: left;">
                                                    Police Details</div>
                                                <table style="width: 902px; margin-left: 20px; padding-top: 10px; background-color: #EEE">
                                                    <tr>
                                                        <td class="style8" style="width: 110px; padding-bottom: 5px; padding-left: 12px;">
                                                            Police Officer Name
                                                            <asp:TextBox ID="PoliceOfficerName" runat="server"> </asp:TextBox>
                                                        </td>
                                                        <td class="style8" style="padding-bottom: 5px;">
                                                            Police Log No
                                                            <asp:TextBox ID="PoliceLogNo" runat="server"> </asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table style="width: 902px; margin-left: 20px; background-color: #EEE">
                                                    <tr>
                                                        <td class="style8" style="padding-left: 12px;">
                                                            Police Address<br />
                                                            <asp:TextBox ID="PoliceAddress" runat="server" Height="40" TextMode="MultiLine" Width="550"> </asp:TextBox>
                                                        </td>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <div style="width: 903px; font-size: 16px; margin-left: 20px; margin-top: 10px; color: #006699;
                                    background-color: White; float: left;">
                                    Accident Details</div>
                                <div style="width: 870px; margin-top: 30px; margin-left: 20px; background-color: #EEE;
                                    margin-top: 10px; height: 180px;">
                                    <table style="width: 250px;">
                                        <tr>
                                            <td class="style8" style="padding-left: 12px; padding-top: 5px;">
                                                Accident Circumstances
                                                <br />
                                                <asp:TextBox ID="AccidentInfo" runat="server" Height="120" TextMode="MultiLine" Width="400"> </asp:TextBox>
                                            </td>
                                            <td id="VehicleRoadWorthyTd" runat="server" class="style8" visible="false">
                                                Vehicle Roadworthy and Damage
                                                <br />
                                                <asp:TextBox ID="DamageToVehcle" runat="server" Height="120" TextMode="MultiLine"
                                                    Width="400"> </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table></div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="2">
            <div style="height: 40px; margin-top: 10px;">
                <div style="padding: 10px 5px 10px 18px; font-size: 16px; float: left; width: 700px;">
                    Party at Fault</div>
                <div style="padding: 10px 5px 10px 18px; font-size: 16px; float: left">
                    Insurance Details</div>
            </div>
            <div style="float: left;">
                <%--                 <div style="width: 400px; font-size: 16px; padding: 10px 5px 10px 13px;color: #006699; float: left;">About Party at Fault</div>--%>
                <table style="margin-left: 20px; background-color: #EEEEEE;">
                    <tr>
                        <td style="width: 700px; background-color: #EEEEEE;" valign="top">
                            <table style="width: 700px; height: 55px;">
                                <tr>
                                    <td class="style8" style="padding-left: 12px; width: 90px;">
                                        <label>
                                            Title</label>
                                        <asp:DropDownList ID="PTitle" runat="server" Width="80">
                                            <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                                            <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                                            <asp:ListItem Value="Ms">Ms.</asp:ListItem>
                                            <asp:ListItem Value="Miss">Miss.</asp:ListItem>
                                            <asp:ListItem Value="Dr">Dr.</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style8" style="width: 100px;">
                                        First Name<br />
                                        <asp:TextBox ID="PFirstName" runat="server"> </asp:TextBox>
                                    </td>
                                    <td class="style8" style="width: 100px;">
                                        Surname<br />
                                        <asp:TextBox ID="PSurname" runat="server"> </asp:TextBox>
                                    </td>
                                    <td class="style8">
                                        Company<br />
                                        <asp:TextBox ID="PCompanyTextBox" runat="server"> </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 700px; vertical-align: top; height: 40px; background-color: #EEEEEE;">
                                <tr>
                                    <td class="style8" style="padding-left: 12px; width: 110px;">
                                        Address1<br />
                                        <asp:TextBox ID="PAddress1" runat="server" Width="100"> </asp:TextBox>
                                    </td>
                                    <td class="style8" style="width: 110px;">
                                        Address2<br />
                                        <asp:TextBox ID="PAddress2" runat="server" Width="100"> </asp:TextBox>
                                    </td>
                                    <td class="style8" style="width: 100px;">
                                        <div style="padding-bottom: 2px;">
                                            Post Code
                                        </div>
                                        <asp:TextBox ID="PPostCode" runat="server" Width="60"> </asp:TextBox><asp:HiddenField
                                            ID="PartyatFaultUpdateID" runat="server" />
                                        <asp:HiddenField ID="PVehicleUpdateID" runat="server"></asp:HiddenField>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PPostCode"
                                            Display="Dynamic" ErrorMessage="Party at Fault - Valid Post Code Required" Text="*"
                                            ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$"
                                            ValidationGroup="ClaimValidation" />
                                    </td>
                                    <td class="style8">
                                        City<br />
                                        <asp:TextBox ID="PCity" runat="server"> </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 700px; vertical-align: top; height: 60px; background-color: #EEEEEE;">
                                <tr>
                                    <td class="style8" style="padding-left: 12px; width: 110px; height: 30px;">
                                        Phone<br />
                                        <asp:TextBox ID="PPhone" runat="server" Width="100"> </asp:TextBox><asp:RegularExpressionValidator
                                            ID="RegularExpressionValidatorPhone" runat="server" ControlToValidate="PPhone"
                                            Display="Dynamic" ErrorMessage="Party at Fault - Valid Phone Required" Text="*"
                                            ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))"
                                            ValidationGroup="ClaimValidation" /><td class="style8">
                                                Mobile<br />
                                                <asp:TextBox ID="PMobile" runat="server" Width="130"> </asp:TextBox><asp:RegularExpressionValidator
                                                    ID="RegularExpressionValidator10" runat="server" ControlToValidate="PMobile"
                                                    Display="Dynamic" ErrorMessage="Party at Fault - Valid Mobile Required" Text="*"
                                                    ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))"
                                                    ValidationGroup="ClaimValidation" />
                                        </td>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="style8" style="padding-left: 18px; padding-bottom: 15px;" valign="top">
                                        Who was to blame and why<br />
                                        <asp:TextBox ID="WhotoBlame" runat="server" Height="135" TextMode="MultiLine" Width="650"> </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div id="Div1" runat="server" style="float: left; background-color: #EEEEEE;">
                <asp:Panel ID="VehicleDetailsPanel" runat="server">
                    <table style="width: 160px; vertical-align: top; padding-left: 10px; margin-top: 2px;">
                        <tr>
                            <td id="PVehicleMake1" runat="server" class="style8" style="padding-left: 10px;"
                                visible="false">
                                Vehicle Make<br />
                                <asp:TextBox ID="PVehicleMake" runat="server"> </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td id="PVehicleModel1" runat="server" class="style8" style="padding-left: 10px;"
                                valign="top" visible="false">
                                <label>
                                    Vehicle Model</label><asp:TextBox ID="PVehileModel" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td id="PVehicleReg1" runat="server" class="style8" style="padding-left: 10px;" valign="top"
                                visible="false">
                                <label>
                                    Vehicle Reg.</label><asp:TextBox ID="PVehicleReg" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td id="PVehicleRoadworthy1" runat="server" class="style8" style="padding-left: 10px;"
                                valign="top" visible="false">
                                Vehicle Roadworthy<br />
                                <asp:TextBox ID="PVehicleRoadworthy" runat="server" Style="height: 22px"> </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="InsurancePanel" runat="server">
                    <table valign="top">
                        <tr>
                            <td class="style8" style="padding-left: 20px;" valign="top">
                                Policy No<br />
                                <asp:TextBox ID="PDriverPolicyNo" runat="server" Width="100"> </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8" style="padding-left: 20px;" valign="top">
                                TP Claim Ref No*<br />
                                <asp:TextBox ID="PInsuranceReferenceNo" runat="server"> </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8" style="padding-left: 20px; height: 35px;" valign="top">
                                <br />
                            </td>
                        </tr>
                        <br />
                        <%--       <tr>
                                    <td class="style8" style="padding-left: 10px;" valign="top">
                                        Insurer<br />
                                        <asp:TextBox ID="PInsuranceCover" runat="server"> </asp:TextBox>
                                    </td>
                                </tr>--%>
                        <tr>
                            <td id="Td1" runat="server" class="style8" style="padding-left: 10px; height: 180px;"
                                valign="top" visible="true">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <div style="height: 360px;">
            </div>
            </td></tr></table></telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="2">
            <div id="WitnessTabText" runat="server" style="font-family: Microsoft Sans Serif;
                padding: 15px; font-size: 12px; color: #006699;" visible="false">
                Message: Under Accident Circumstances witnesses were selected as &#39;No&#39; .Please
                select &#39;Yes&#39; if you would like to add witnesses information.&#39;
            </div>
            <div id="ViewWitnesses" runat="server" visible="true">
                <div style="float: left; padding: 10px 5px 10px 18px; font-size: 16px; color: #006699;">
                    Witness 1
                </div>
                <div style="padding: 10px 5px 10px 18px; padding-left: 395px; float: left; font-size: 16px;
                    color: #006699;">
                    Witness 2
                </div>
                <table style="margin-left: 20px;">
                    <tr>
                        <td style="width: 460px; background-color: #EEEEEE;" valign="top">
                            <table style="width: 400px; height: 55px;">
                                <tr>
                                    <td class="style8" style="padding-left: 12px; width: 60px;">
                                        <label>
                                            Title</label>
                                        <asp:DropDownList ID="W1Title" runat="server" Width="90">
                                            <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                                            <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                                            <asp:ListItem Value="Ms">Ms.</asp:ListItem>
                                            <asp:ListItem Value="Miss">Miss.</asp:ListItem>
                                            <asp:ListItem Value="Dr">Dr.</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style8" style="width: 120px;">
                                        First Name</lable>
                                        <asp:TextBox ID="W1FirstName" runat="server" Width="110"> </asp:TextBox>
                                    </td>
                                    <td class="style8">
                                        <label>
                                            Surname</label><asp:TextBox ID="W1Surname" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="style8" style="padding-left: 12px; width: 70px;">
                                        <label>
                                            Address1</label><asp:TextBox ID="W1Address1" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style8">
                                        <label>
                                            Address2</label><asp:TextBox ID="W1Address2" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="style8" style="padding-left: 12px;">
                                        <label>
                                            Post Code</label><asp:TextBox ID="W1Postcode" runat="server"></asp:TextBox><asp:HiddenField
                                                ID="WitnessID1UpdateID" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="W1Postcode"
                                            Display="Dynamic" ErrorMessage="Witness 1 Details - Valid Post Code Required"
                                            Text="*" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$"
                                            ValidationGroup="ClaimValidation" />
                                    </td>
                                    <td class="style8" style="width: 70px;">
                                        <label>
                                            City Name
                                        </label>
                                        <asp:TextBox ID="W1CityTitle" runat="server"> </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="style8" style="padding-left: 12px;">
                                        <label>
                                            Phone</label><asp:TextBox ID="W1Phone" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                                                ID="RegularExpressionValidator6" runat="server" ControlToValidate="W1Phone" Display="dynamic"
                                                ErrorMessage="Witness 1 Details - Valid Phone Required" Text="*" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))"
                                                ValidationGroup="ClaimValidation" />
                                    </td>
                                    <td class="style8">
                                        <label>
                                            Mobile</label><asp:TextBox ID="W1Mobile" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                                                ID="RegularExpressionValidator11" runat="server" ControlToValidate="W1Mobile"
                                                Display="dynamic" ErrorMessage="Witness 1 Details - Valid Mobile Required" Text="*"
                                                ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))"
                                                ValidationGroup="ClaimValidation" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="background-color: #EEE;">
                            <table style="width: 440px; height: 55px;">
                                <tr>
                                    <td class="style8" style="width: 70px; padding-left: 12px;">
                                        <label>
                                            Title</label>
                                        <asp:DropDownList ID="W2Title" runat="server" Width="80">
                                            <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                                            <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                                            <asp:ListItem Value="Ms">Ms.</asp:ListItem>
                                            <asp:ListItem Value="Miss">Miss.</asp:ListItem>
                                            <asp:ListItem Value="Dr">Dr.</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style8" style="width: 120px;">
                                        First Name</lable>
                                        <asp:TextBox ID="W2FirstName" runat="server" Width="100"> </asp:TextBox>
                                    </td>
                                    <td class="style8">
                                        <label>
                                            Surname<asp:TextBox ID="W2Surname" runat="server"></asp:TextBox></label>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="style8" style="padding-left: 12px;">
                                        <label>
                                            Address1</label><asp:TextBox ID="W2Address1" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style8">
                                        <label>
                                            Address2</label><asp:TextBox ID="W2Address2" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <table>
                                    <tr>
                                        <td class="style8" style="padding-left: 12px;">
                                            <label>
                                                Post Code</label><asp:TextBox ID="W2Postcode" runat="server"></asp:TextBox><asp:HiddenField
                                                    ID="WitnessID2UpdateID" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="W2Postcode"
                                                Display="Dynamic" ErrorMessage="Witness 2 Details - Valid Post Code Required"
                                                Text="*" ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$"
                                                ValidationGroup="ClaimValidation" />
                                        </td>
                                        <td class="style8">
                                            <label>
                                                City Name
                                            </label>
                                            <asp:TextBox ID="W2City" runat="server"> </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td class="style8" style="padding-left: 12px;">
                                            <label>
                                                Phone</label><asp:TextBox ID="W2Phone" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                                                    ID="RegularExpressionValidator7" runat="server" ControlToValidate="W2Phone" Display="dynamic"
                                                    ErrorMessage="Witness 2 - Valid Phone Required" Text="*" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
                                        </td>
                                        <td class="style8">
                                            <label>
                                                Mobile</label><asp:TextBox ID="W2Mobile" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                                                    ID="RegularExpressionValidator12" runat="server" ControlToValidate="W2Mobile"
                                                    Display="dynamic" ErrorMessage="Witness 2 - Valid Mobile Required" Text="*" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </table>
                        </td>
                    </tr>
                </table>
                </td><td>
                </td>
                </tr></table><br />
                <br />
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="3">
            <div style="width: 850px;">
                <div style="float: left; width: 420px; padding: 10px 5px 10px 18px; font-size: 16px;
                    color: #006699;">
                    About the GP
                </div>
                <div style="color: #006699; float: left; padding: 10px 5px 10px 18px; font-size: 16px;">
                    About the Hospital
                </div>
            </div>
            <table style="margin-left: 18px;">
                <tr>
                    <td style="width: 420px; background-color: #EEEEEE;" valign="top">
                        <table style="width: 420px; height: 55px;">
                            <tr>
                                <td class="style8" style="padding-left: 12px; width: 70px;">
                                    <label>
                                        Title</label>
                                    <asp:DropDownList ID="GPTitle" runat="server" Width="80">
                                        <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                                        <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                                        <asp:ListItem Value="Ms">Ms.</asp:ListItem>
                                        <asp:ListItem Value="Miss">Miss.</asp:ListItem>
                                        <asp:ListItem Value="Dr">Dr.</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style8" style="width: 110px;">
                                    GP Name</lable>
                                    <asp:TextBox ID="GPFirstName" runat="server"> </asp:TextBox>
                                </td>
                                <td class="style8">
                                    <label>
                                        Surgery Name</label><asp:TextBox ID="GPSurname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td class="style8" style="padding-left: 12px;">
                                    <label>
                                        Address1</label><asp:TextBox ID="GPAddress1" runat="server"></asp:TextBox>
                                </td>
                                <td class="style8">
                                    <label>
                                        Address2</label><asp:TextBox ID="GPAddress2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="padding-left: 12px;">
                                    <label>
                                        Post Code</label><asp:TextBox ID="GPPostCode" runat="server"></asp:TextBox><asp:HiddenField
                                            ID="HiddenField1" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="GPPostCode"
                                        Display="Dynamic" ErrorMessage="GP Details - Valid PostCode Required" Text="*"
                                        ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$"
                                        ValidationGroup="ClaimValidation" />
                                </td>
                                <td class="style8">
                                    <label>
                                        City
                                    </label>
                                    <asp:TextBox ID="GPCityName" runat="server"> </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="padding-left: 12px;">
                                    <label>
                                        Phone</label><asp:TextBox ID="GPPhone" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                                            ID="RegularExpressionValidator8" runat="server" ControlToValidate="GPPhone" Display="dynamic"
                                            ErrorMessage="GP Details - Valid Phone Required" Text="*" ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))" />
                                </td>
                                <td class="style8">
                                    <label>
                                        Date Attended</label><asp:TextBox ID="GPDateAttended" runat="server"></asp:TextBox><cc1:CalendarExtender
                                            ID="CalendarExtender3" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="GPDateAttended">
                                        </cc1:CalendarExtender>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                                        ControlToValidate="GPDateAttended" Display="Dynamic" ErrorMessage="GP Details - Date Attended format is not valid"
                                        Text="*" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="padding-left: 12px;">
                                    <label>
                                        Other Losses
                                    </label>
                                    <asp:TextBox ID="GPOtherlosses" runat="server"> </asp:TextBox>
                                </td>
                                <td class="style8">
                                    <label>
                                        Injury Sustained</label><asp:TextBox ID="InjurySustained" runat="server"></asp:TextBox><asp:HiddenField
                                            ID="GPUpdateID" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="background-color: #EEE" valign="top">
                        <table style="width: 445px; height: 55px;">
                            <tr>
                                <%--<td class="style8" style="padding-left: 12px; width: 70px;">
                                            <label>
                                                Title</label>
                                            <asp:DropDownList ID="HospitalTitle" runat="server" Width="80">
                                                <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                                                <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                                                <asp:ListItem Value="Ms">Ms.</asp:ListItem>
                                                <asp:ListItem Value="Miss">Miss.</asp:ListItem>
                                                <asp:ListItem Value="Dr">Dr.</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>--%>
                                <td class="style8" style="width: 110px; padding-left: 12px;">
                                    Hospital Name</lable>
                                    <asp:TextBox ID="HospitalName" runat="server" Width="135"> </asp:TextBox>
                                </td>
                                <td class="style8">
                                    <label>
                                        Department<asp:TextBox ID="Department" runat="server"></asp:TextBox></label>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td class="style8" style="padding-left: 12px;">
                                    <label>
                                        Address1</label><asp:TextBox ID="HospitalAddress1" runat="server"></asp:TextBox>
                                </td>
                                <td class="style8">
                                    <label>
                                        Address2</label><asp:TextBox ID="HospitalAddress2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="padding-left: 12px;">
                                    <label>
                                        City Name
                                    </label>
                                    <asp:TextBox ID="HospitalCity" runat="server"> </asp:TextBox>
                                </td>
                                <td class="style8">
                                    <label>
                                        Post Code</label><asp:TextBox ID="HospitalPostCode" runat="server"></asp:TextBox><asp:HiddenField
                                            ID="HospitalUpdatID" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="HospitalPostCode"
                                        Display="Dynamic" ErrorMessage="Hospital Details - Valid PostCode Required" Text="*"
                                        ValidationExpression="^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$"
                                        ValidationGroup="ClaimValidation" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="padding-left: 12px;">
                                    <label>
                                        Phone</label><asp:TextBox ID="HospitalPhone" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                                            ID="RegularExpressionValidator9" runat="server" ControlToValidate="HospitalPhone"
                                            Display="dynamic" ErrorMessage="Hospital Details - Valid Phone Required" Text="*"
                                            ValidationExpression="((\+44\s?\(0\)\s?\d{2,4})|(\+44\s?(01|02|03|07|08)\d{2,3})|(\+44\s?(1|2|3|7|8)\d{2,3})|(\(\+44\)\s?\d{3,4})|(\(\d{5}\))|((01|02|03|07|08)\d{2,3})|(\d{5}))(\s|-|.)(((\d{3,4})(\s|-)(\d{3,4}))|((\d{6,7})))"
                                            ValidationGroup="ClaimValidation" />
                                </td>
                                <td class="style8">
                                    <label>
                                        Date Attended</label><asp:TextBox ID="HospitalDateAttended" runat="server"></asp:TextBox><cc1:CalendarExtender
                                            ID="CalendarExtender4" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="HospitalDateAttended">
                                        </cc1:CalendarExtender>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
                                        ControlToValidate="HospitalDateAttended" Display="Dynamic" ErrorMessage="Hospital Details - Date Attended Format Is Invalid"
                                        Text="*" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="ClaimValidation" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </td><td>
            </td>
            </tr></table></telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView6" runat="server" TabIndex="4">
            <div style="padding: 10px 5px 10px 18px; font-size: 16px;">
                Additional Information</div>
            <table style="margin-top: 0px; background-color: #EEE; vertical-align: top; margin-left: 20px;
                width: 905px;">
                <tr>
                    <td style="padding-left: 12px; padding-bottom: 10px; padding-top: 10px;" valign="top">
                        <asp:TextBox ID="AdditionalInfo" runat="server" Height="160px" TextMode="MultiLine"
                            Width="870px"> </asp:TextBox>
                    </td>
                </tr>
            </table>
            <div id="msg" runat="server">
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView7" runat="server" TabIndex="5">
            <div style="width: 900px; margin: 20px; width: 905px; border: 1px solid #eee">
                <div style="font-size: 16px; padding: 20px; float: left; color: #006699;">
                    Save your Claim
                    <br />
                    <span style="font-size: 12px; padding-top: 10px; color: Black;">To save your claim click
                        on to the Add claim / Update Claim button</span></div>
                <div id="DivClaim" runat="server" style="float: left; padding-left: 20px; padding-top: 20px;">
                    <asp:ImageButton ID="AddClaimButton" runat="server" AlternateText="Add New Claim"
                        ImageUrl="Images/Icons/NewClaim.gif" OnClick="AddNewClaim" Text="Add Claim" ValidationGroup="ClaimValidation" /><asp:ImageButton
                            ID="UpdateClaim" runat="server" AlternateText="Update Claim Details" ImageUrl="Images/Icons/UpdateClaim.gif"
                             Text="Update Claim" ValidationGroup="ClaimValidation"
                            Visible="false" /></div>
                <div style="height: 100px;">
                </div>
            </div>
            <asp:Panel ID="AllocateSuppliersPanel1" runat="server" Visible="false">
                <div style="width: 905px; margin: 20px; width: 905px; border: 1px solid #eee;">
                    <div style="font-size: 16px; padding: 20px; float: left; color: #006699;">
                        Allocate suppliers to this Claim<br />
                        <span style="font-size: 12px; padding-top: 10px; color: Black;">Choose the suppliers
                            for this claim</span></div>
                    <br />
                    <table style="height: 70px; width: 870px; margin-left: 20px; padding-left: 10px;
                        background-color: #EEE;">
                        <tr>
                            <td class="style8" style="width: 170px; padding-left: 12px; padding-top: 12px;" valign="top">
                                <div style="padding-bottom: 5px;">
                                    Allocate Insurance</div>
                                <asp:DropDownList ID="AllocateInsurance" runat="server" DataSourceID="InsruanceDropdownSQL"
                                    DataTextField="Company" DataValueField="ContactID" Width="160px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="InsruanceDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [ContactID], [Company] FROM [Contact] WHERE ([ContactTypeID] = 1) order by [company]">
                                </asp:SqlDataSource>
                            </td>
                            <td class="style8" style="width: 170px; padding-top: 12px;" valign="top">
                                <div style="padding-bottom: 5px;">
                                    Allocate Engineer
                                </div>
                                <asp:DropDownList ID="AllocateEngineer" runat="server" DataSourceID="EngineerDropdownSQL"
                                    DataTextField="Company" DataValueField="ContactID" Width="160px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="EngineerDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [ContactID], [Company] FROM Contact WHERE (ContactTypeID = 3) ORDER BY Company">
                                </asp:SqlDataSource>
                            </td>
                            <td class="style8" style="width: 170px; padding-top: 12px;" valign="top">
                                <div style="padding-bottom: 5px;">
                                    Allocate Solicitor</div>
                                <asp:DropDownList ID="AllocateSolicitor" runat="server" DataSourceID="SolicitorDropdownSQL"
                                    DataTextField="Company" DataValueField="ContactID" Width="160">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SolicitorDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [ContactID], [Company] FROM [Contact] WHERE ([ContactTypeID] = 2) order by [company]">
                                </asp:SqlDataSource>
                            </td>
                            <td class="style8" style="width: 170px; padding-top: 12px;" valign="top">
                                <div style="padding-bottom: 5px;">
                                    Allocate Car hire</div>
                                <asp:DropDownList ID="AllocateCarhire" runat="server" DataSourceID="CarhireDropdownSQL"
                                    DataTextField="Company" DataValueField="ContactID" Width="160">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="CarhireDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [ContactID], [Company] FROM Contact WHERE (ContactTypeID = 4) ORDER BY Company">
                                </asp:SqlDataSource>
                            </td>
                            <td class="style8" valign="top">
                                <div style="padding-bottom: 5px; padding-top: 12px;">
                                    Allocate Storage</div>
                                <asp:DropDownList ID="AllocateStorage" runat="server" DataSourceID="StorageDropdownSQL"
                                    DataTextField="Company" DataValueField="ContactID" Width="150">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="StorageDropdownSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [ContactID], [Company] FROM [Contact] WHERE ([ContactTypeID] = 5) order by [company]">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td style="width: 15px;">
                            </td>
                            <td style="padding: 10px; padding-left: 0px;">
                                <asp:Button ID="Button4" runat="server"  Text="Allocate Suppliers" /><asp:HiddenField
                                    ID="AllocateClaimUpdateID" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
    </div>
    </telerik:RadPageView> </telerik:RadMultiPage> </div>
    <div style="width: 950px; margin-left: 1px;">
        <%--     <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="ajax__tab_lightblue-theme">
        
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
        <%-- <div id="DisplayAccordion" runat="server" style="margin-top: 25px;">--%>
        <%-- <div id="accordion">
                <h3>
                    <a href="#">Core Documents</a></h3>--%>
        <div>
            <%--<div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="PersonalInjuryIcon" runat="server" Font-Size="Small" ImageUrl="~/Images/Icons/IconPersonalInjury.gif"
                            OnClick="PersonalInjuryIcon_Click" />
                    </div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="CarHireForm" runat="server" OnClick="Button6_Click1" Font-Size="Small"
                            ImageUrl="~/Images/Icons/CarhireIcon.gif" />
                    </div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="ClaimAdviceButton1" runat="server" OnClick="ClaimAdviceButton1_Click"
                            Font-Size="Small" ImageUrl="~/Images/Icons/ClaimIcon.gif" />
                    </div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="PaymentRequestButton" runat="server" OnClick="PaymentRequestButton_Click"
                            Font-Size="Small" ImageUrl="~/Images/Icons/PaymentIcon.gif" /></div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="ViewDates" runat="server" ImageUrl="~/Images/Icons/UsefulIcon.gif"
                            OnClick="ViewDates_Click" />
                    </div>
                    <div style="float: left; margin: 1px;">
                        <asp:ImageButton ID="IconAddDates" runat="server" ImageUrl="~/Images/Icons/IconAddDates.gif"
                            OnClick="IconAddDates_Click" />
                    </div>--%>
            <br />
        </div>
    </div>   

</asp:Content>
