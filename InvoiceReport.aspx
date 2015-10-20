<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InvoiceReport.aspx.cs" Inherits="UC_LIVE.InvoiceReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="400px" Width="945px">
		<LocalReport ReportPath="Reports\InvoiceSummary.rdlc">
			<DataSources>
				<rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="UCLiveDataset_Invoices" />
			</DataSources>
		</LocalReport>
	</rsweb:ReportViewer>
		<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="UC_LIVE.UCLiveDatasetTableAdapters.InvoicesTableAdapter"></asp:ObjectDataSource>
	


</asp:Content>
