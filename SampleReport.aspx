<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SampleReport.aspx.cs" Inherits="UC_LIVE.SampleReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="400px" Width="762px">
		<LocalReport ReportPath="Reports\ClaimReport.rdlc">
			<DataSources>
				<rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="ReportDataStore_Claim" />
				<rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="ReportDataStore_Contact" />
				<rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="ReportDataStore_Report_ContactDetails" />
			</DataSources>
		</LocalReport>
	</rsweb:ReportViewer>
	<asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UC_LIVE.Reports.ReportDataStoreTableAdapters.Report_ContactDetailsTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UC_LIVE.Reports.ReportDataStoreTableAdapters.ContactTableAdapter" UpdateMethod="Update">
		<DeleteParameters>
			<asp:Parameter Name="Original_ContactID" Type="Int64" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="FirstName" Type="String" />
			<asp:Parameter Name="Surname" Type="String" />
			<asp:Parameter Name="Company" Type="String" />
			<asp:Parameter Name="Address1" Type="String" />
			<asp:Parameter Name="Address2" Type="String" />
			<asp:Parameter Name="City" Type="String" />
			<asp:Parameter Name="PostCode" Type="String" />
			<asp:Parameter Name="Country" Type="String" />
			<asp:Parameter Name="Phone" Type="String" />
			<asp:Parameter Name="Phone2" Type="String" />
			<asp:Parameter Name="Mobile" Type="String" />
			<asp:Parameter Name="Fax" Type="String" />
			<asp:Parameter Name="Email" Type="String" />
			<asp:Parameter Name="Email2" Type="String" />
			<asp:Parameter Name="Comments" Type="String" />
			<asp:Parameter Name="DOB" Type="DateTime" />
			<asp:Parameter Name="NINo" Type="String" />
			<asp:Parameter Name="ContactTypeID" Type="Int32" />
			<asp:Parameter Name="Original_ContactID" Type="Int64" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="FirstName" Type="String" />
			<asp:Parameter Name="Surname" Type="String" />
			<asp:Parameter Name="Company" Type="String" />
			<asp:Parameter Name="Address1" Type="String" />
			<asp:Parameter Name="Address2" Type="String" />
			<asp:Parameter Name="City" Type="String" />
			<asp:Parameter Name="PostCode" Type="String" />
			<asp:Parameter Name="Country" Type="String" />
			<asp:Parameter Name="Phone" Type="String" />
			<asp:Parameter Name="Phone2" Type="String" />
			<asp:Parameter Name="Mobile" Type="String" />
			<asp:Parameter Name="Fax" Type="String" />
			<asp:Parameter Name="Email" Type="String" />
			<asp:Parameter Name="Email2" Type="String" />
			<asp:Parameter Name="Comments" Type="String" />
			<asp:Parameter Name="DOB" Type="DateTime" />
			<asp:Parameter Name="NINo" Type="String" />
			<asp:Parameter Name="ContactTypeID" Type="Int32" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UC_LIVE.Reports.ReportDataStoreTableAdapters.DocumentsTableAdapter">
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UC_LIVE.Reports.ReportDataStoreTableAdapters.ClaimTableAdapter" UpdateMethod="Update">
		<DeleteParameters>
			<asp:Parameter Name="Original_ClaimId" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
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
			<asp:Parameter Name="Original_ClaimId" Type="Int32" />
		</UpdateParameters>
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
	</asp:ObjectDataSource>
</asp:Content>
