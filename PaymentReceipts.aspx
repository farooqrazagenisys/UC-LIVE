<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentReceipts.aspx.cs" Inherits="UC_LIVE.PaymentReceipts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
        <link href="Styles/grid.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Payment Receipts</h1>
      <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="3" 
            DataKeyNames="PaymentRecieptID" DataSourceID="SqlDataSource2"
                    ForeColor="#333333" GridLines="None" CssClass="GridView1" 
            Width="950px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField HeaderText="ID" ItemStyle-Width="50" 
                            DataField="PaymentRecieptID" InsertVisible="False" ReadOnly="True" 
                            SortExpression="PaymentRecieptID" >

                        </asp:BoundField>
                        <asp:BoundField DataField="PaymentMade" HeaderText="Amount Paid" 
                            SortExpression="PaymentMade" ItemStyle-Width="120" >
                        

                        </asp:BoundField>
                        
                        <asp:BoundField DataField="PaymentDate" HeaderText="Date" 
                            SortExpression="PaymentDate" ItemStyle-Width="120" 
                            DataFormatString="{0:dd-MM-yyyy}" >

                        </asp:BoundField>
                        <%--
                        <asp:BoundField DataField="InvoiceType" HeaderText="Type" SortExpression="InvoiceType"
                            ItemStyle-Width="70" />--%>
                        <%--        
                        <asp:CommandField ShowDeleteButton="True" />--%><asp:BoundField 
                            DataField="PaymentMadeBy" HeaderText="Payment Made By" 
                            SortExpression="PaymentMadeBy" />
                
                                 <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" 
                            SortExpression="PaymentMethod" />
                        <asp:BoundField DataField="InvoiceReference" HeaderText="Invoice Reference" 
                            SortExpression="InvoiceReference" />
                            
                        <asp:BoundField DataField="ClaimReference" HeaderText="Claim Reference" 
                            SortExpression="ClaimReference" />
                                    <asp:TemplateField HeaderText=" ">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLinkViewDetails2" runat="server" ForeColor="GrayText" NavigateUrl='<%# Eval("PaymentRecieptID", "~/PaymentReciept.aspx?PaymentRecieptID={0}") + Eval("InvoiceReference", "&InvoiceID={0}") + Eval("ClaimReference", "&ClaimID={0}")%>'
                                            Text="View Payment Reciept"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
            
                    </Columns>
                    <FooterStyle BackColor="#dfe9f5" ForeColor="#385070" />
                    <PagerStyle BackColor="#dfe9f5" ForeColor="#385070" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" />
                    <HeaderStyle BackColor="#dfe9f5" ForeColor="#385070" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    
            SelectCommand="SELECT [PaymentRecieptID], [PaymentMade], [PaymentDate], [PaymentMadeBy], [PaymentMethod], [InvoiceReference], [ClaimReference] FROM [PaymentReciept] WHERE ([InvoiceReference] = @InvoiceReference)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceReference" QueryStringField="InvoiceID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </div>
      <div>
      <h1>Balance Sheets</h1>
      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="3" 
            DataKeyNames="BalanceReminderID" DataSourceID="SqlDataSource1"
                    ForeColor="#333333" GridLines="None" CssClass="GridView1" 
            Width="978px" >
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField HeaderText="ID" ItemStyle-Width="50" 
                            DataField="BalanceReminderID" InsertVisible="False" ReadOnly="True" 
                            SortExpression="BalanceReminderID"  >

<ItemStyle Width="50px"></ItemStyle>

                        </asp:BoundField>
                        <asp:BoundField DataField="BalanceDate" HeaderText="Date" 
                            SortExpression="BalanceDate" ItemStyle-Width="200" 
                            ControlStyle-Width="200"   DataFormatString="{0:dd-MM-yyyy}"  >
                        

<ControlStyle Width="200px"></ControlStyle>

<ItemStyle Width="200px"></ItemStyle>
                        

                        </asp:BoundField>
                        
                        <asp:BoundField DataField="AmountOutstanding" HeaderText="Balance" 
                            SortExpression="AmountOutstanding" ItemStyle-Width="150" DataFormatString="{0:C}"   >

<ItemStyle Width="150px"></ItemStyle>

                        </asp:BoundField>
                        <asp:BoundField DataField="InvoiceReference" HeaderText="Invoice No" SortExpression="InvoiceReference"
                            ItemStyle-Width="150" >
                     

<ItemStyle Width="150px"></ItemStyle>
                     

                        </asp:BoundField>
                     
               
                        <%--        
                        <asp:CommandField ShowDeleteButton="True" />--%>
                        
                        <asp:BoundField DataField="ClaimReference" HeaderText="Claim No" 
                            SortExpression="ClaimReference" />
                                  <asp:TemplateField HeaderText=" ">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLinkViewDetails2" runat="server" ForeColor="GrayText" NavigateUrl='<%# Eval("BalanceReminderID", "~/BalanceSheet.aspx?BalanceReminderID={0}") + Eval("InvoiceReference", "&InvoiceID={0}") + Eval("ClaimReference", "&ClaimID={0}")%>'
                                            Text="View Balance Sheet"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>

                    </Columns>
                    <FooterStyle BackColor="#dfe9f5" ForeColor="#385070" />
                    <PagerStyle BackColor="#dfe9f5" ForeColor="#385070" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" />
                    <HeaderStyle BackColor="#dfe9f5" ForeColor="#385070" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    
            
            SelectCommand="SELECT [BalanceReminderID], [BalanceDate],[AmountOutstanding], [InvoiceReference], [ClaimReference], [AmountOutstanding] FROM [BalanceReminder] WHERE ([InvoiceReference] = @InvoiceReference)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceReference" QueryStringField="InvoiceID" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
