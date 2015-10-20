<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchContacts.aspx.cs" Inherits="UC_LIVE.SearchContacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div  style="width:950px; background-color:white;">


<div style="margin-left:18px; font-family:Microsoft Sans Serif;">

  <div class="MainHeading"> Search Contacts</div>
<div style="font-size:12px; padding-left:18px; padding-bottom:15px;">Search Contacts by typing company name, client name </div>
<div style="float:left; width:150px;"><asp:TextBox ID="SearchRecords" runat="server"></asp:TextBox></div>
    <div style="float:left; height:20px; margin-left:2px;"><asp:Button ID="SearchContacts1" runat="server" Text="Search" onclick="SearchContacts1_Click" /></div>
    <div style="margin-left:10px;">
  
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
        DataKeyNames="ContactId" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" CssClass="GridView1" Width="890px" >
      <RowStyle CssClass="RowStyle1" />
        <Columns>
        <asp:ButtonField ItemStyle-Width="10" >
<ItemStyle Width="10px"></ItemStyle>
            </asp:ButtonField>
             <asp:BoundField DataField="ContactID" HeaderText="ContactID" InsertVisible="False" ReadOnly="True" SortExpression="ContactID" />
             <asp:BoundField DataField="Company" HeaderText="Company" 
                SortExpression="Company"/>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="Surname" HeaderText="Surname" 
                SortExpression="Surname" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
      
				 <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Email" />		
					  
                     
                                      <asp:TemplateField HeaderText="Send SMS">
				
												
												  <ItemTemplate>
                                 <a href="SendSMS.aspx?ID=<%# Eval("Mobile")%>">
                                                  <img alt="Send SMS" src="Images/TextIcon.png" title="Click here to add action response." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
              </asp:TemplateField>
              
              
                                      <asp:TemplateField HeaderText="Send Email">
				
												
												  <ItemTemplate>
                                 <a href="SendEmail1.aspx?ID=<%# Eval("Email")%>">
                                                  <img alt="Add Response" src="Images/EmailIcon.png" title="Click here to add action response." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
              </asp:TemplateField>
						
           
        </Columns>
             <FooterStyle CssClass="FooterStyle1"/>
                <PagerStyle CssClass="PagesStyle1" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle CssClass="HeaderStyle1" />               
                <EditRowStyle BackColor="#FDFDFD" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    </asp:GridView>
    
    
    <br />
    <br />

    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Contact] WHERE [ContactId] = @ContactId" 
        InsertCommand="INSERT INTO [Contact] ([FirstName], [Surname], [Company], [Address1], [Address2], [City], [PostCode], [Country], [Phone], [Phone2], [Mobile], [Fax], [Email], [Email2], [Comments], [ContactTypeID], [DOB], [NINo]) VALUES (@FirstName, @Surname, @Company, @Address1, @Address2, @City, @PostCode, @Country, @Phone, @Phone2, @Mobile, @Fax, @Email, @Email2, @Comments, @ContactTypeID, @DOB, @NINo)" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        
        
        
        SelectCommand="SELECT Contact.ContactID,Contact.Company, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Mobile, Contact.Email  from
Contact where Contact.FirstName Like '%' + @SearchRecords + '%' or Contact.Surname Like '%' + @SearchRecords  + '%' or  Contact.Address1 Like '%' + @SearchRecords + '%' or Contact.Address2 Like '%' + @SearchRecords + '%' or 
Contact.City Like '%' + @SearchRecords + '%'  or Contact.Company Like '%' + @SerachRecords  + '%' or Contact.PostCode Like '%' + @SearchRecords + '%'"

        UpdateCommand="UPDATE [Contact] SET [FirstName] = @FirstName, [Surname] = @Surname, [Company] = @Company, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [PostCode] = @PostCode, [Country] = @Country, [Phone] = @Phone, [Phone2] = @Phone2, [Mobile] = @Mobile, [Fax] = @Fax, [Email] = @Email, [Email2] = @Email2, [Comments] = @Comments, [ContactTypeID] = @ContactTypeID, [DOB] = @DOB, [NINo] = @NINo WHERE [ContactId] = @ContactId">
        <DeleteParameters>
            <asp:Parameter Name="ContactId" Type="Int64" />
        </DeleteParameters>
         <SelectParameters>
			 <asp:ControlParameter ControlID="SearchRecords" Name="SearchRecords" PropertyName="Text" />
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
</div>
</div>
</asp:Content>
