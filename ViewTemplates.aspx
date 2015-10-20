<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="ViewTemplates.aspx.cs" Inherits="UC_LIVE.ViewTemplates" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 850px; margin-left: 20px; margin-top: 20px;">
        <cc1:TabContainer ID="DocumentsTab" runat="server" ActiveTabIndex="0" Width="920">
            <cc1:TabPanel runat="server" HeaderText="ClientDocs" ID="TabPanel1">
                <HeaderTemplate>
                    Client Docs
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:GridView ID="TemplateList" runat="server" AutoGenerateColumns="False" DataKeyNames="TemplateID"
                        DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
                        AllowPaging="True" AllowSorting="True" CellPadding="1" ForeColor="#333333" GridLines="None">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="TemplateID" HeaderText="TemplateID" ReadOnly="True" SortExpression="TemplateID" />
                            <asp:BoundField DataField="TemplateTitle" HeaderText="TemplateTitle" SortExpression="TemplateTitle" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString %>"
                        DeleteCommand="DELETE FROM [DocumentTemplate] WHERE [TemplateID] = @TemplateID"
                        InsertCommand="INSERT INTO [DocumentTemplate] ([TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID]) VALUES (@TemplateTitle, @TemplateBody, @TemplateHeader, @TemplateFooter, @TemplateTypeID)"
                        ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                        SelectCommand="SELECT [TemplateID], [TemplateTitle], [TemplateBody], [TemplateHeader], [TemplateFooter], [TemplateTypeID] FROM [DocumentTemplate] where TemplateID=6"
                        UpdateCommand="UPDATE [DocumentTemplate] SET [TemplateTitle] = @TemplateTitle, [TemplateBody] = @TemplateBody, [TemplateHeader] = @TemplateHeader, [TemplateFooter] = @TemplateFooter, [TemplateTypeID] = @TemplateTypeID WHERE [TemplateID] = @TemplateID">
                        <DeleteParameters>
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TemplateID" Type="Int32" />
                            <asp:Parameter Name="TemplateTitle" Type="String" />
                            <asp:Parameter Name="TemplateTypeID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </cc1:TabPanel>
        </cc1:TabContainer>
    </div>
</asp:Content>
