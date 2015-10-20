<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewInvoice.aspx.cs" Inherits="UC_LIVE.ViewInvoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title></title>
	<style type="text/css">
		#maindiv
		{
			width: 773px;
			text-align: center;
			margin: 0 auto;
			height: 476px;
			font-family: Arial;
			font-size: 12px;
		}
		#ViewDescription
		{
			font-size: medium;
		}
		#ViewAdditionalInstructions
		{
			text-align: left;
			margin-left: 5px;
			font-size: 10px;
			line-height: 1.5em;
			font-family: Arial;
		}
		#ViewContactInfo
		{
			text-align: left;
			margin-left: 5px;
		}
		#ViewHeaderImage
		{
		}
		.style2
		{
			height: 77px;
		}
		#form1
		{
			height: 647px;
			width: 790px;
		}
		.style3
		{
			width: 284px;
		}
		.style4
		{
			width: 100%;
			height: 75px;
		}
		.style5
		{
			height: 5px;
			width: 751px;
		}
		.style6
		{
			width: 751px;
		}
		#ViewTitle
		{
			width: 761px;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
	<div id="maindiv">
		<table style="width: 100%;">
			<tr>
				<td colspan="3">
					<div id="ViewHeaderImage" runat="server" >
					</div>
			</tr>
			<tr>
				<td style="height: 5px;">
				</td>
			</tr>
			<tr>
				<td class="style6">
					<div id="InvoiceType" runat="server" style="font-size:30px; text-align:left; margin:10px;">
					</div>
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="style6">
					<div id="ViewContactInfo" runat="server" style="width:450px; float:left;">
					</div>
					<div id="InvoiceNumber" runat="server" style="width:250px; float:left;">
					</div>
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="3" style="background-color:#FFFFFF; margin: 20px; height: 30px; text-align: center; font-size: 18px;">
					<div id="ViewTitle" runat="server">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center" style="text-align: left;">
					<asp:GridView ID="GridView1" CssClass="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="InvoiceDetailID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" Height="111px" Width="773px">
						<RowStyle BackColor="#EFF3FB" />
						<Columns>
							<asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
							<asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
							<asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
						</Columns>
						<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
						<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
						<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<EditRowStyle BackColor="#2461BF" />
						<AlternatingRowStyle BackColor="White" />
					</asp:GridView>
					<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [InvoiceDetails] WHERE [InvoiceDetailID] = @InvoiceDetailID" InsertCommand="INSERT INTO [InvoiceDetails] ([Details], [NoOfDays], [Rate], [Amount], [InvoiceID]) VALUES (@Details, @NoOfDays, @Rate, @Amount, @InvoiceID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [InvoiceDetailID], [Details], [NoOfDays], [Rate], [Amount], [InvoiceID] FROM [InvoiceDetails] Where InvoiceID=@InvoiceID" UpdateCommand="UPDATE [InvoiceDetails] SET [Details] = @Details, [NoOfDays] = @NoOfDays, [Rate] = @Rate, [Amount] = @Amount, [InvoiceID] = @InvoiceID WHERE [InvoiceDetailID] = @InvoiceDetailID">
						<DeleteParameters>
							<asp:Parameter Name="InvoiceDetailID" Type="Int32" />
						</DeleteParameters>
						<InsertParameters>
							<asp:Parameter Name="Details" Type="String" />
							<asp:Parameter Name="NoOfDays" Type="String" />
							<asp:Parameter Name="Rate" Type="Int32" />
							<asp:Parameter Name="Amount" Type="Int32" />
							<asp:Parameter Name="InvoiceID" Type="Int32" />
						</InsertParameters>
						<UpdateParameters>
							<asp:Parameter Name="Details" Type="String" />
							<asp:Parameter Name="NoOfDays" Type="String" />
							<asp:Parameter Name="Rate" Type="Int32" />
							<asp:Parameter Name="Amount" Type="Int32" />
							<asp:Parameter Name="InvoiceID" Type="Int32" />
							<asp:Parameter Name="InvoiceDetailID" Type="Int32" />
						</UpdateParameters>
						<SelectParameters>
							<asp:QueryStringParameter DefaultValue="1" Name="InvoiceID" QueryStringField="InvoiceID" Type="String" />
						</SelectParameters>
					</asp:SqlDataSource>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="height: 10px;">
				</td>
			</tr>
			<tr>
				<td colspan="3" class="style2">
					<table style="width: 778px; height: 81px">
						<tr>
							<td class="style3" rowspan="3">
								<table class="style4">
									<tr>
										<td>
											<div id="ViewAdditionalInstructions" runat="server">
											</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								Total Cost
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<div id="ViewTotalCost" runat="server">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="VATRATE" runat="server"></div>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<div id="ViewVAT" runat="server">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Amount Due
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<div id="ViewAmountDue" runat="server">
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	</div>
	</form>
</body>
</html>
