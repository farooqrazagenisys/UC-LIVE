<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddInvoice.aspx.cs" Inherits="UC_LIVE.AddInvoice" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.style7
		{
			width: 741px;
		}
	    .style9
        {
            font-size: 12px;
            font-family: Microsoft Sans Serif;
            color: #666666;
            width: 360px;
            height: 55px;
        }
        .style10
        {
            font-size: 12px;
            font-family: Microsoft Sans Serif;
            color: #666666;
            height: 54px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-color:White; ">	
<table><tr>		
			<td class="style7" style="padding-left:10px;padding-top:10px;">
				<asp:Panel ID="PanelInvoiceDetials" runat="server" Visible="false" 
                    Width="922px">
                        <table style="margin-left:600px; margin-top:0px; width:200px; height:35px; float:right;"><tr><td>
              <div style="float:left"><asp:Button ID="BackButton" runat="server" Text="<<Back" OnClick="BackButton_Click"  /></div>          
                          
                               <div style="float:left"><asp:Button ID="UpdateInvoice" runat="server" Text="Create Invoice" OnClick="UpdateInvoice_Click" /></div>
						
	</td></tr></table>
 <asp:HiddenField ID="InvoiceIDUpdate" runat="server" />
 <table style="margin-left:5px; margin-top:10px; width:127px; height:35px; float:left;"><tr><td>
 
	<asp:Button ID="AddNewItem" runat="server" Text="Add Referral Details" OnClick="AddNewItem_Click" />
	</td></tr></table>
                    <table>
						<tr>
							<td>
								<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="InvoiceDetailID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" CssClass="GridView1" Width="905px">
									<Columns>
										<asp:ButtonField ItemStyle-Width="10" />
										<%--<asp:BoundField DataField="InvoiceDetailID" HeaderText="Item No" ReadOnly="True" SortExpression="InvoiceDetailID" />--%>
										<asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" ItemStyle-Width="550" ControlStyle-Width="450"/>						
										
										<asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" ItemStyle-Width="50" ControlStyle-Width="30"  DataFormatString="{0:C}" />
								
								<asp:CommandField ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
									</Columns>
									<EditRowStyle CssClass="EditRowSytle" />
									<AlternatingRowStyle CssClass="AlternatingRowStyle" />
									<FooterStyle CssClass="FooterStyle1" />
									<HeaderStyle CssClass="HeaderStyle1" />
									<PagerStyle CssClass="PagesStyle1" />
									<RowStyle CssClass="RowStyle1" />
									<SelectedRowStyle CssClass="SelectedRowStyle" />
								</asp:GridView>
								<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [InvoiceDetails] WHERE [InvoiceDetailID] = @InvoiceDetailID" InsertCommand="INSERT INTO [InvoiceDetails] ([Details], [NoOfDays], [Rate], [Amount]) VALUES (@Details, @NoOfDays, @Rate, @Amount)" ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>" SelectCommand="SELECT [InvoiceDetailID], [Details], [NoOfDays], [Rate], [Amount] FROM [InvoiceDetails] where InvoiceID= @InvoiceID order by InvoiceDetailID desc" UpdateCommand="UPDATE [InvoiceDetails] SET [Details] = @Details, [NoOfDays] = @NoOfDays, [Rate] = @Rate, [Amount] = @Amount WHERE [InvoiceDetailID] = @InvoiceDetailID">
									<DeleteParameters>
										<asp:Parameter Name="InvoiceDetailID" Type="Int32" />
									</DeleteParameters>
									<InsertParameters>
										<asp:Parameter Name="Details" Type="String" />
										<asp:Parameter Name="NoOfDays" Type="String" />
										<asp:Parameter Name="Rate" Type="Int32" />
										<asp:Parameter Name="Amount" Type="Double" />
									</InsertParameters>
									<UpdateParameters>
										<asp:Parameter Name="Details" Type="String" />
										<asp:Parameter Name="NoOfDays" Type="String" />
										<asp:Parameter Name="Rate" Type="Int32" />
										<asp:Parameter Name="Amount" Type="Double" />
										<asp:Parameter Name="InvoiceDetailID" Type="Int32" />
									</UpdateParameters>
									<SelectParameters>
										<asp:QueryStringParameter Type="String" Name="InvoiceID" QueryStringField="InvoiceID" />
									</SelectParameters>
								</asp:SqlDataSource>
								
						
						
							</td>
						</tr>
					</table>
				
					
					
				</asp:Panel>
			</td>
		</tr>
	</table>

	<asp:Panel runat="server" ID="ShowInvoiceDetails" Visible="false">
		<div class="MainHeading" style="float:left">
					           Referral Invoice Details 
					       
	</div> <div style="float:right; margin-right:13px; margin-top:10px;">
				<asp:Button ID="CancelButton2" runat="server" Text="Cancel Invoice" 
            onclick="CancelButton_Click2"/>
	
	
	<asp:Button ID="AddDocument" runat="server" Text="Next >>" OnClick="AddInvoiceClick" ValidationGroup="InvoiceValidation" /></div>
	<table style="width:905px; margin-right:20px; background-color:#eee; margin-left:20px;">

	
				<div id="Msg" runat="server">
				</div>
			
			<tr>	
		<td class="style10" style="padding-left:20px; padding-top:10px;">
		
		Invoice Title<br />
				<asp:TextBox ID="InvoiceTitleTextBox" runat="server" Width="200"></asp:TextBox>
				<asp:RequiredFieldValidator 
                                ID="ClaimTitle1" runat="server" ControlToValidate="InvoiceTitleTextBox" 
                                Display="Dynamic"  
                                ValidationGroup="InvoiceValidation">* </asp:RequiredFieldValidator>
		           <%-- <asp:DropDownList ID="DropdownContact" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSourceContacts" DataTextField="FirstName" 
                    DataValueField="ContactID" 
                    onselectedindexchanged="DropdownContact_SelectedIndexChanged" 
                ondatabound="DropdownContact_DataBound" >

     
            </asp:DropDownList>
			    <asp:SqlDataSource ID="SqlDataSourceContacts" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                
                 SelectCommand="SELECT [Contact].[ContactID], [FirstName], [Surname], [Company] FROM [Contact], [ClaimContact] WHERE ([ClaimContact].[ContactTypeID] = @ContactTypeID and [Contact].[ContactID]=[ClaimContact].[ContactID] and [ClaimContact].[ClaimID]=@ClaimID)" 
                onselected="SqlDataSourceContacts_Selected">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropdownContactType" Name="ContactTypeID" 
                            PropertyName="SelectedValue"/>
                        <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimID" />
                    </SelectParameters>
                </asp:SqlDataSource>--%>
		
			</td>
	
		<td class="style10" style="padding-left:20px; padding-top:10px;">
				Invoice Date<br />
				<asp:TextBox ID="InvoiceDate" runat="server" ></asp:TextBox>
				  <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator2" runat="server" ControlToValidate="InvoiceDate" 
                                    Display="Dynamic"  ValidationGroup="InvoiceValidation"
                                    Text="*" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" 
                                 />
                                 		<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="InvoiceDate" 
                                Display="Dynamic"  
                                ValidationGroup="InvoiceValidation">* </asp:RequiredFieldValidator>
				       <div style="float: left;">
                                    <cc1:CalendarExtender ID="InvoiceDate_calender" runat="server" Enabled="True"
                                        Format="dd/MM/yyyy" TargetControlID="InvoiceDate">
                                    </cc1:CalendarExtender>
                                </div>
				
			</td>
		</tr><tr>
			<td class="style9" style="padding-left:20px;">
				Contact Details<asp:TextBox ID="ContactDetails" runat="server"  TextMode="MultiLine" 
                    Width="350px" Height="60px"></asp:TextBox>
                    	<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="ContactDetails" 
                                Display="Dynamic"  
                                ValidationGroup="InvoiceValidation">* </asp:RequiredFieldValidator>
                    
                    
                <br />
                Invoice Header Information<asp:TextBox ID="TextBoxInvoiceHeader" runat="server" Height="60px" 
                    TextMode="MultiLine" Width="350px"></asp:TextBox>
                                        	<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxInvoiceHeader" 
                                Display="Dynamic"  
                                ValidationGroup="InvoiceValidation">* </asp:RequiredFieldValidator>
                    
                <br />
                Invoice Footer Information<br />
                <asp:TextBox ID="TextBoxInvoiceFooter" runat="server" Height="60px" 
                    TextMode="MultiLine" Width="350px"></asp:TextBox>
                    </td>
                    
						<td class="style9" style="padding-left:20px;">
                            <asp:Image ID="CompanyLogo" runat="server" Width="70px" Height="55px" />
                            <br />
				            Invoice Logo (Note: New logo will replace admin logo)<br />
                            <br />
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <br />
                            <br />
                            Company Address<asp:TextBox ID="CompanyAddress" runat="server" TextMode="MultiLine" 
                        Width="350px" Height="60px"></asp:TextBox>
                        
                                                     	<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator4" runat="server" ControlToValidate="CompanyAddress" 
                                Display="Dynamic"  
                                ValidationGroup="InvoiceValidation">* </asp:RequiredFieldValidator>
                        
			                <br />
                            Bank Details / Additoinal Instructions<asp:TextBox ID="AdditoinalInstrucitonTextBox" 
                                runat="server" Height="60px" TextMode="MultiLine" Width="350px"></asp:TextBox>
			                <br />
			                
			</td>
		
	
		</tr>	
	
		<tr>
					<td style="float:left; margin-left:20px; padding-bottom:10px; padding-top:10px; padding-left:20px;">
				
			</td>
			
			</tr></table>	
			</asp:Panel>
			
    <asp:HiddenField ID="ClaimIDHiddenField" runat="server" />
	</div>
	

	
</asp:Content>
