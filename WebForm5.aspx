<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="UC_LIVE.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="Countries" DataTextField="Country" DataValueField="Country">
    </asp:DropDownList>
    <asp:SqlDataSource ID="Countries" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT DISTINCT [Country] FROM [Contact]" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
        DataKeyNames="ContactId" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None">
      <RowStyle CssClass="RowStyle1" />
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:TemplateField HeaderText="ContactID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ContactId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("ContactId", "WEbForms6.aspx?ContactId={0}") %>' 
                        Text='<%# Eval("ContactId") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
                
            <asp:BoundField DataField="Surname" HeaderText="Surname" 
                SortExpression="Surname"></asp:BoundField>
            <asp:TemplateField HeaderText="Country" SortExpression="Country">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Countries" 
                        DataTextField="Country" DataValueField="Country" 
                        SelectedValue='<%# Bind("Country") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
      
        </Columns>
       <FooterStyle CssClass="FooterStyle1"/>
        <PagerStyle CssClass="PagesStyle1" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Contact] WHERE [ContactId] = @ContactId" 
        InsertCommand="INSERT INTO [Contact] ([ContactId], [FirstName], [Surname], [Country]) VALUES (@ContactId, @FirstName, @Surname, @Country)" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT [ContactId], [FirstName], [Surname], [Country] FROM [Contact] WHERE ([Country] = @Country)" 
        UpdateCommand="UPDATE [Contact] SET [FirstName] = @FirstName, [Surname] = @Surname, [Country] = @Country WHERE [ContactId] = @ContactId">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Country" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ContactId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ContactId" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Surname" Type="String" />
            <asp:Parameter Name="Country" Type="String" />

        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Surname" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="ContactId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
