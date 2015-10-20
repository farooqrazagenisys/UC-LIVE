<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewReferralInvoice.aspx.cs" Inherits="UC_LIVE.ViewReferralInvoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
	<style type="text/css">
		.style1
		{
			height: 91px;
		}
		
		#maindiv
		{
			width: 800px;
			text-align:center;	
			margin: 0 auto; 
			
		}
		
		.ColumnSize
		{
		    
		    width:50px;
		    
		  }
		
	    .style2
        {
            height: 34px;
        }
        .style3
        {
            height: 36px;
            width: 151px;
        }
        .style4
        {
            height: 37px;
        }
        .style5
        {
            height: 13px;
        }
		
	    .style6
        {
            height: 33px;
        }
        		
	    .style8
        {
            height: 13px;
            width: 12px;
        }
        .style9
        {
            width: 12px;
        }
        .style10
        {
            height: 25px;
            width: 12px;
        }
		
	    .style11
        {
            width: 151px;
        }
		
	    .style12
        {
            height: 25px;
        }
        
        .TextAreaStyle
        {
            
           border: 1px solid white;
           overflow:hidden; 
           font-family:Arial;
           
            
            
            }
            
            .headerstyle
            {
                margin-bottom:10px;
                
                
                }
		
	</style>
</head>
<body>
   <form id="form1" runat="server">
	<div id="maindiv" style="text-align:left; font-family:Arial;margin: 0 auto; height:1157px;">
		<table style="margin: 0 auto;">
			<tr>
				<td colspan="3">
				
				<div id="DocumentHeader" runat="server"></div>
				
					<div id="ViewHeaderImage" runat="server" style="margin-left:250px;">
					</div>
					
					<div id="ViewCompanyAddress" runat="server" style="margin-left:150px; font-size:12px;" >
					</div>
			</tr>
			<tr>
				<td style="height: 5px;">
				</td>
			</tr>
			<tr>
				<td class="style6">
					
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
				
                 <div style="float:left; width:513px; ">   
                 <asp:TextBox ID="ViewContactInfo" runat="server" TextMode="MultiLine" 
                        Width="233px" Height="88px" CssClass="TextAreaStyle" ></asp:TextBox>
                        </div>
				
					<div id="InvoiceNumber" runat="server" style="width:200px; margin-left:10px; float:left; text-align:left;  font-size:14px; font-weight:bold;">
					</div>
					<div id="ViewClaimReference" runat="server" style="width:200px; margin-left:10px; float:left; text-align:left;  font-size:14px; font-weight:bold;">
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
				<td colspan="3" style="background-color:#FFFFFF; margin-top: 20px; height: 30px; text-align: center; font-family:Times New Roman; font-size: 18px;" valign="top">
				
		
		
		<%--<div id="InvoiceType" runat="server" 
                        style="width:765px; margin-bottom:25px; text-align:center; height:35px; font-size:35px; font-weight:bold;">
					</div>--%>
<br />
					<div id="ViewTitle" runat="server" 
                        style="width:785px; background-color:#1f3b8e; color:WHITE; font-weight:bold; margin-right:10px; margin-bottom:0px; padding-top:1px; text-align:center; height:35px; font-size:34px; font-family:Times New Roman; font-size:25PX;">
					</div>
				<br />
