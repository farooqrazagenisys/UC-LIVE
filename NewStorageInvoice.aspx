<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewStorageInvoice.aspx.cs" Inherits="UC_LIVE.NewStorageInvoice" %>
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
        .style11
        {
            font-size: 12px;
            font-family: Microsoft Sans Serif;
            color: #666666;
            width: 150px;
            height: 33px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div style="background-color:White; ">	
<table><tr>		
			<td class="style7" style="padding-left:10px;">
		
				<asp:Panel ID="PanelInvoiceDetials" runat="server" Visible="false" 
                    Width="922px">
 <asp:HiddenField ID="InvoiceIDUpdate" runat="server"  />
					<div class="MainHeading" style="float:left;">
					Storage Details
					
					
	<div style="float:right;  margin-top:-30px; margin-right:-5px;" ><asp:Button ID="BackButton" runat="server" Text="<<Back" OnClick="BackButton_Click"  /><asp:Button ID="UpdateInvoice" runat="server" Text="Save Invoice" OnClick="UpdateInvoice_Click" ValidationGroup="SaveInvoice"/>
	</div>
                    <table>
						<tr>
							<td>
										<div id="Msg" runat="server" style="font-size:13px; color:Red; padding:20px;">
				</div>
							<div style="background-color:#EEE; margin-left:20px ; margin-right:20px; padding-bottom:10px;padding-top:10px;">
                <table id="AddTable" runat="server" >
					<tr>
			
						<td class="style11" style="padding-left:20px;">
						Start Date <br />
								<asp:TextBox ID="StorageStartDate" runat="server"></asp:TextBox>
						<cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="StorageStartDate" Format="dd/MM/yyyy" >
						</cc1:CalendarExtender>
							<asp:RegularExpressionValidator ID="DateValidator2" runat="server"     
                                    ErrorMessage="Valid Date Required" ValidationGroup="SaveInvoice"
                                    ControlToValidate="StorageStartDate"  Display="Dynamic"    
                                    ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />   
                                    
                                    				<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator8" runat="server" ControlToValidate="StorageStartDate" 
                                Display="Dynamic" ValidationGroup="SaveInvoice"
                                >* </asp:RequiredFieldValidator>
                                    
					</td>
					
						<td class="style11" style="padding-left:0px; ">
				
						End Date<br>
                            <asp:TextBox ID="StorageEndDate" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                Enabled="True" Format="dd/MM/yyyy" TargetControlID="StorageEndDate">
                            </cc1:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="StorageEndDate" Display="Dynamic"  ValidationGroup="SaveInvoice"
                                ErrorMessage="Valid Date Required" 
                                ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
               
                  				<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator9" runat="server" ControlToValidate="StorageEndDate" 
                                Display="Dynamic" ValidationGroup="SaveInvoice"
                                >* </asp:RequiredFieldValidator>
					
					
					</td>
					

							
								<td class="style8" >Vehicle Make<br />
							<asp:TextBox ID="VehicleMakeTextBox" runat="server" ReadOnly="true" ></asp:TextBox></td>
											<td class="style8" >Vehicle Model<br />
							<asp:TextBox ID="VehicleModelTextBox" runat="server" ReadOnly="true"></asp:TextBox></td>
								<td class="style8" >Vehicle Reg<br />
							<asp:TextBox ID="VehcileRegTextBox" runat="server" ReadOnly="true"></asp:TextBox></td>
							
					
					</tr>
					</table><table>
					
					<tr>
						<td class="style8"  style="padding-left:20px;  width:150px;">
				
							Storage Daily Rate<br />
							<asp:TextBox ID="StorageDailyRate" runat="server" ></asp:TextBox>
							
							<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="StorageDailyRate" 
                                Display="Dynamic"   ValidationGroup="SaveInvoice"
                                >* </asp:RequiredFieldValidator>
                                
                         <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator3" runat="server" ControlToValidate="StorageDailyRate" 
                                    Display="Dynamic" ErrorMessage=""  ValidationGroup="SaveInvoice"
                                    Text="*" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$" 
                      />
							
							<%--^\d{0,2}(\.\d{1,2})?$--%>
							
						</td>
								<td class="style8">							
						Recovery Charge:<br />
							<asp:TextBox ID="RecoverChargesTextBox" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="RecoverChargesTextBox" 
                                Display="Dynamic"   ValidationGroup="SaveInvoice"
                                >* </asp:RequiredFieldValidator>
                                
                         <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator4" runat="server" ControlToValidate="RecoverChargesTextBox" 
                                    Display="Dynamic" ErrorMessage=""  ValidationGroup="SaveInvoice"
                                    Text="*" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$" 
                      />
						</td>
							<td class="style8" style="width:210px;">
							Recovery of Vehicle From:<br />
							<asp:TextBox ID="RecoveryFrom" runat="server" Width="200" ></asp:TextBox>
							</td>
							
						
								<td class="style8" style="width:150px;">
							Storage Location:<br />
							<asp:TextBox ID="StorageLocation" runat="server" Width="180" ></asp:TextBox>
										
							</td>
					
						
					
						
					</tr>
					
					            </table></div>
					
							
							</td>
						</tr>
					</table>
				
					
					   <table style="margin-left:500px; margin-top:10px; width:200px; height:35px; float:right;"><tr><td>
						
	</td></tr></table>
				</asp:Panel>
			</td>
		</tr>
	</table>
	
	<asp:Panel runat="server" ID="ShowInvoiceDetails" Visible="false">
	
						<div class="MainHeading" style="float:left;">
					        Storage Invoice Details
	</div>
	<div style="float:right; margin-left:550px; margin:5px;" >
	<asp:Button ID="CancelButton" runat="server" Text="Cancel Invoice" 
            onclick="CancelButton_Click"/>
	
	<asp:Button ID="AddDocument" runat="server" Text="Next >>" OnClick="AddInvoiceClick" ValidationGroup="AddInvoice"/>
	
	</div>
	<table style="width:905px; margin-right:20px; background-color:#eee; margin-left:20px;">


				<%--<tr>
                    
						<td class="style8" style="padding-left:20px; padding-top:10px; padding-bottom:5px;">
	
				  <asp:DropDownList ID="DropdownContactType" runat="server" 
                                DataSourceID="SqlsourceDropdown" AutoPostBack="True" 
                                DataTextField="ContactTypeTitle" DataValueField="ContactTypeID" 
                                onselectedindexchanged="DropdownContactType_SelectedIndexChanged" 
                                
                                   ondatabound="DropdownContactType_DataBound"
                                >
                               
            </asp:DropDownList>
            
			                <asp:SqlDataSource ID="SqlsourceDropdown" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                
                                SelectCommand="SELECT [ContactTypeID], [ContactTypeTitle] FROM [ContactType] where ContactTypeID=1 or ContactTypeID=2 or ContactTypeID=3 or ContactTypeID=4 or ContactTypeID=5 or ContactTypeID=7" 
                                onselected="SqlsourceDropdown_Selected" 
                                onselecting="SqlsourceDropdown_Selecting">
                            </asp:SqlDataSource>
			</td>
			
		<td class="style8" style="padding-left:20px; padding-top:10px; padding-bottom:5px;">
					
			</td>
			</tr>--%>
			<tr>	
		<td class="style10" style="padding-left:20px; padding-top:10px;">
		
			Invoice Title<br />
				<asp:TextBox ID="InvoiceTitleTextBox" runat="server" Width="200"></asp:TextBox>
				<asp:RequiredFieldValidator 
                                ID="ClaimTitle1" runat="server" ControlToValidate="InvoiceTitleTextBox" 
                                Display="Dynamic" ValidationGroup="AddInvoice"
                                >* </asp:RequiredFieldValidator>
		  <%--          <asp:DropDownList ID="DropdownContact" runat="server" AutoPostBack="True" 
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
                                    Display="Dynamic" ErrorMessage="Valid Date Required" ValidationGroup="AddInvoice" 
                                    Text="*" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" 
                                  />
                                  
                                  				<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator4" runat="server" ControlToValidate="InvoiceDate" 
                                Display="Dynamic" ValidationGroup="AddInvoice"
                                >* </asp:RequiredFieldValidator>
                                  
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
                                ID="RequiredFieldValidator3" runat="server" ControlToValidate="ContactDetails" 
                                Display="Dynamic" ValidationGroup="AddInvoice"
                                >* </asp:RequiredFieldValidator>
                <br />
                Invoice Header Information<asp:TextBox ID="TextBoxInvoiceHeader" runat="server"  Height="60px" 
                    TextMode="MultiLine" Width="350px"></asp:TextBox>
                <br />
                Invoice Footer Information<br />
                <asp:TextBox ID="TextBoxInvoiceFooter" runat="server" Height="60px" 
                    TextMode="MultiLine" Width="350px"></asp:TextBox>
                    </td>
                    
						<td class="style9" style="padding-left:20px;">
                            <asp:Image ID="CompanyLogo" runat="server" Width="63px" Height="57px" />
                            <br />
				            Invoice Logo (Note: New logo will replace admin logo)<br />
                            <br />
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                  
                            <br />
                            <br />
                            Company Address<asp:TextBox ID="CompanyAddress" runat="server" TextMode="MultiLine" 
                        Width="350px" Height="60px"></asp:TextBox>
                                				<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator5" runat="server" ControlToValidate="CompanyAddress" 
                                Display="Dynamic" ValidationGroup="AddInvoice"
                                >* </asp:RequiredFieldValidator>
                        
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
