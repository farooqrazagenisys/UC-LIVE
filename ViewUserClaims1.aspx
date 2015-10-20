<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewUserClaims1.aspx.cs" Inherits="UC_LIVE.ViewUserClaims1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  style="width:950px; background-color:white;">


<div style="margin-left:18px; font-family:Microsoft Sans Serif;">

  <div class="MainHeading"> Find User Claims</div>
<div style="font-size:12px; padding-left:18px; padding-bottom:15px;">Type Username 
    e.g. Agent&nbsp; / Branch / Staff &#39;s username</div>
<div style="float:left; width:150px;"><asp:TextBox ID="SearchRecords" runat="server"></asp:TextBox></div>
    <div style="float:left; height:20px; margin-left:2px;"><asp:Button ID="SearchContacts12" runat="server" Text="Search" onclick="SearchContacts1_Click1" /></div>
    <div style="margin-left:10px;">
  
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
        DataKeyNames="ClaimId" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" CssClass="GridView1" Width="890px" PageSize="40" >
      <RowStyle CssClass="RowStyle1" />
        <Columns>
          <asp:ButtonField HeaderText=" " ItemStyle-Width="10"/>
       <asp:TemplateField HeaderText="Claim Ref" >
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("ClaimId", "AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" Text='<%# Bind("ClaimId") %>'></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
             <asp:BoundField DataField="ClaimTitle" HeaderText="ClaimTitle" 
                SortExpression="ClaimTitle"/>
                 <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                SortExpression="FirstName" />
      
				 <asp:BoundField DataField="Surname" HeaderText="Surname" 
                SortExpression="Surname" />		

                <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                SortExpression="Mobile" />
                <asp:BoundField DataField="Email" HeaderText="Email" 
                SortExpression="Email" />
            <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date"   DataFormatString="{0:dd-MMM-yyyy}"
                SortExpression="AccidentDate" />
            <asp:BoundField DataField="ClaimType" HeaderText="Claim Type" 
                SortExpression="ClaimType" />
          <%--  <asp:BoundField DataField="ClaimStatusTitle" HeaderText="Claim Status" 
                SortExpression="ClaimStatusTitle" />--%>
           
						  <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink></ItemTemplate>
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
        
        
        
        SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.AccidentDate, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Mobile, Contact.Email FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (Claim.ClaimUserValue Like '%' +@SearchRecords + '%') AND (Contact.ContactTypeID = '7') ORDER BY Claim.ClaimId DESC"

        
            
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
