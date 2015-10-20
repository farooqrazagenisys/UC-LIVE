<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewDocuments.ascx.cs"
    Inherits="UC_LIVE.Controls.ViewDocuments" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div style="margin-left: 700px;">
    <asp:ImageButton ID="AddDocument1" runat="server" OnClick="AddDocument_Click1" Text="Add New Document"
        ImageUrl="~/Images/Icons/NewDocument.gif" />
</div>
<div style="width: 850px;">
    <cc1:TabContainer ID="DocumentsTab" runat="server" ActiveTabIndex="0" Width="920"
        CssClass="ajax__tab_lightblue-theme">
        <cc1:TabPanel runat="server" HeaderText="ClientDocs" ID="TabPanel1">
            <HeaderTemplate>
                Client Docs
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="ClientDocuments" CssClass="GridView1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="DocID"
                    DataSourceID="ClientsDataSource" EmptyDataText="There are no data records to display."
                    ForeColor="#333333" GridLines="None" PageSize="5" Height="300px">
                    <RowStyle BackColor="#EFF3FB" CssClass="RowStyle1" />
                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image"
                            EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                            ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                            CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                            <EditItemTemplate>
                                <asp:TextBox ID="DocTitleTextBox3" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocID", "~/ViewDocument.aspx?DocID={0}") %>'
                                    Text='<%# Eval("DocTitle") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkViewDetails2" runat="server" NavigateUrl='<%# Eval("DocID", "~/UpdateDocument22.aspx?DocID={0}") %>'
                                    Text='View Details' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkSendEmail2" runat="server" NavigateUrl='<%# Eval("DocID", "~/SendEmail1.aspx?DocID={0}") %>'
                                    Text='Send Email' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#FDFDFD" />
                    <FooterStyle CssClass="FooterStyle1" />
                    <HeaderStyle CssClass="HeaderStyle1" />
                    <PagerStyle CssClass="PagesStyle1" />
                </asp:GridView>
                <asp:SqlDataSource ID="ClientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [Documents] , [ClaimDoc] where ClaimDoc.ContactTypeID=7 and ClaimID=@ClaimID and Documents.DocID = ClaimDoc.DocID order by Documents.DocID desc"
                    UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                    <DeleteParameters>
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="InsuranceDocs" ID="TabPanel2">
            <HeaderTemplate>
                Insurance Docs
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="InsuranceDocs" CssClass="GridView1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="DocID"
                    DataSourceID="InsuranceDataSource" EmptyDataText="There are no data records to display."
                    ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="InsuranceDocs_SelectedIndexChanged" PageSize="6">
                    <RowStyle BackColor="White" CssClass="RowStyle1" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image"
                            EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                            ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                            CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                            <EditItemTemplate>
                                <asp:TextBox ID="DocTitleTextBox1" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox></EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocID", "~/ViewDocument.aspx?DocID={0}") %>'
                                    Text='<%# Eval("DocTitle") %>'></asp:HyperLink></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                        <asp:TemplateField HeaderText="Document Status" SortExpression="DocStatus">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceStatus"
                                    DataTextField="DocumentStatusTitle" DataValueField="DocumentStatusID" SelectedValue='<%# Bind("DocumentStatusID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT [DocumentStatusID], [DocumentStatusTitle] FROM [DocumentStatus]">
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("DocumentStatusTitle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkViewDetails" runat="server" NavigateUrl='<%# Eval("DocID", "~/UpdateDocument22.aspx?DocumentID={0}") %>'
                                    Text='View Details' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkSendEmail" runat="server" NavigateUrl='<%# "~/SendEmail1.aspx?DocID=" + Eval("DocID", "{0}") + "&ClaimID=" + Eval("ClaimID", "{0}") %>'
                                    Text='Send Email' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    <EditRowStyle BackColor="#FDFDFD" />
                    <FooterStyle CssClass="FooterStyle1" />
                    <HeaderStyle CssClass="HeaderStyle1" />
                    <PagerStyle CssClass="PagesStyle1" />
                </asp:GridView>
                <asp:SqlDataSource ID="InsuranceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [Documents] , [DocumentStatus],  [ClaimDoc] where ClaimDoc.ContactTypeID=1 and ClaimID=@ClaimID
and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'HTML' and Documents.DocStatus=DocumentStatus.DocumentStatusID  order by Documents.DocID desc"
                    UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </cc1:TabPanel>
        </ContentTemplate></cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="EngineerDocs" ID="TabPanel3">
            <HeaderTemplate>
                Engineers Docs
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="EngineerDocs" CssClass="GridView1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="DocID"
                    DataSourceID="EngineerDataSource" EmptyDataText="There are no data records to display."
                    ForeColor="#333333" GridLines="None" PageSize="6">
                    <RowStyle BackColor="#EFF3FB" CssClass="RowStyle1" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image"
                            EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                            ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                            CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                            <EditItemTemplate>
                                <asp:TextBox ID="DocTitleTextBox2" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox></EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocID", "~/ViewDocument.aspx?DocID={0}") %>'
                                    Text='<%# Eval("DocTitle") %>'></asp:HyperLink></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DocStatus" HeaderText="Status" SortExpression="DocStatus" />
                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkViewDetails3" runat="server" NavigateUrl='<%# Eval("DocID", "~/UpdateDocument22.aspx?DocumentID={0}") %>'
                                    Text='View Details' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkSendEmail3" runat="server" NavigateUrl='<%# "~/SendEmail1.aspx?DocID=" + Eval("DocID", "{0}") + "&ClaimID=" + Eval("ClaimID", "{0}") %>'
                                    Text='Send Email' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#FDFDFD" />
                    <FooterStyle CssClass="FooterStyle1" />
                    <HeaderStyle CssClass="HeaderStyle1" />
                    <PagerStyle CssClass="PagesStyle1" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="EngineerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [Documents] , [ClaimDoc] where ClaimDoc.ContactTypeID=3 and ClaimID=@ClaimID
and Documents.DocID = ClaimDoc.DocID  and Documents.DocType = 'HTML' order by Documents.DocID desc">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="SolicitorDocs" ID="TabPanel4">
            <HeaderTemplate>
                Solicitor Docs
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="SolicitorDocs" CssClass="GridView1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="DocID"
                    DataSourceID="SolicitorDataSource" EmptyDataText="There are no data records to display."
                    ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#EFF3FB" CssClass="RowStyle1" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image"
                            EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                            ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                            CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                            <EditItemTemplate>
                                <asp:TextBox ID="ViewDetailsTextBox3" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox></EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocID", "~/ViewDocument.aspx?DocID={0}") %>'
                                    Text='<%# Eval("DocTitle") %>'></asp:HyperLink></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DocStatus" HeaderText="Status" SortExpression="DocStatus" />
                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkViewDetials4" runat="server" NavigateUrl='<%# Eval("DocID", "~/UpdateDocument22.aspx?DocID={0}") %>'
                                    Text='View Details' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkSendEmail4" runat="server" NavigateUrl='<%# "~/SendEmail1.aspx?DocID=" + Eval("DocID", "{0}") + "&ClaimID=" + Eval("ClaimID", "{0}") %>'
                                    Text='Send Email' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    <EditRowStyle BackColor="#FDFDFD" />
                    <FooterStyle CssClass="FooterStyle1" />
                    <HeaderStyle CssClass="HeaderStyle1" />
                    <PagerStyle CssClass="PagesStyle1" />
                </asp:GridView>
                <asp:SqlDataSource ID="SolicitorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [Documents] , [ClaimDoc] where ClaimDoc.ContactTypeID=2 and ClaimID=@ClaimID
and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'HTML' order by Documents.DocID desc"
                    UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="CarhireDocs" ID="TabPanel5">
            <HeaderTemplate>
                Carhire Docs
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="CarhireDocs" CssClass="GridView1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="DocID"
                    DataSourceID="CarhireDatasource" EmptyDataText="There are no data records to display."
                    ForeColor="#333333" GridLines="None" PageSize="6">
                    <RowStyle BackColor="#EFF3FB" CssClass="RowStyle1" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image"
                            EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                            ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                            CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                            <EditItemTemplate>
                                <asp:TextBox ID="DocTitleTextBox3" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox></EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocID", "~/ViewDocument.aspx?DocID={0}") %>'
                                    Text='<%# Eval("DocTitle") %>'></asp:HyperLink></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DocStatus" HeaderText="Status" SortExpression="DocStatus" />
                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                        <asp:TemplateField HeaderText=" ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxViewDetailsTextBox4" runat="server" Text='View Details'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkViewDetails5" runat="server" NavigateUrl='<%# Eval("DocumentID", "~/UpdateDocument22.aspx?DocumentID={0}") %>'
                                    Text='View Details' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkSendEmail5" runat="server" NavigateUrl='<%# Eval("DocID", "~/SendEmail1.aspx?DocID={0}") %>'
                                    Text='Send Email' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#FDFDFD" />
                    <FooterStyle CssClass="FooterStyle1" />
                    <HeaderStyle CssClass="HeaderStyle1" />
                    <PagerStyle CssClass="PagesStyle1" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="CarhireDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [Documents] , [ClaimDoc] where ClaimDoc.ContactTypeID=4 and ClaimID=@ClaimID
and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'HTML' order by Documents.DocID desc"
                    UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="Storage" ID="TabPanel6">
            <HeaderTemplate>
                Storage
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="StorageGridView" CssClass="GridView1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="DocID"
                    DataSourceID="StorageDatasource" EmptyDataText="There are no data records to display."
                    ForeColor="#333333" GridLines="None" PageSize="6">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image"
                            EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                            ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                            CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        <asp:BoundField DataField="DocID" HeaderText="ID" ReadOnly="True" SortExpression="DocID" />
                        <asp:TemplateField HeaderText="Title" SortExpression="DocTitle">
                            <EditItemTemplate>
                                <asp:TextBox ID="ViewDetailsTextBox5" runat="server" Text='<%# Bind("DocTitle") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="ViewDocument" runat="server" NavigateUrl='<%# Eval("DocID", "~/ViewDocument.aspx?DocID={0}") %>'
                                    Text='<%# Eval("DocTitle") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DocStatus" HeaderText="Status" SortExpression="DocStatus" />
                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                        <asp:BoundField DataField="DateUpdated" HeaderText="Date Updated" SortExpression="DateUpdated" />
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkViewDetials6" runat="server" NavigateUrl='<%# Eval("DocID", "~/UpdateDocument22.aspx?DocID={0}") %>'
                                    Text='View Details' ForeColor="GrayText"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkSendEmail6" runat="server" NavigateUrl='<%# Eval("DocID", "~/SendEmail1.aspx?DocID={0}") %>'
                                    Text='Send Email' ForeColor="GrayText"></asp:HyperLink>
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
                <asp:SqlDataSource ID="StorageDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Documents] ([DocTitle], [DocBody], [DocLink], [DocStatus], [DateCreated], [DateUpdated]) VALUES (@DocTitle, @DocBody, @DocLink, @DocStatus, @DateCreated, @DateUpdated)"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [Documents] , [ClaimDoc] where ClaimDoc.ContactTypeID=5 and ClaimID=@ClaimID
and Documents.DocID = ClaimDoc.DocID and Documents.DocType = 'HTML' order by Documents.DocID desc"
                    UpdateCommand="UPDATE [Documents] SET [DocTitle] = @DocTitle, [DocBody] = @DocBody, [DocLink] = @DocLink, [DocStatus] = @DocStatus, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated WHERE [DocID] = @DocID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DocTitle" Type="String" />
                        <asp:Parameter Name="DocBody" Type="String" />
                        <asp:Parameter Name="DocLink" Type="String" />
                        <asp:Parameter Name="DocStatus" Type="Int32" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="DateUpdated" Type="DateTime" />
                        <asp:Parameter Name="DocID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>
    <br />
</div>
