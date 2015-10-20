<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SolicitorClaims.aspx.cs" Inherits="UC_LIVE.SolicitorClaims" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 
 
 
 <div  style="width:950px; background-color:white;">


<div style="margin-left:18px; font-family:Microsoft Sans Serif;">

  <div class="MainHeading"> Solicitor Invoices<br />
    </div>
<div style="font-size:12px; padding-left:18px; padding-bottom:15px;">
    <asp:DropDownList ID="DropdownPayment1" runat="server" AutoPostBack="True">
    <asp:ListItem Text="Not Selected" Selected="True"></asp:ListItem>
    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
        <asp:ListItem Text="Paid" Value="Paid"></asp:ListItem>
            <asp:ListItem Text="Partially Paid" Value="Partially Paid"></asp:ListItem>
    </asp:DropDownList>
    </div>
<div style="float:left; width:449px; margin-left:20px; height: 87px;" 
        class="bodytext">

<br /> Type Solicitor Name / Company <br /> <br />
 <div style="float:left">
    <asp:TextBox ID="SearchRecords" 
        runat="server" Width="133px"></asp:TextBox> </div>
         <div style="float:left">
<asp:Button ID="SearchContacts12" runat="server" Text="Search" 
            onclick="SearchContacts1_Click1" style="height: 26px" /> <br /></div>
      
        </div>
    <div style="margin-left:10px;">
  
    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" CssClass="GridView1" Width="890px" PageSize="35" 
         >
      <RowStyle CssClass="RowStyle1" />
        <Columns>
        <asp:TemplateField HeaderText="Claim Ref">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("ClaimId", "AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" Text='<%# Bind("ClaimId") %>'></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
				 <asp:BoundField DataField="AccidentDate" HeaderText="AccidentDate" 
                SortExpression="AccidentDate" DataFormatString="{0:dd/M/yyy hh:mm}" />		
     <asp:TemplateField HeaderText="Invoice No">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl='<%# Eval("InvoiceId", "ViewReferralInvoice.aspx?InvoiceId={0}") + Eval("ClaimId", "&ClaimId={0}") %>' Text='<%# Bind("InvoiceId") %>'></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
            <asp:BoundField DataField="AmountDue" HeaderText="AmountDue" 
                SortExpression="AmountDue" DataFormatString="{0:C}" />
            <asp:BoundField DataField="AmountPaid" HeaderText="AmountPaid" 
                SortExpression="AmountPaid" />
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
        SelectCommand="SELECT Claim.ClaimId, Invoice.ContactAddress, Claim.AccidentDate, Invoice.InvoiceID, Invoice.AmountDue, Invoice.AmountPaid FROM Invoice INNER JOIN Claim ON Invoice.ClaimID = Claim.ClaimId INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID INNER JOIN Contact ON ClaimContact.ContactID = Contact.ContactID WHERE Claim.ClaimId=Invoice.ClaimId and (Invoice.InvoiceType = 'Invoice') AND (Contact.ContactTypeID = '2') AND (Invoice.InvoiceStatus = @DropdownPayment) AND (Invoice.ContactAddress LIKE '%' + @SearchRecords1 + '%')"
        UpdateCommand="UPDATE [Contact] SET [FirstName] = @FirstName, [Surname] = @Surname, [Company] = @Company, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [PostCode] = @PostCode, [Country] = @Country, [Phone] = @Phone, [Phone2] = @Phone2, [Mobile] = @Mobile, [Fax] = @Fax, [Email] = @Email, [Email2] = @Email2, [Comments] = @Comments, [ContactTypeID] = @ContactTypeID, [DOB] = @DOB, [NINo] = @NINo WHERE [ContactId] = @ContactId">
       
        <SelectParameters>
        
            <asp:ControlParameter ControlID="DropdownPayment1" Name="DropdownPayment" 
                PropertyName="SelectedValue" />
                
                    <asp:ControlParameter ControlID="SearchRecords" Name="SearchRecords1" 
          /> 
                
        </SelectParameters>
       
       <DeleteParameters>
            <asp:Parameter Name="ContactId" Type="Int64" />
        </DeleteParameters>
       
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
