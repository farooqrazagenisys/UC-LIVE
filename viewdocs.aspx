<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewdocs.aspx.cs" Inherits="UC_LIVE.viewdocs" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      	
    
    	<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="642px" Width="1091px">
			<LocalReport ReportPath="Report1.rdlc">
				<DataSources>
					<rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="UC_LIVE_Claims_ManagementDataSet_Documents" />
					<rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="ReportDataStore_Documents" />
				</DataSources>
			</LocalReport>
		</rsweb:ReportViewer>
		<asp:ObjectDataSource ID="ObjectDataSource4" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UC_LIVE.Reports.ReportDataStoreTableAdapters.DocumentsTableAdapter" UpdateMethod="Update">
			<DeleteParameters>
				<asp:Parameter Name="Original_DocID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="DocTitle" Type="String" />
				<asp:Parameter Name="DocLink" Type="String" />
				<asp:Parameter Name="DocStatus" Type="Int32" />
				<asp:Parameter Name="DateCreated" Type="DateTime" />
				<asp:Parameter Name="DateUpdated" Type="DateTime" />
				<asp:Parameter Name="DocHeader" Type="String" />
				<asp:Parameter Name="DocFooter" Type="String" />
				<asp:Parameter Name="DocBody" Type="String" />
				<asp:Parameter Name="Original_DocID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="DocTitle" Type="String" />
				<asp:Parameter Name="DocLink" Type="String" />
				<asp:Parameter Name="DocStatus" Type="Int32" />
				<asp:Parameter Name="DateCreated" Type="DateTime" />
				<asp:Parameter Name="DateUpdated" Type="DateTime" />
				<asp:Parameter Name="DocHeader" Type="String" />
				<asp:Parameter Name="DocFooter" Type="String" />
				<asp:Parameter Name="DocBody" Type="String" />
			</InsertParameters>
		</asp:ObjectDataSource>
		<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UC_LIVE.Reports.ReportDataStoreTableAdapters.DocumentsTableAdapter" UpdateMethod="Update">
			<DeleteParameters>
				<asp:Parameter Name="Original_DocID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="DocTitle" Type="String" />
				<asp:Parameter Name="DocLink" Type="String" />
				<asp:Parameter Name="DocStatus" Type="Int32" />
				<asp:Parameter Name="DateCreated" Type="DateTime" />
				<asp:Parameter Name="DateUpdated" Type="DateTime" />
				<asp:Parameter Name="DocHeader" Type="String" />
				<asp:Parameter Name="DocFooter" Type="String" />
				<asp:Parameter Name="DocBody" Type="String" />
				<asp:Parameter Name="Original_DocID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="DocTitle" Type="String" />
				<asp:Parameter Name="DocLink" Type="String" />
				<asp:Parameter Name="DocStatus" Type="Int32" />
				<asp:Parameter Name="DateCreated" Type="DateTime" />
				<asp:Parameter Name="DateUpdated" Type="DateTime" />
				<asp:Parameter Name="DocHeader" Type="String" />
				<asp:Parameter Name="DocFooter" Type="String" />
				<asp:Parameter Name="DocBody" Type="String" />
			</InsertParameters>
		</asp:ObjectDataSource>
		<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="UC_LIVE.Reports.ReportDataStoreTableAdapters.DocumentsTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" UpdateMethod="Update">
			<DeleteParameters>
				<asp:Parameter Name="Original_DocID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="DocTitle" Type="String" />
				<asp:Parameter Name="DocLink" Type="String" />
				<asp:Parameter Name="DocStatus" Type="Int32" />
				<asp:Parameter Name="DateCreated" Type="DateTime" />
				<asp:Parameter Name="DateUpdated" Type="DateTime" />
				<asp:Parameter Name="DocHeader" Type="String" />
				<asp:Parameter Name="DocFooter" Type="String" />
				<asp:Parameter Name="DocBody" Type="String" />
				<asp:Parameter Name="Original_DocID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="DocTitle" Type="String" />
				<asp:Parameter Name="DocLink" Type="String" />
				<asp:Parameter Name="DocStatus" Type="Int32" />
				<asp:Parameter Name="DateCreated" Type="DateTime" />
				<asp:Parameter Name="DateUpdated" Type="DateTime" />
				<asp:Parameter Name="DocHeader" Type="String" />
				<asp:Parameter Name="DocFooter" Type="String" />
				<asp:Parameter Name="DocBody" Type="String" />
			</InsertParameters>
		</asp:ObjectDataSource>
		<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UC_LIVE.Reports.ReportDataStoreTableAdapters.DocumentsTableAdapter" UpdateMethod="Update">
			<DeleteParameters>
				<asp:Parameter Name="Original_DocID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="DocTitle" Type="String" />
				<asp:Parameter Name="DocLink" Type="String" />
				<asp:Parameter Name="DocStatus" Type="Int32" />
				<asp:Parameter Name="DateCreated" Type="DateTime" />
				<asp:Parameter Name="DateUpdated" Type="DateTime" />
				<asp:Parameter Name="DocHeader" Type="String" />
				<asp:Parameter Name="DocFooter" Type="String" />
				<asp:Parameter Name="DocBody" Type="String" />
				<asp:Parameter Name="Original_DocID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="DocTitle" Type="String" />
				<asp:Parameter Name="DocLink" Type="String" />
				<asp:Parameter Name="DocStatus" Type="Int32" />
				<asp:Parameter Name="DateCreated" Type="DateTime" />
				<asp:Parameter Name="DateUpdated" Type="DateTime" />
				<asp:Parameter Name="DocHeader" Type="String" />
				<asp:Parameter Name="DocFooter" Type="String" />
				<asp:Parameter Name="DocBody" Type="String" />
			</InsertParameters>
		</asp:ObjectDataSource>
    
    	
    
    </div>
    </form>
</body>
</html>
