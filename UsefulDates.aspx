<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsefulDates.aspx.cs" Inherits="UC_LIVE.UsefulDates" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<style>
.paddingleft
{
    font-family:Microsoft Sans Serif;
    padding-left:15px;
    
    
    
    }

</style>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <input type="image" value="Print" onclick="window.print(); return false;" src="../Images/Icons/document-print.png"  />
    
<table><tr><td align="center">
	<table style="width: 750px; text-align:left;  margin-left:10px; font-family:Microsoft Sans Serif; font-size:12px;">
	<tr><td></td></tr>
	
		<tr>
			<td class="style2">
				&nbsp;
			</td>
			<td class="style3">
	
		<div id="DocumentHeader" runat="server"></div>
			
			        <div id="insurancecompanydiv" runat="server" style='width:360px; margin-left:50px; margin-top:40px; float:left;  font-family:Arial;     height:80px;'></div>
        <div id="HireStartDate" runat="server" style='width:178px; font-weight:bold; margin-left:100px; margin-top:40px; float:left;  font-family:Arial; height:60px; font-size:12px;'>
</div>
<div style="clear:both; "></div>
		<h3 style="margin-left:50px;">HIRE PERIOD VALIDATION FORM & LOSS OF USE DATES</h3><br /><br />
			<div style="clear:both; "></div>
			</td>
			<td class="style3">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				
			</td>
			<td align="center">
				<div>
			
			
			
			
			
			
			<table style="margin-left:40px;"><tr><td style="text-align:left; ">
				<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#EEE" BorderStyle="None" BorderWidth="1px" CellPadding="1" DataKeyNames="DatesID" DataSourceID="DatesSQLSource" Font-Size="Medium" ForeColor="Black" GridLines="None" Height="200px" RowStyle-Height="35" style="margin-right: 73px" Width="598px" HorizontalAlign="Left">
					<FooterStyle BackColor="#CCCC99"  />
					<RowStyle BackColor="#F0F0F0" />
					<PagerStyle BackColor="#EEEE" ForeColor="#EEE" HorizontalAlign="left" />
					<Fields>
					<asp:BoundField DataField="HireStartDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Hire start date" SortExpression="HireStartDate" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="HireEndDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Hire end date" SortExpression="HireEndDate" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="HireNoOfDays" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Total days" SortExpression="HireNoOfDays" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="StorageStartDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Storage start date" SortExpression="StorageStartDate" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="StorageEndDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Storage end date" SortExpression="StorageEndDate" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="StorageNoOfDays" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Total days" SortExpression="StorageNoOfDays" ItemStyle-CssClass="paddingleft"/>
							<asp:BoundField DataField="EngineerInstructed" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date engineer instructed" SortExpression="EngineerInstructed" ItemStyle-CssClass="paddingleft" />
						<asp:BoundField DataField="InspectionDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date of inspection" SortExpression="InspectionDate" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="ReportReceieved" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date report received" SortExpression="ReportReceieved" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="ReportSubmitted" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date report submitted to solicitors / TPI" SortExpression="ReportSubmitted" ItemStyle-CssClass="paddingleft"/>
						
						<asp:BoundField DataField="DateRepairAuthorized" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date repair authorized" SortExpression="DateRepairAuthorized" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="NotificationDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date of notification to third party" SortExpression="NotificationDate" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="OfferAccepted" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date of settlement offer" SortExpression="OfferAccepted" ItemStyle-CssClass="paddingleft"/>
						<asp:BoundField DataField="ChequeReceived" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date cheque received" SortExpression="ChequeReceived" ItemStyle-CssClass="paddingleft"/>
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
			</td></tr></table>
				</div>
			
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td class="style1" colspan="3" >
				
			</td>
			
		</tr>
	</td></tr>	

	

	</table>

    </div>
    	<div id="FooterValue" runat="server" style="text-align:center; width:800px;  margin-top:400px; margin-left:20px;"></div>
    </form>
</body>
</html>