<div id="ViewHeader" runat="server" 
                        style="width:785px; text-align:left; font-size:8px; height:80px; font-size:14PX; font-family:Times New Roman">
					</div>

				</td>
			</tr>
			
			
			
			<tr>
				<td colspan="3" align="center" style="text-align: left;">
					<asp:GridView ID="GridView1" CssClass="GridView1" runat="server" 
                        AutoGenerateColumns="False" CellPadding="1" DataKeyNames="InvoiceDetailID" 
                        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                        Height="16px" Width="782px">
						<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
						<Columns>
										<asp:ButtonField ControlStyle-Width="2"  /><asp:ButtonField />
							<asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details"  ControlStyle-CssClass="ColumnSize" ControlStyle-Width="650" ItemStyle-Height="35" ItemStyle-Width="650" >



                            </asp:BoundField>
		<%--					<asp:BoundField DataField="NoOfDays" HeaderText="No of Days" SortExpression="NoOfDays">

                            </asp:BoundField>
					<asp:BoundField DataField="Rate" HeaderText="Daily Rate" SortExpression="Rate">													

                            </asp:BoundField>--%>
							<asp:BoundField DataField="Amount" HeaderText="Total Amount" SortExpression="Amount" DataFormatString="{0:C}"  >

                            </asp:BoundField>
						</Columns>
						<FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
						<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
						<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
						<HeaderStyle BackColor="#E2DED6" Font-Bold="True" Font-Size="Small" ForeColor="Black" Height="30" CssClass="headerstyle" />
					    <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
							<asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="String" />
						</SelectParameters>
					</asp:SqlDataSource>
					
					<asp:GridView ID="GridView2" CssClass="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceDetailID" DataSourceID="SqlDataSource2" CellPadding="1" ForeColor="#333333" GridLines="None" Height="120px" Width="774px">
						<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
						<Columns>
					<asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" ControlStyle-Width="100" />
						<asp:BoundField DataField="NoOfDays" HeaderText="No of Days" SortExpression="NoOfDays" ControlStyle-Width="100"/>
							<asp:BoundField DataField="Rate" HeaderText="Daily Rate" SortExpression="Rate" ControlStyle-Width="100"/>
							<asp:BoundField DataField="Amount" HeaderText="Total Amount" SortExpression="Amount" ControlStyle-Width="100"/>
						</Columns>
						<FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
						<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
						<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
						<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					    <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					</asp:GridView>
					<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [InvoiceDetails] WHERE [InvoiceDetailID] = @InvoiceDetailID" InsertCommand="INSERT INTO [InvoiceDetails] ([Details], [NoOfDays], [Rate], [Amount], [InvoiceID]) VALUES (@Details, @NoOfDays, @Rate, @Amount, @InvoiceID)" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT [InvoiceDetailID], [Details], [NoOfDays], [Rate], [Amount], [InvoiceID] FROM [InvoiceDetails] Where InvoiceID=@CreditNoteID" UpdateCommand="UPDATE [InvoiceDetails] SET [Details] = @Details, [NoOfDays] = @NoOfDays, [Rate] = @Rate, [Amount] = @Amount, [InvoiceID] = @InvoiceID WHERE [InvoiceDetailID] = @InvoiceDetailID">
						<DeleteParameters>
							<asp:Parameter Name="InvoiceDetailID" Type="Int32" />
						</DeleteParameters>
						<InsertParameters>
							<asp:Parameter Name="Details" Type="String" />
							<asp:Parameter Name="NoOfDays" Type="Int32" />
							<asp:Parameter Name="Rate" Type="Decimal" />
							<asp:Parameter Name="Amount" Type="Decimal" />
							<asp:Parameter Name="InvoiceID" Type="Int32" />
						</InsertParameters>
						<UpdateParameters>
							<asp:Parameter Name="Details" Type="String" />
							<asp:Parameter Name="NoOfDays" Type="Int32" />
							<asp:Parameter Name="Rate" Type="Decimal" />
							<asp:Parameter Name="Amount" Type="Decimal" />
							<asp:Parameter Name="InvoiceID" Type="Int32" />
							<asp:Parameter Name="InvoiceDetailID" Type="Int32" />
						</UpdateParameters>
						
							<SelectParameters>
							<asp:QueryStringParameter Name="CreditNoteID" QueryStringField="CreditNoteID" Type="String" />
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
					<table style="width: 778px; height: 81px" border="0" cellpadding="0" cellspacing="0" >
						<tr >
							<td class="style3" rowspan="3" >
								<table class="style4" style="background-color:White; width:450px; margin-top:150px;">
									<tr>
										<td class="style1">
											<div id="ViewAdditionalInstructions" runat="server" style="width:490px;  font-family:Arial; font-size:12px;">
											</div>
										</td>
									</tr>
								</table>
							</td>
							<td class="style5" style=" height:30px;">
							<table style="vertical-align:top; margin-left:0px; background-color:#EEE; padding:10px; width:280px; "><tr><td valign="top">
							<tr><td>
									&nbsp;&nbsp;&nbsp;Total Cost
							</td>
							<td class="style8" style="height:25px;">
								&nbsp;
							</td>
							<td class="style5" style=" height:25px;">
								<div id="ViewTotalCost" runat="server">
								</div>
							</td>
							
							</td></tr><tr>
								<td >
								<div id="VATRATE" runat="server"></div>
							</td>
							<td >
								&nbsp;
							</td>
							<td>
								<div id="ViewVAT" runat="server" >
								</div>
							</td>
							
							</tr><tr >
							<td >
								&nbsp;&nbsp;&nbsp;Amount Due</td>
							<td >
								&nbsp;
							</td>
							<td class="style12" style=" height:10px;">
								<div id="ViewGrandTotal" runat="server" >  
								</div>
							</td>
						</tr></table>
							</td>
						</tr>
						
					
						
						
					
								<tr id="ViewAmountDueText" runat="server" >
							<td class="style11">
								&nbsp;</td>
							<td>
								&nbsp;</td>
							<td class="style9">
								
							</td>
							<td><div id="ViewAmountDue" runat="server" >
								</div>
								
								
								</td>
						</tr>
					</table>
					
						
				</td>
			</tr>
		</table>
	</div>
	
<table><tr><td valign="middle" align="center"><div id="FooterValue" runat="server" style=" margin-left:160px; margin-right:200px;  margin-top:430px; width:900px; font-size:11px; text-align:center;"></div>
	</td></tr></table>
	
	
	</form>
</body>
</html>
