<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DisplayDates.aspx.cs" Inherits="UC_LIVE.DisplayDates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.style1
		{
			width: 74px;
		}
		.style2
		{
			width: 74px;
			height: 20px;
		}
		.style3
		{
			height: 20px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



	<table style="width: 100%;">
		<tr>
			<td class="style2">
				&nbsp;
			</td>
			<td class="style3">
				&nbsp;
			<h2>HIRE PERIOD VALIDATION FORM & LOSS OF USE DATES</h2></td>
			<td class="style3">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td class="style1">
				&nbsp;
			</td>
			<td>
				&nbsp;
				<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="1" DataKeyNames="DatesID" DataSourceID="DatesSQLSource" Font-Size="Medium" ForeColor="Black" GridLines="Vertical" Height="200px" RowStyle-Height="35" style="margin-right: 73px" Width="598px">
					<FooterStyle BackColor="#CCCC99" />
					<RowStyle BackColor="#F0F0F0" />
					<PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
					<Fields>
						<asp:BoundField DataField="EngineerInstructed" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date engineer instructed" SortExpression="EngineerInstructed" />
						<asp:BoundField DataField="InspectionDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date of inspection" SortExpression="InspectionDate" />
						<asp:BoundField DataField="ReportReceieved" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date report received" SortExpression="ReportReceieved" />
						<asp:BoundField DataField="ReportSubmitted" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date report submitted to solicitors / TPI" SortExpression="ReportSubmitted" />
						<asp:BoundField DataField="HireStartDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Hire start date" SortExpression="HireStartDate" />
						<asp:BoundField DataField="HireEndDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Hire end date" SortExpression="HireEndDate" />
						<asp:BoundField DataField="HireNoOfDays" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Total days" SortExpression="HireNoOfDays" />
						<asp:BoundField DataField="StorageStartDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Storage start date" SortExpression="StorageStartDate" />
						<asp:BoundField DataField="StorageEndDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Storage end date" SortExpression="StorageEndDate" />
						<asp:BoundField DataField="StorageNoOfDays" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Total days" SortExpression="StorageNoOfDays" />
						<asp:BoundField DataField="DateRepairAuthorized" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date repair authorized" SortExpression="DateRepairAuthorized" />
						<asp:BoundField DataField="NotificationDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date of notificaton to thirld party" SortExpression="NotificationDate" />
						<asp:BoundField DataField="OfferAccepted" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date of settlement offer" SortExpression="OfferAccepted" />
						<asp:BoundField DataField="ChequeReceived" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date cheque received" SortExpression="ChequeReceived" />
					</Fields>
					<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
					<EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="White" />
				</asp:DetailsView>
				<asp:SqlDataSource ID="DatesSQLSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DatesID], [EngineerInstructed], [InspectionDate], [NotificationDate], [DateRepairAuthorized], [HireStartDate], [ReportSubmitted], [ReportReceieved], [OfferAccepted], [ClaimID], [HireEndDate], [HireNoOfDays], [StorageStartDate], [ChequeReceived], [StorageEndDate], [StorageNoOfDays] FROM [LossOfUseDate] where ClaimID=@ClaimID">
				        <SelectParameters>
			<asp:QueryStringParameter DefaultValue="All" Name="ClaimID" QueryStringField="ClaimID" Type="String" />
		</SelectParameters>
				
				
				</asp:SqlDataSource>
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td class="style1">
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
	</table>

</asp:Content>
