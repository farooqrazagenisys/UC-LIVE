<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LossofUsedDates.aspx.cs" Inherits="UC_LIVE.LossofUsedDates" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"><style type="text/css">
		.style8
		{
																		  	width: 123px;
																		  	height: 29px;
																		  }
		                                                                  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="background-color:White; width:950px;">



<div class="MainHeading">	Loss of Use Dates</div>

<div style="background-color:#EEE; width:905; margin-left:20px; margin-right:20px;">
    <table style="width:650px; ">
		
			<tr>		
				<td class="style8" style="width:250px;padding-top:5px; padding-left:12px;">
					Date of Notification to Third Party
					<br />
					<asp:TextBox ID="NotificationDateTextBox" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="AccidentDate3_CalendarExtender" runat="server" Enabled="True" TargetControlID="NotificationDateTextBox" Format="dd/MM/yyyy">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="DateValidator6" runat="server" ErrorMessage="Valid Date Required" ControlToValidate="NotificationDateTextBox" Display="Dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>			
				<td class="style8"  style="width:350px; padding-top:5px;">
			Date Report Submitted to Solicitors / TPI<br />
					<asp:TextBox ID="ReportSubmittedTextBox" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="AccidentDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="ReportSubmittedTextBox" Format="dd/MM/yyyy">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="DateValidator2" runat="server" ErrorMessage="Valid Date Required" ControlToValidate="ReportSubmittedTextBox" Display="Dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>			
					<td class="style8"   style="width:260px;padding-top:5px;">
				Date Repair Authorized<br />
					<asp:TextBox ID="DateRepairAuthorizedTextBox" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="DateRepairAuthorizedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="DateRepairAuthorizedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
				
				</tr>
				<tr>
		
				<td class="style8" style="width:200px; padding-left:12px;">
		Date of Settlement Offer<br />
		
					<asp:TextBox ID="OfferAcceptedTextBox" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="AccidentDate_CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="OfferAcceptedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="DateValidator4" runat="server" ControlToValidate="OfferAcceptedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				
		
		
		</td>
			
			<td class="style8" style="width:250px;">
						Date Cheque Received <br />
				
					<asp:TextBox ID="ChequeReceivedTextBox" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="AccidentDate_CalendarExtender2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ChequeReceivedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="DateValidator5" runat="server" ControlToValidate="ChequeReceivedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				
			</td>
			
				<td class="style8"   style="width:260px;">
		Date Report&nbsp; Received<br />
				
					<asp:TextBox ID="ReportRecievedDate" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender7" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ReportRecievedDate">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="ReportRecievedDate" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" /></td>
			
			</tr>
			
			
					<tr>
		
				<td class="style8" style="width:200px; padding-left:12px;">
				    Date Vehicle Inspected<br />	
					<asp:TextBox ID="ReportInspected" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender5" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ReportInspected">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="ReportInspected" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			<td class="style8" style="width:250px;">Date Engineer Instructed<br />
		
					<asp:TextBox ID="ReportInstructed" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender6" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ReportInstructed">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="ReportInstructed" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
				<td class="style8"   style="width:260px;">
					
				</td>
			
			</tr>
			
			<tr><td style="padding:10px;" colspan="2">
			
			
			<asp:Button Text="Submit Details" OnClick="SubmitLossofUsedDates_Click" runat="server" />
			
			&nbsp;
		
					
				<asp:Button ID="Button1" Text="Cancel" runat="server" onclick="Button1_Click" />
			    <br />
                <br />
			</td>
			</tr>
		
		</table>
		</div>
		
		<br />
		<br />
		
</div>
</asp:Content>

	
