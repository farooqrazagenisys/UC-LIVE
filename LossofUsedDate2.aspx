<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LossofUsedDate2.aspx.cs" Inherits="UC_LIVE.LossofUsedDate2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
			Date Report submitted to Solicitors / TP<br />
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
				Date of settlement offer<br />	
					<asp:TextBox ID="SettlementDateTextBox" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="AccidentDate_CalendarExtender0" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="SettlementDateTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="DateValidator3" runat="server" ControlToValidate="SettlementDateTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			<td class="style8" style="width:250px;">Date offer accepted<br />
		
					<asp:TextBox ID="OfferAcceptedTextBox" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="AccidentDate_CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="OfferAcceptedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="DateValidator4" runat="server" ControlToValidate="OfferAcceptedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
				<td class="style8"   style="width:260px;">
					Date cheque Received<br />
				
					<asp:TextBox ID="ChequeReceivedTextBox" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="AccidentDate_CalendarExtender2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ChequeReceivedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="DateValidator5" runat="server" ControlToValidate="ChequeReceivedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			</tr>
			
			<tr><td style="height:40px"></td></tr>
			
			<tr>
		
				<td class="style8" style="width:200px; padding-left:12px;">
				Date Engineer Instructed<br />	
					<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="SettlementDateTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="SettlementDateTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			<td class="style8" style="width:250px;">Date of Inspection <br />
		
					<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="OfferAcceptedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="OfferAcceptedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
				<td class="style8"   style="width:260px;">
					Cheque Received<br />
				
					<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ChequeReceivedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="ChequeReceivedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			</tr>
			<tr>
		
				<td class="style8" style="width:200px; padding-left:12px;">
				    Hire Start Date<br />	
					<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender5" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="SettlementDateTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="SettlementDateTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			<td class="style8" style="width:250px;">Hire End Date<br />
		
					<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender6" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="OfferAcceptedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="OfferAcceptedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
				<td class="style8"   style="width:260px;">
					Hire No Of Days<br />
				
					<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender7" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ChequeReceivedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="ChequeReceivedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			</tr>
			<tr>
		
				<td class="style8" style="width:200px; padding-left:12px;">
				    Storage Start Date<br />	
					<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender8" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="SettlementDateTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="SettlementDateTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			<td class="style8" style="width:250px;">Storage End Date<br />
		
					<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender9" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="OfferAcceptedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="OfferAcceptedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
				<td class="style8"   style="width:260px;">
					Storage NoOf Days<br />
				
					<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
					<cc1:CalendarExtender ID="CalendarExtender10" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="ChequeReceivedTextBox">
					</cc1:CalendarExtender>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="ChequeReceivedTextBox" Display="Dynamic" ErrorMessage="Valid Date Required" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			
			</tr>
			<tr><td style="padding:10px;" colspan="2">
			
			
			<asp:Button ID="Button1" Text="Submit Details" OnClick="SubmitLossofUsedDates_Click1" runat="server" />
			
			&nbsp;
		
					
				<asp:Button ID="Button2" Text="Cancel" runat="server" onclick="Button1_Click" />
			</td>
			</tr>
		
		</table>
		</div>
</div>

</asp:Content>
