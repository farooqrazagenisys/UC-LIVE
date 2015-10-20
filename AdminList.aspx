<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="AdminList.aspx.cs" Inherits="UC_LIVE.AdminList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div style="margin-left:20px; width:550px; margin-top:30px;> <div style="width:850px; height:35px; font-weight:bold; margin-left:5px;"><br />  <% Response.Write(Request.QueryString["ContactType"]); %> 
     
            Admin Companies <a href="AllocateAdmin.aspx">New</a><br /> </div>
<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
        DataKeyNames="ContactId" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" CssClass="GridView1">
      <RowStyle CssClass="RowStyle1" />
        <Columns>
<asp:CommandField ShowDeleteButton="True" ButtonType="Image"  DeleteImageUrl="~/Images/Grid/IconDelete.png" />
             <asp:BoundField DataField="Company" HeaderText="Company" 
                SortExpression="Company"/>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="Surname" HeaderText="Surname" 
                SortExpression="Surname" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
              <asp:TemplateField HeaderText=" ">
					
							<ItemTemplate>
								<asp:HyperLink ID="HyperLinkEditDetails" runat="server" NavigateUrl='<%# Eval("ContactID", "~/EditAdminCompany.aspx?ContactID={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateField>
            
            <asp:TemplateField HeaderText=" ">
							
							<ItemTemplate>
								<asp:HyperLink ID="HyperLinkViewDetails" runat="server" NavigateUrl='<%# Eval("ContactID", "~/ViewContact.aspx?ContactID={0}") %>' ImageUrl="~/Images/info.png" ForeColor="GrayText"></asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateField>
						
						
						
												
						
           
        </Columns>
             <FooterStyle CssClass="FooterStyle1"/>
                <PagerStyle CssClass="PagesStyle1" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle CssClass="HeaderStyle1" />               
                <EditRowStyle BackColor="#FDFDFD" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    </asp:GridView>
    
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Contact] WHERE [ContactId] = @ContactId" 
        InsertCommand="INSERT INTO [Contact] ([FirstName], [Surname], [Company], [Address1], [Address2], [City], [PostCode], [Country], [Phone], [Phone2], [Mobile], [Fax], [Email], [Email2], [Comments], [ContactTypeID], [DOB], [NINo]) VALUES (@FirstName, @Surname, @Company, @Address1, @Address2, @City, @PostCode, @Country, @Phone, @Phone2, @Mobile, @Fax, @Email, @Email2, @Comments, @ContactTypeID, @DOB, @NINo)" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        
        
        
        SelectCommand="SELECT Contact.ContactID,Contact.Company, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email from
Contact where Contact.ContactTypeID = 12"

        UpdateCommand="UPDATE [Contact] SET [FirstName] = @FirstName, [Surname] = @Surname, [Company] = @Company, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [PostCode] = @PostCode, [Country] = @Country, [Phone] = @Phone, [Phone2] = @Phone2, [Mobile] = @Mobile, [Fax] = @Fax, [Email] = @Email, [Email2] = @Email2, [Comments] = @Comments, [ContactTypeID] = @ContactTypeID, [DOB] = @DOB, [NINo] = @NINo WHERE [ContactId] = @ContactId">
        <DeleteParameters>
            <asp:Parameter Name="ContactId" Type="Int64" />
        </DeleteParameters>
         <SelectParameters>
			<asp:QueryStringParameter DefaultValue="All" Name="ContactType" QueryStringField="ContactType" Type="String" />
		</SelectParameters>
       
        <InsertParameters>
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="Surname" Type="String" />
        <asp:Parameter Name="Company" Type="String" />
        <asp:Parameter Name="Address1" Type="String" />
        <asp:Parameter Name="Address2" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="PostCode" Type="String" />
        <asp:Parameter Name="Country" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
        <asp:Parameter Name="Phone2" Type="String" />
        <asp:Parameter Name="Mobile" Type="String" />
        <asp:Parameter Name="Fax" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Email2" Type="String" />
        <asp:Parameter Name="Comments" Type="String" />
        <asp:Parameter Name="ContactTypeID" Type="Int32" />
        <asp:Parameter Name="DOB" Type="DateTime" />
        <asp:Parameter Name="NINo" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Surname" Type="String" />
            <asp:Parameter Name="Company" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Phone2" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="ContactTypeID" Type="Int32" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="NINo" Type="String" />
            <asp:Parameter Name="ContactId" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
