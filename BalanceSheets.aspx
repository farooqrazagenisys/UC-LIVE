<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BalanceSheets.aspx.cs" Inherits="UC_LIVE.BalanceSheets" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
        <link href="Styles/grid.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="3" 
            DataKeyNames="BalanceReminderID" DataSourceID="SqlDataSource2"
                    ForeColor="#333333" GridLines="None" CssClass="GridView1" 
            Width="978px" >
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField HeaderText="ID" ItemStyle-Width="50" 
                            DataField="BalanceReminderID" InsertVisible="False" ReadOnly="True" 
                            SortExpression="BalanceReminderID"  >

                        </asp:BoundField>
                        <asp:BoundField DataField="BalanceDate" HeaderText="Date" 
                            SortExpression="BalanceDate" ItemStyle-Width="200" 
                            ControlStyle-Width="200"   DataFormatString="{0:dd-MM-yyyy}"  >
                        

                        </asp:BoundField>
                        
                        <asp:BoundField DataField="AmountOutstanding" HeaderText="Balance" 
                            SortExpression="AmountOutstanding" ItemStyle-Width="150" DataFormatString="{0:C}"   >

                        </asp:BoundField>
                        <asp:BoundField DataField="InvoiceReference" HeaderText="Invoice No" SortExpression="InvoiceReference"
                            ItemStyle-Width="150" >
                     

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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
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
