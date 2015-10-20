<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AmountPaid.aspx.cs" Inherits="UC_LIVE.AmountPaid" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div style="background-color:White;">
		<div  class="MainHeading">Amount Paid</div>
		
		<div id="ErrorMsg" runat="server" style="color:Red; font-family:Microsoft Sans Serif; font-size:12px; width:500px; margin-left:20px;"  ></div>
		
		<div id="AmountDueValue" runat="server" style="font-family:Microsoft Sans Serif; font-size:12px; width:500px; margin-left:20px; color:black;"  ></div>
		<table style=" width:905px; margin-left:20px; margin-right:20px; background-color:#EEE;">
		
			<tr>
				<td style="height: 5px;" valign="top" style="padding-left:20px; padding-top:10px;">				
			
					
					
					<div class="style8" >Enter Amount</div>
					<asp:TextBox ID="AmountPaidTextBox" runat="server"></asp:TextBox>
					
							<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="AmountPaidTextBox" 
                                Display="Dynamic"   ValidationGroup="AmountPaidgroup"
                                >* </asp:RequiredFieldValidator>
					
					  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="AmountPaidTextBox" 
                                    Display="Dynamic" ErrorMessage=""  ValidationGroup="AmountPaidgroup"
                                    Text="*" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$" ></asp:RegularExpressionValidator>
					
						<div class="style8" >Enter Date</div>
					<asp:TextBox ID="AmountPaidDate" runat="server"></asp:TextBox>
				 <cc1:calendarextender ID="AmountPaidDatecalender" runat="server" Enabled="True"
                                        Format="dd/MM/yyyy" TargetControlID="AmountPaidDate">
                                    </cc1:calendarextender>
					
					<div class="style8" >Payment Made By</div>
					<asp:TextBox ID="PaymentMadeTextBox" runat="server"></asp:TextBox>
					
					<div class="style8" >Payment Taken By</div>
					<asp:TextBox ID="PaymentTakenBy" runat="server"></asp:TextBox>
										<div class="style8" >Payment Method</div>
						<asp:TextBox ID="PaymentMethod" runat="server"></asp:TextBox>
					<asp:HiddenField ID="ClaimReference" runat="server" />
					<asp:HiddenField ID="InvoiceReference" runat="server" />
					
					
					
					
				
				<div style="padding-top:10px; padding-bottom:10px;">
					<asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" ValidationGroup="AmountPaidgroup" />
					
					<asp:Button ID="CancelButton" runat="server" Text="Cancel" 
            onclick="CancelButton_Click"/>
            
					</div>
				</td>
			</tr>
	
		</table>
	

</div>

</asp:Content>
