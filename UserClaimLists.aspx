<%@ Page Title="" Language="C#" MasterPageFile="~/UserView.Master" AutoEventWireup="true"
    CodeBehind="UserClaimLists.aspx.cs" Inherits="UC_LIVE.UserClaimLists" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div style="clear:both; height:10px;"></div>

    <div style="margin-left: 15px; background-color: White; margin-top: 1px; padding: 10px;">
        <table style="width: 905px;">
            <div style="width: 905px; font-size: 20px; color: #006699; float: left;">
                View Claims</div>
            <tr>
                <td class="FormHeading" style="width: 130px; padding-left: 0px;">
                    Choose Claim Type
                </td>
                <td>
                    <asp:DropDownList ID="ClaimTypesDropdownlist" runat="server" DataSourceID="ClaimTypesDropdown1"
                        DataTextField="ClaimType" DataValueField="ClaimTypeID" AutoPostBack="True" CssClass="DropdownList">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <%--<div style="margin-bottom: 5px;">
	<asp:TextBox ID="SearchClaims" runat="server" Height="22px" Width="167px"></asp:TextBox>
	<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search Claims" />
</div>--%>
        <asp:SqlDataSource ID="ClaimTypesDropdown1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
        <div style="border: solid 1px #EEE; width: 910px; padding-bottom: 5px;">
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" MultiPageID="RadMultiPage1"
                SelectedIndex="0" Width="910">
                <Tabs>
                    <telerik:RadTab Text="Potential Claims" runat="server" TabIndex="0">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Accepted Claims" runat="server" TabIndex="1">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Rejected Claims" runat="server" TabIndex="2">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Replacement Claims" runat="server" TabIndex="3">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Completed Claims" runat="server" TabIndex="4">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="bodytext">
                <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="0">
                    <asp:GridView ID="GridView9" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CssClass="GridView1" 
                        DataKeyNames="ClaimId" DataSourceID="SqlDataSource6" 
                        EmptyDataText="There are no data records to display." 
                        ForeColor="#333333" GridLines="None" 
                        OnRowUpdated="GridView5_RowUpdated" PageSize="20" CellPadding="1">
                        <RowStyle CssClass="RowStyle1" />
                        <Columns>
                            <asp:BoundField ControlStyle-Width="180" DataField="ClaimId" 
                                HeaderText="ClaimId" InsertVisible="False" ItemStyle-HorizontalAlign="left" 
                                ReadOnly="True" SortExpression="ClaimId" />
                            <asp:BoundField ControlStyle-Width="150" DataField="ClaimTitle" 
                                HeaderText="Claim Title" SortExpression="ClaimTitle" />
                            <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" 
                                SortExpression="AccidentDate" />
                            <asp:BoundField DataField="ClaimType" HeaderText="Claim Type" 
                                SortExpression="ClaimType" />
                            <asp:BoundField DataField="ClaimStatusTitle" HeaderText="Claim Status" 
                                SortExpression="ClaimStatusTitle" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                                SortExpression="FirstName" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname" 
                                SortExpression="Surname" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="UserFee" HeaderText="Fee" SortExpression="UserFee" />
                        </Columns>
                        <FooterStyle CssClass="FooterStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                    
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" 
                        InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Potential Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') AND (Claim.ClaimUserValue=@UserName) ORDER BY Claim.ClaimId DESC" 
                        UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
                        <DeleteParameters>
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ClaimTitle" Type="String" />
                            <asp:Parameter Name="DateCreated" Type="DateTime" />
                            <asp:Parameter Name="DateUpdated" Type="DateTime" />
                            <asp:Parameter Name="RefferedBy" Type="String" />
                            <asp:Parameter Name="AccidentLocation" Type="String" />
                            <asp:Parameter Name="AccidentDate" Type="DateTime" />
                            <asp:Parameter Name="AccidentInfo" Type="String" />
                            <asp:Parameter Name="RoadCondition" Type="String" />
                            <asp:Parameter Name="DriverPolicyNo" Type="String" />
                            <asp:Parameter Name="WhotoBlame" Type="String" />
                            <asp:Parameter Name="PoliceAttended" Type="String" />
                            <asp:Parameter Name="PoliceOfficerName" Type="String" />
                            <asp:Parameter Name="PoliceLogNo" Type="String" />
                            <asp:Parameter Name="PoliceAddress" Type="String" />
                            <asp:Parameter Name="VehicleRoadworthy" Type="String" />
                            <asp:Parameter Name="DamageToVehcle" Type="String" />
                            <asp:Parameter Name="AdditionalInfo" Type="String" />
                            <asp:Parameter Name="AnyoneInjured" Type="String" />
                            <asp:Parameter Name="PassengerClaims" Type="String" />
                            <asp:Parameter Name="AnyWitnesses" Type="String" />
                            <asp:Parameter Name="PreviousAccidents" Type="String" />
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" 
                                Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
                                <asp:Parameter Name="UserName" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" 
                        InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Accepted Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') AND (Claim.ClaimUserValue=@UserName) ORDER BY Claim.ClaimId DESC" 
                        UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
                        <DeleteParameters>
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ClaimTitle" Type="String" />
                            <asp:Parameter Name="DateCreated" Type="DateTime" />
                            <asp:Parameter Name="DateUpdated" Type="DateTime" />
                            <asp:Parameter Name="RefferedBy" Type="String" />
                            <asp:Parameter Name="AccidentLocation" Type="String" />
                            <asp:Parameter Name="AccidentDate" Type="DateTime" />
                            <asp:Parameter Name="AccidentInfo" Type="String" />
                            <asp:Parameter Name="RoadCondition" Type="String" />
                            <asp:Parameter Name="DriverPolicyNo" Type="String" />
                            <asp:Parameter Name="WhotoBlame" Type="String" />
                            <asp:Parameter Name="PoliceAttended" Type="String" />
                            <asp:Parameter Name="PoliceOfficerName" Type="String" />
                            <asp:Parameter Name="PoliceLogNo" Type="String" />
                            <asp:Parameter Name="PoliceAddress" Type="String" />
                            <asp:Parameter Name="VehicleRoadworthy" Type="String" />
                            <asp:Parameter Name="DamageToVehcle" Type="String" />
                            <asp:Parameter Name="AdditionalInfo" Type="String" />
                            <asp:Parameter Name="AnyoneInjured" Type="String" />
                            <asp:Parameter Name="PassengerClaims" Type="String" />
                            <asp:Parameter Name="AnyWitnesses" Type="String" />
                            <asp:Parameter Name="PreviousAccidents" Type="String" />
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" 
                                Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
                                <asp:Parameter Name="UserName" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    
                    
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" 
                        InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Rejected Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') AND (Claim.ClaimUserValue=@UserName) ORDER BY Claim.ClaimId DESC" 
                        UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
                        <DeleteParameters>
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ClaimTitle" Type="String" />
                            <asp:Parameter Name="DateCreated" Type="DateTime" />
                            <asp:Parameter Name="DateUpdated" Type="DateTime" />
                            <asp:Parameter Name="RefferedBy" Type="String" />
                            <asp:Parameter Name="AccidentLocation" Type="String" />
                            <asp:Parameter Name="AccidentDate" Type="DateTime" />
                            <asp:Parameter Name="AccidentInfo" Type="String" />
                            <asp:Parameter Name="RoadCondition" Type="String" />
                            <asp:Parameter Name="DriverPolicyNo" Type="String" />
                            <asp:Parameter Name="WhotoBlame" Type="String" />
                            <asp:Parameter Name="PoliceAttended" Type="String" />
                            <asp:Parameter Name="PoliceOfficerName" Type="String" />
                            <asp:Parameter Name="PoliceLogNo" Type="String" />
                            <asp:Parameter Name="PoliceAddress" Type="String" />
                            <asp:Parameter Name="VehicleRoadworthy" Type="String" />
                            <asp:Parameter Name="DamageToVehcle" Type="String" />
                            <asp:Parameter Name="AdditionalInfo" Type="String" />
                            <asp:Parameter Name="AnyoneInjured" Type="String" />
                            <asp:Parameter Name="PassengerClaims" Type="String" />
                            <asp:Parameter Name="AnyWitnesses" Type="String" />
                            <asp:Parameter Name="PreviousAccidents" Type="String" />
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" 
                                Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
                                <asp:Parameter Name="UserName" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource> 
                    
                    
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" 
                        InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Replacement Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') AND (Claim.ClaimUserValue=@UserName) ORDER BY Claim.ClaimId DESC" 
                        UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
                        <DeleteParameters>
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ClaimTitle" Type="String" />
                            <asp:Parameter Name="DateCreated" Type="DateTime" />
                            <asp:Parameter Name="DateUpdated" Type="DateTime" />
                            <asp:Parameter Name="RefferedBy" Type="String" />
                            <asp:Parameter Name="AccidentLocation" Type="String" />
                            <asp:Parameter Name="AccidentDate" Type="DateTime" />
                            <asp:Parameter Name="AccidentInfo" Type="String" />
                            <asp:Parameter Name="RoadCondition" Type="String" />
                            <asp:Parameter Name="DriverPolicyNo" Type="String" />
                            <asp:Parameter Name="WhotoBlame" Type="String" />
                            <asp:Parameter Name="PoliceAttended" Type="String" />
                            <asp:Parameter Name="PoliceOfficerName" Type="String" />
                            <asp:Parameter Name="PoliceLogNo" Type="String" />
                            <asp:Parameter Name="PoliceAddress" Type="String" />
                            <asp:Parameter Name="VehicleRoadworthy" Type="String" />
                            <asp:Parameter Name="DamageToVehcle" Type="String" />
                            <asp:Parameter Name="AdditionalInfo" Type="String" />
                            <asp:Parameter Name="AnyoneInjured" Type="String" />
                            <asp:Parameter Name="PassengerClaims" Type="String" />
                            <asp:Parameter Name="AnyWitnesses" Type="String" />
                            <asp:Parameter Name="PreviousAccidents" Type="String" />
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" 
                                Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
                                <asp:Parameter Name="UserName" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    
                   <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" 
                        InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Completed Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') AND (Claim.ClaimUserValue=@UserName) ORDER BY Claim.ClaimId DESC" 
                        UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
                        <DeleteParameters>
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ClaimTitle" Type="String" />
                            <asp:Parameter Name="DateCreated" Type="DateTime" />
                            <asp:Parameter Name="DateUpdated" Type="DateTime" />
                            <asp:Parameter Name="RefferedBy" Type="String" />
                            <asp:Parameter Name="AccidentLocation" Type="String" />
                            <asp:Parameter Name="AccidentDate" Type="DateTime" />
                            <asp:Parameter Name="AccidentInfo" Type="String" />
                            <asp:Parameter Name="RoadCondition" Type="String" />
                            <asp:Parameter Name="DriverPolicyNo" Type="String" />
                            <asp:Parameter Name="WhotoBlame" Type="String" />
                            <asp:Parameter Name="PoliceAttended" Type="String" />
                            <asp:Parameter Name="PoliceOfficerName" Type="String" />
                            <asp:Parameter Name="PoliceLogNo" Type="String" />
                            <asp:Parameter Name="PoliceAddress" Type="String" />
                            <asp:Parameter Name="VehicleRoadworthy" Type="String" />
                            <asp:Parameter Name="DamageToVehcle" Type="String" />
                            <asp:Parameter Name="AdditionalInfo" Type="String" />
                            <asp:Parameter Name="AnyoneInjured" Type="String" />
                            <asp:Parameter Name="PassengerClaims" Type="String" />
                            <asp:Parameter Name="AnyWitnesses" Type="String" />
                            <asp:Parameter Name="PreviousAccidents" Type="String" />
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" 
                                Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
                                <asp:Parameter Name="UserName" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                            <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                            <asp:Parameter Name="ClaimId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource> 
                    
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="1" CssClass="bodytext">
                    <asp:GridView ID="GridView10" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
                        CssClass="GridView1" DataKeyNames="ClaimId" DataSourceID="SqlDataSource1" 
                        EmptyDataText="There are no data records to display." ForeColor="#333333" 
                        GridLines="None" OnRowUpdated="GridView5_RowUpdated" PageSize="20">
                        <RowStyle CssClass="RowStyle1" />
                        <Columns>
                            <asp:BoundField ControlStyle-Width="180" DataField="ClaimId" 
                                HeaderText="ClaimId" InsertVisible="False" ItemStyle-HorizontalAlign="left" 
                                ReadOnly="True" SortExpression="ClaimId" />
                            <asp:BoundField ControlStyle-Width="150" DataField="ClaimTitle" 
                                HeaderText="Claim Title" SortExpression="ClaimTitle" />
                            <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" 
                                SortExpression="AccidentDate" />
                            <asp:BoundField DataField="ClaimType" HeaderText="Claim Type" 
                                SortExpression="ClaimType" />
                            <asp:BoundField DataField="ClaimStatusTitle" HeaderText="Claim Status" 
                                SortExpression="ClaimStatusTitle" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                                SortExpression="FirstName" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname" 
                                SortExpression="Surname" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="UserFee" HeaderText="Fee" SortExpression="UserFee" />
                        </Columns>
                        <FooterStyle CssClass="FooterStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="2" CssClass="bodytext">
                    <asp:GridView ID="GridView11" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
                        CssClass="GridView1" DataKeyNames="ClaimId" DataSourceID="SqlDataSource2" 
                        EmptyDataText="There are no data records to display." ForeColor="#333333" 
                        GridLines="None" OnRowUpdated="GridView5_RowUpdated" PageSize="20">
                        <RowStyle CssClass="RowStyle1" />
                        <Columns>
                            <asp:BoundField ControlStyle-Width="180" DataField="ClaimId" 
                                HeaderText="ClaimId" InsertVisible="False" ItemStyle-HorizontalAlign="left" 
                                ReadOnly="True" SortExpression="ClaimId" />
                            <asp:BoundField ControlStyle-Width="150" DataField="ClaimTitle" 
                                HeaderText="Claim Title" SortExpression="ClaimTitle" />
                            <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" 
                                SortExpression="AccidentDate" />
                            <asp:BoundField DataField="ClaimType" HeaderText="Claim Type" 
                                SortExpression="ClaimType" />
                            <asp:BoundField DataField="ClaimStatusTitle" HeaderText="Claim Status" 
                                SortExpression="ClaimStatusTitle" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                                SortExpression="FirstName" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname" 
                                SortExpression="Surname" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="UserFee" HeaderText="Fee" SortExpression="UserFee" />
                        </Columns>
                        <FooterStyle CssClass="FooterStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="4">
                    <asp:GridView ID="GridView12" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
                        CssClass="GridView1" DataKeyNames="ClaimId" DataSourceID="SqlDataSource3" 
                        EmptyDataText="There are no data records to display." ForeColor="#333333" 
                        GridLines="None" OnRowUpdated="GridView5_RowUpdated" PageSize="20">
                        <RowStyle CssClass="RowStyle1" />
                        <Columns>
                            <asp:BoundField ControlStyle-Width="180" DataField="ClaimId" 
                                HeaderText="ClaimId" InsertVisible="False" ItemStyle-HorizontalAlign="left" 
                                ReadOnly="True" SortExpression="ClaimId" />
                            <asp:BoundField ControlStyle-Width="150" DataField="ClaimTitle" 
                                HeaderText="Claim Title" SortExpression="ClaimTitle" />
                            <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" 
                                SortExpression="AccidentDate" />
                            <asp:BoundField DataField="ClaimType" HeaderText="Claim Type" 
                                SortExpression="ClaimType" />
                            <asp:BoundField DataField="ClaimStatusTitle" HeaderText="Claim Status" 
                                SortExpression="ClaimStatusTitle" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                                SortExpression="FirstName" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname" 
                                SortExpression="Surname" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="UserFee" HeaderText="Fee" SortExpression="UserFee" />
                        </Columns>
                        <FooterStyle CssClass="FooterStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="5">
                    <asp:GridView ID="GridView13" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
                        CssClass="GridView1" DataKeyNames="ClaimId" DataSourceID="SqlDataSource4" 
                        EmptyDataText="There are no data records to display." ForeColor="#333333" 
                        GridLines="None" OnRowUpdated="GridView5_RowUpdated" PageSize="20">
                        <RowStyle CssClass="RowStyle1" />
                        <Columns>
                            <asp:BoundField ControlStyle-Width="180" DataField="ClaimId" 
                                HeaderText="ClaimId" InsertVisible="False" ItemStyle-HorizontalAlign="left" 
                                ReadOnly="True" SortExpression="ClaimId" />
                            <asp:BoundField ControlStyle-Width="150" DataField="ClaimTitle" 
                                HeaderText="Claim Title" SortExpression="ClaimTitle" />
                            <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" 
                                SortExpression="AccidentDate" />
                            <asp:BoundField DataField="ClaimType" HeaderText="Claim Type" 
                                SortExpression="ClaimType" />
                            <asp:BoundField DataField="ClaimStatusTitle" HeaderText="Claim Status" 
                                SortExpression="ClaimStatusTitle" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                                SortExpression="FirstName" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname" 
                                SortExpression="Surname" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="UserFee" HeaderText="Fee" SortExpression="UserFee" />
                        </Columns>
                        <FooterStyle CssClass="FooterStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </div>
        <%--
<cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="915" Height="450" CssClass="ajax__tab_lightblue-theme">


</cc1:TabContainer>
--%>
    </div>
</asp:Content>
