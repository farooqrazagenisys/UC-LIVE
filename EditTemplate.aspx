<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="EditTemplate.aspx.cs" Inherits="UC_LIVE.EditTemplate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 950px; background-color: White;">
        <div class="MainHeading">
            Manage Templates</div>
        <div style="margin-left: 20px; width: 905px; border: 1px solid #eee; border-top: 0px;">
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" MultiPageID="RadMultiPage1"
                SelectedIndex="0">
                <Tabs>
                    <telerik:RadTab Text="Clients" runat="server" TabIndex="0">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Insurance Companies" runat="server" TabIndex="1">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Engineer Companies" runat="server" TabIndex="2">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Solicitor Companies" runat="server" TabIndex="3">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Car Hire Companies" runat="server" TabIndex="4">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Storage Companies" runat="server" TabIndex="5">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="bodytext">
                <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="0">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TemplateID"
                        DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
                        AllowPaging="True" AllowSorting="True" CellPadding="2" ForeColor="Black" GridLines="None"
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" Width="895px" CssClass="GridView1" >
                        <Columns>
                
                <asp:BoundField HeaderText="" ItemStyle-Width="10" ItemStyle-Height="25" />
                            <asp:BoundField DataField="TemplateID" HeaderText="TemplateID" ReadOnly="True" SortExpression="TemplateID" />
                            <asp:BoundField DataField="TemplateTitle" HeaderText="TemplateTitle" SortExpression="TemplateTitle" />
                            <asp:TemplateField HeaderText=" ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='View Template'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("TemplateID", "~/updateTemplate.aspx?TemplateID={0}") %>'
                                        Text='View Template' ForeColor="GrayText"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="False" ButtonType="Image"
                                EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                                UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                                CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                                    
                                 <asp:TemplateField HeaderText="">
                  <ItemTemplate>
               
                  
             <asp:ImageButton ID="lnkDelete" Text="Delete" ImageUrl="~/Images/Grid/IconDelete.png"
                                runat="server" 
                                CommandName="Delete"                            
                                OnClientClick="javascript:return confirm('You are about to delete a record, Are you sure?');">
                </asp:ImageButton>
            </ItemTemplate>

                    </asp:TemplateField>
                  
                        </Columns>
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <FooterStyle CssClass="FooterStyle1" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <RowStyle CssClass="RowStyle1" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [DocumentTemplate] WHERE [TemplateID] = @TemplateID"
                        InsertCommand="INSERT INTO [DocumentTemplate] ([TemplateTitle]) VALUES (@TemplateTitle)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TemplateID], [TemplateTitle] FROM [DocumentTemplate] where TemplateTypeID='7'"
                        UpdateCommand="UPDATE [DocumentTemplate] SET [TemplateTitle] = @TemplateTitle WHERE [TemplateID] = @TemplateID">
                        <DeleteParameters>
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="0">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="TemplateID"
                        DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display."
                        AllowPaging="True" AllowSorting="True" CellPadding="2" ForeColor="#333333" GridLines="None"
                        Width="898px" CssClass="GridView1">
                                    <Columns>
                
                <asp:BoundField HeaderText="" ItemStyle-Width="10" ItemStyle-Height="25" />
                            <asp:BoundField DataField="TemplateID" HeaderText="TemplateID" ReadOnly="True" SortExpression="TemplateID" />
                            <asp:BoundField DataField="TemplateTitle" HeaderText="TemplateTitle" SortExpression="TemplateTitle" />
                            <asp:TemplateField HeaderText=" ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='View Template'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("TemplateID", "~/updateTemplate.aspx?TemplateID={0}") %>'
                                        Text='View Template' ForeColor="GrayText"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="False" ButtonType="Image"
                                EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                                UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                                CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                                    
                                 <asp:TemplateField HeaderText="">
                  <ItemTemplate>
               
                  
             <asp:ImageButton ID="lnkDelete" Text="Delete" ImageUrl="~/Images/Grid/IconDelete.png"
                                runat="server" 
                                CommandName="Delete"                            
                                OnClientClick="javascript:return confirm('You are about to delete a record, Are you sure?');">
                </asp:ImageButton>
            </ItemTemplate>

                    </asp:TemplateField>
                  
                        </Columns>
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <FooterStyle CssClass="FooterStyle1" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [DocumentTemplate] WHERE [TemplateID] = @TemplateID"
                        InsertCommand="INSERT INTO [DocumentTemplate] ([TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID]) VALUES (@TemplateTitle, @TemplateBody, @TemplateHeader, @TemplateFooter, @TemplateTypeID)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TemplateID], [TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID] FROM [DocumentTemplate] where TemplateTypeID='1'"
                        UpdateCommand="UPDATE [DocumentTemplate] SET [TemplateTitle] = @TemplateTitle, [TemplateBody] = @TemplateBody, [TemplateHeader] = @TemplateHeader, [TemplateFooter] = @TemplateFooter, [TemplateTypeID] = @TemplateTypeID WHERE [TemplateID] = @TemplateID">
                        <DeleteParameters>
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="0">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="TemplateID"
                        DataSourceID="SqlDataSource3" EmptyDataText="There are no data records to display."
                        AllowPaging="True" AllowSorting="True" CellPadding="2" ForeColor="#333333" GridLines="None"
                        Width="895" CssClass="GridView1">
                                    <Columns>
                
                <asp:BoundField HeaderText="" ItemStyle-Width="10" ItemStyle-Height="25" />
                            <asp:BoundField DataField="TemplateID" HeaderText="TemplateID" ReadOnly="True" SortExpression="TemplateID" />
                            <asp:BoundField DataField="TemplateTitle" HeaderText="TemplateTitle" SortExpression="TemplateTitle" />
                            <asp:TemplateField HeaderText=" ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='View Template'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("TemplateID", "~/updateTemplate.aspx?TemplateID={0}") %>'
                                        Text='View Template' ForeColor="GrayText"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="False" ButtonType="Image"
                                EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                                UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                                CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                                    
                                 <asp:TemplateField HeaderText="">
                  <ItemTemplate>
               
                  
             <asp:ImageButton ID="lnkDelete" Text="Delete" ImageUrl="~/Images/Grid/IconDelete.png"
                                runat="server" 
                                CommandName="Delete"                            
                                OnClientClick="javascript:return confirm('You are about to delete a record, Are you sure?');">
                </asp:ImageButton>
            </ItemTemplate>

                    </asp:TemplateField>
                  
                        </Columns>
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <FooterStyle CssClass="FooterStyle1" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <RowStyle CssClass="RowStyle1" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [DocumentTemplate] WHERE [TemplateID] = @TemplateID"
                        InsertCommand="INSERT INTO [DocumentTemplate] ([TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID]) VALUES (@TemplateTitle, @TemplateBody, @TemplateHeader, @TemplateFooter, @TemplateTypeID)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TemplateID], [TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID] FROM [DocumentTemplate] where TemplateTypeID='3'"
                        UpdateCommand="UPDATE [DocumentTemplate] SET [TemplateTitle] = @TemplateTitle, [TemplateBody] = @TemplateBody, [TemplateHeader] = @TemplateHeader, [TemplateFooter] = @TemplateFooter, [TemplateTypeID] = @TemplateTypeID WHERE [TemplateID] = @TemplateID">
                        <DeleteParameters>
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="0">
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="TemplateID"
                        DataSourceID="SqlDataSource4" EmptyDataText="There are no data records to display."
                        AllowPaging="True" AllowSorting="True" CellPadding="2" ForeColor="#333333" GridLines="None"
                        Width="898" CssClass="GridView1">
                                  <Columns>
                
                <asp:BoundField HeaderText="" ItemStyle-Width="10" ItemStyle-Height="25" />
                            <asp:BoundField DataField="TemplateID" HeaderText="TemplateID" ReadOnly="True" SortExpression="TemplateID" />
                            <asp:BoundField DataField="TemplateTitle" HeaderText="TemplateTitle" SortExpression="TemplateTitle" />
                            <asp:TemplateField HeaderText=" ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='View Template'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("TemplateID", "~/updateTemplate.aspx?TemplateID={0}") %>'
                                        Text='View Template' ForeColor="GrayText"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="False" ButtonType="Image"
                                EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                                UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                                CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                                    
                                 <asp:TemplateField HeaderText="">
                  <ItemTemplate>
               
                  
             <asp:ImageButton ID="lnkDelete" Text="Delete" ImageUrl="~/Images/Grid/IconDelete.png"
                                runat="server" 
                                CommandName="Delete"                            
                                OnClientClick="javascript:return confirm('You are about to delete a record, Are you sure?');">
                </asp:ImageButton>
            </ItemTemplate>

                    </asp:TemplateField>
                  
                        </Columns>
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <FooterStyle CssClass="FooterStyle1" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <RowStyle CssClass="RowStyle1" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [DocumentTemplate] WHERE [TemplateID] = @TemplateID"
                        InsertCommand="INSERT INTO [DocumentTemplate] ([TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID]) VALUES (@TemplateTitle, @TemplateBody, @TemplateHeader, @TemplateFooter, @TemplateTypeID)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TemplateID], [TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID] FROM [DocumentTemplate] where TemplateTypeID='2'"
                        UpdateCommand="UPDATE [DocumentTemplate] SET [TemplateTitle] = @TemplateTitle, [TemplateBody] = @TemplateBody, [TemplateHeader] = @TemplateHeader, [TemplateFooter] = @TemplateFooter, [TemplateTypeID] = @TemplateTypeID WHERE [TemplateID] = @TemplateID">
                        <DeleteParameters>
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="0">
                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="TemplateID"
                        DataSourceID="SqlDataSource5" EmptyDataText="There are no data records to display."
                        AllowPaging="True" AllowSorting="True" CellPadding="2" ForeColor="#333333" GridLines="None"
                        Width="898" CssClass="GridView1">
                                  <Columns>
                
                <asp:BoundField HeaderText="" ItemStyle-Width="10" ItemStyle-Height="25" />
                            <asp:BoundField DataField="TemplateID" HeaderText="TemplateID" ReadOnly="True" SortExpression="TemplateID" />
                            <asp:BoundField DataField="TemplateTitle" HeaderText="TemplateTitle" SortExpression="TemplateTitle" />
                            <asp:TemplateField HeaderText=" ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='View Template'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("TemplateID", "~/updateTemplate.aspx?TemplateID={0}") %>'
                                        Text='View Template' ForeColor="GrayText"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="False" ButtonType="Image"
                                EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                                UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                                CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                                    
                                 <asp:TemplateField HeaderText="">
                  <ItemTemplate>
               
                  
             <asp:ImageButton ID="lnkDelete" Text="Delete" ImageUrl="~/Images/Grid/IconDelete.png"
                                runat="server" 
                                CommandName="Delete"                            
                                OnClientClick="javascript:return confirm('You are about to delete a record, Are you sure?');">
                </asp:ImageButton>
            </ItemTemplate>

                    </asp:TemplateField>
                  
                        </Columns>
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <FooterStyle CssClass="FooterStyle1" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <RowStyle CssClass="RowStyle1" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [DocumentTemplate] WHERE [TemplateID] = @TemplateID"
                        InsertCommand="INSERT INTO [DocumentTemplate] ([TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID]) VALUES (@TemplateTitle, @TemplateBody, @TemplateHeader, @TemplateFooter, @TemplateTypeID)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TemplateID], [TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID] FROM [DocumentTemplate] where TemplateTypeID='4'"
                        UpdateCommand="UPDATE [DocumentTemplate] SET [TemplateTitle] = @TemplateTitle, [TemplateBody] = @TemplateBody, [TemplateHeader] = @TemplateHeader, [TemplateFooter] = @TemplateFooter, [TemplateTypeID] = @TemplateTypeID WHERE [TemplateID] = @TemplateID">
                        <DeleteParameters>
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView6" runat="server" TabIndex="0">
                    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="TemplateID"
                        DataSourceID="SqlDataSource6" EmptyDataText="There are no data records to display."
                        AllowPaging="True" AllowSorting="True" CellPadding="2" ForeColor="#333333" GridLines="None"
                        Width="898" CssClass="GridView1">
                                 <Columns>
                
                <asp:BoundField HeaderText="" ItemStyle-Width="10" ItemStyle-Height="25" />
                            <asp:BoundField DataField="TemplateID" HeaderText="TemplateID" ReadOnly="True" SortExpression="TemplateID" />
                            <asp:BoundField DataField="TemplateTitle" HeaderText="TemplateTitle" SortExpression="TemplateTitle" />
                            <asp:TemplateField HeaderText=" ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='View Template'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("TemplateID", "~/updateTemplate.aspx?TemplateID={0}") %>'
                                        Text='View Template' ForeColor="GrayText"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="False" ButtonType="Image"
                                EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                                UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                                CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                                                    
                                 <asp:TemplateField HeaderText="">
                  <ItemTemplate>
               
                  
             <asp:ImageButton ID="lnkDelete" Text="Delete" ImageUrl="~/Images/Grid/IconDelete.png"
                                runat="server" 
                                CommandName="Delete"                            
                                OnClientClick="javascript:return confirm('You are about to delete a record, Are you sure?');">
                </asp:ImageButton>
            </ItemTemplate>

                    </asp:TemplateField>
                  
                        </Columns>
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <FooterStyle CssClass="FooterStyle1" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <RowStyle CssClass="RowStyle1" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [DocumentTemplate] WHERE [TemplateID] = @TemplateID"
                        InsertCommand="INSERT INTO [DocumentTemplate] ([TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID]) VALUES (@TemplateTitle, @TemplateBody, @TemplateHeader, @TemplateFooter, @TemplateTypeID)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TemplateID], [TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID] FROM [DocumentTemplate] where TemplateTypeID='5'"
                        UpdateCommand="UPDATE [DocumentTemplate] SET [TemplateTitle] = @TemplateTitle, [TemplateBody] = @TemplateBody, [TemplateHeader] = @TemplateHeader, [TemplateFooter] = @TemplateFooter, [TemplateTypeID] = @TemplateTypeID WHERE [TemplateID] = @TemplateID">
                        <DeleteParameters>
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateBody" Type="String" />
                            <asp:Parameter Name="TemplateHeader" Type="String" />
                            <asp:Parameter Name="TemplateFooter" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </div>
    </div>
</asp:Content>
