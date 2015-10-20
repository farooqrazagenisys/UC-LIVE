<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StorageInvoice.aspx.cs" Inherits="UC_LIVE.StorageInvoice" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">

		.style4
		{
			font-size: 14px;
			font-weight: bold;
			height: 173px;
			width: 737px;
		}
		.style5
		{
			height: 173px;
		}
		.style7
		{
			width: 664px;
		}
		.style8
		{
			width: 239px;
		}
		.style9
		{
			width: 218px;
		}
		.style11
		{
			width: 37px;
		}
		.style12
		{
			height: 20px;
			width: 737px;
		}
		.style13
		{
			width: 296px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 950px; background-color:white;">
        <tr>
            <td valign="top">
		<div class="MainHeading">Storage Invoice</div>
			
				
					                    <div id="Msg" runat="server">
                </div>
          <div style="background-color:#EEE; margin-left:20px ; margin-right:20px; padding-bottom:10px;padding-top:10px;">
                <table id="AddTable" runat="server" >
					<tr>
						<td class="style8" style="padding-left:20px; width:150px;">
						Start Date <br />
								<asp:TextBox ID="StorageStartDate" runat="server"></asp:TextBox>
						<cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="StorageStartDate" Format="dd/MM/yyyy" >
						</cc1:CalendarExtender>
							<asp:RegularExpressionValidator ID="DateValidator2" runat="server"     
                                    ErrorMessage="Valid Date Required" 
                                    ControlToValidate="StorageStartDate"  Display="Dynamic"    
                                    ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
					</td>
					
						<td class="style8">
						End Date</br>
					
								<asp:TextBox ID="StorageEndDate" runat="server"></asp:TextBox>
						<cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Enabled="True" TargetControlID="StorageEndDate" Format="dd/MM/yyyy" > 
						</cc1:CalendarExtender>
									<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"     
                                    ErrorMessage="Valid Date Required" 
                                    ControlToValidate="StorageEndDate"  Display="Dynamic"    
                                    ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
						
					
					</td>
					
					</tr>
					</table><table>
					
					<tr>
					
						<td class="style8"  style="padding-left:20px;  width:150px;">
							Storage Location:<br />
							<asp:TextBox ID="StorageLocation" runat="server" ></asp:TextBox>
							</td><td class="style8" style="width:150px;">
							Storage Daily Rate<br />
							<asp:TextBox ID="StorageDailyRate" runat="server" ></asp:TextBox>
						</td>
							<td class="style8" style="width:150px;">
							Recovery of Vehicle From:<br />
							<asp:TextBox ID="RecoveryFrom" runat="server" ></asp:TextBox>
					
						</td>
						<td class="style8">							
						Recovery Charge:<br />
							<asp:TextBox ID="RecoverChargesTextBox" runat="server"></asp:TextBox>
						</td>
						
					</tr>
					
					<tr>
				
					</tr>
					
					
				</table>
			
			</td>
			
		</tr>
		<tr>
			<td align="left" style="padding-left:20px;">
				<asp:Button ID="AddDocument" runat="server" Text="Submit Details" OnClick="AddInvoiceClick" Height="25px" Width="140px" />
				
				
				<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Start Storage Hire" Visible="false"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:Panel ID="PanelInvoiceDetials" runat="server" Visible="false" Height="225px" Width="825px">
					<table>
						<tr>
							<td class="style9">
								<asp:HiddenField ID="InvoiceIDUpdate" runat="server" />
								&nbsp;<br />
								<br />
								<br />
								&nbsp;<asp:Button ID="UpdateInvoice" runat="server" Text="Update Invoice" OnClick="UpdateInvoice_Click" />
							</td>
							<td class="style8">
								&nbsp;
							</td>
							<td class="style7">
								&nbsp;
							</td>
						</tr>
					</table>
				</asp:Panel>
			</td>
		</tr>
	</table>
</asp:Content>
