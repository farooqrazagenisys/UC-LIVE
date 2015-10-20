<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="contactlist.aspx.cs" Inherits="UC_LIVE.contactlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/grid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="float:left; width:950px;  background-color:White;"  >
	<div class="MainHeading" runat=server id="MainHeading" style="padding-left:40px;">    </div>
	 
<%--<div style="font-size:12px; padding-left:40px;padding-bottom:15px;">Search Contacts by typing company name, client name </div>
<div style="float:left; width:150px;margin-left:40px; "><asp:TextBox ID="SearchRecords" runat="server"></asp:TextBox></div>
    <div style="float:left; height:20px;margin-left:40px;  margin-bottom:30px;"><asp:Button ID="SearchContacts1" runat="server" Text="Search" onclick="SearchContacts1_Click" />
     
        </div>--%>
        

        
	<div style="padding-left:20px; margin-top:10px; margin-left:10px;">
       
      
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="ContactId" DataSourceID="SqlDataSource1" PageSize="40"
            EmptyDataText="" ForeColor="#333333" GridLines="None"
            CssClass="GridView1" Width="900">
            <RowStyle CssClass="RowStyle1" />
         <Columns>
          
                <asp:ButtonField HeaderText=" " ItemStyle-Width="10"/>
                <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="  Company" ItemStyle-Width="180" ItemStyle-CssClass="ItemStyleCSS" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" ItemStyle-Width="120"/>
                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" ItemStyle-Width="120"/>
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ItemStyle-Width="120"/>
                  <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" ItemStyle-Width="120"/>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ItemStyle-Width="260"/>
                  <asp:TemplateField HeaderText="Edit" ItemStyle-Width="40">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLinkEditDetails" runat="server" NavigateUrl='<%# Eval("ContactID", "~/NewRecord.aspx?ContactID={0}") %>'
                            ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                	
					  
                     
                                      <asp:TemplateField HeaderText="SMS" ItemStyle-Width="40">
				
												
												  <ItemTemplate>
                                 <a href="SendSMS.aspx?ID=<%# Eval("Mobile")%>">
                                                  <img alt="SMS" src="Images/TextIcon.png" title="Click here to add action response." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                               
              </asp:TemplateField>
              
              
                                      <asp:TemplateField HeaderText="Email"  ItemStyle-Width="40">
				
												
												  <ItemTemplate>
                                 <a href="SendEmail1.aspx?ID=<%# Eval("Email")%>">
                                                  <img alt="Add Response" src="Images/EmailIcon.png" title="Click here to add action response." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                
              </asp:TemplateField>
                
                
          <%--      <asp:TemplateField HeaderText="View" ItemStyle-Width="40">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLinkViewDetails" runat="server" NavigateUrl='<%# Eval("ContactID", "~/ViewContact.aspx?ContactID={0}") %>'
                            ImageUrl="~/Images/info.png" ForeColor="GrayText"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>--%>
               
                 <asp:CommandField  ShowEditButton="True" ButtonType="Image"
                    EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                     ShowCancelButton="true" 
                    UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
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
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [Contact] WHERE [ContactId] = @ContactId" InsertCommand="INSERT INTO [Contact] ([FirstName], [Surname], [Company], [Address1], [Address2], [City], [PostCode], [Country], [Phone], [Phone2], [Mobile], [Fax], [Email], [Email2], [Comments], [ContactTypeID], [DOB], [NINo]) VALUES (@FirstName, @Surname, @Company, @Address1, @Address2, @City, @PostCode, @Country, @Phone, @Phone2, @Mobile, @Fax, @Email, @Email2, @Comments, @ContactTypeID, @DOB, @NINo)"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT  Contact.Email, ContactType.ContactTypeTitle, Contact.ContactTypeID, Contact.ContactID,Contact.Company, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Mobile from
Contact, ContactType where Contact.ContactTypeID = ContactType.ContactTypeID and ContactType.ContactTypeTitle=@ContactType order by ContactID Desc"
 UpdateCommand="UPDATE [Contact] SET [FirstName] = @FirstName, [Surname] = @Surname, [Company] = @Company, [Phone] = @Phone, [Mobile] = @Mobile, [Email] = @Email WHERE [ContactId] = @ContactId">
       
       
     <%--  
       SELECT  Contact.Email, ContactType.ContactTypeTitle, Contact.ContactTypeID, Contact.ContactID,Contact.Company, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Mobile from
Contact, ContactType where Contact.ContactTypeID = ContactType.ContactTypeID and ContactType.ContactTypeTitle=@ContactType and (Contact.FirstName Like '%' + @SearchRecords + '%' or Contact.Surname Like '%' + @SearchRecords  + '%' or  Contact.Address1 Like '%' + @SearchRecords + '%' or Contact.Address2 Like '%' + @SearchRecords + '%' or 
Contact.City Like '%' + @SearchRecords + '%'  or Contact.Company Like '%' + @SearchRecords  + '%' or Contact.PostCode Like '%' + @SearchRecords + '%')  order by ContactID Desc
       --%>
        <DeleteParameters>
            <asp:Parameter Name="ContactId" Type="Int64" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="All" Name="ContactType" QueryStringField="ContactType"
                Type="String" />
                <%-- <asp:ControlParameter ControlID="SearchRecords" Name="SearchRecords" PropertyName="Text" />--%>
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
    
              </div>
</asp:Content>
