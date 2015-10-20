<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewCarhireInvoice.aspx.cs" Inherits="UC_LIVE.NewCarhireInvoice" %>
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
        .style12
        {
            font-size: 12px;
            font-family: Microsoft Sans Serif;
            color: #666666;
            height: 33px;
        }
        #ShowVhicleDetails
        {
            width: 178px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   
<div style="background-color:White; ">	
<table><tr>		
			<td class="style7" style="padding-left:10px;">
				<asp:Panel ID="PanelInvoiceDetials" runat="server" Visible="false" 
                    Width="922px">
                    	<div class="MainHeading" style="float:left;">
					Car Hire Details
					
 <asp:HiddenField ID="InvoiceIDUpdate" runat="server" />
  <asp:HiddenField ID="CareHireFormUpdateHidden" runat="server" />
  
  	<div style="float:right; margin-top:-20px; width:200px;">
  		<asp:Button ID="BackButton" runat="server" Text="<<Back" OnClick="BackButton_Click"  />
  	<asp:Button ID="UpdateInvoice" runat="server" Text="Create Invoice" OnClick="UpdateInvoice_Click" ValidationGroup="SaveInvoice" Visible="true" /></div>
  
  	</div>
  	
					<div style="float:right; margin-top:10px;">
				
				</div>
				
				<div style="clear:both"></div>		

                    <table>
						<tr>
							<td>
							<div id="Msg" runat="server" style="font-size:13px; color:Red; padding:20px;">
				</div>
							
							<div style="background-color:#EEE; margin-left:20px; padding-bottom:10px;padding-top:10px;">
							
															
                <table id="AddTable" runat="server" >
                    <tr>
                 
                        <td style="width:80px; padding-left:18px;" class="style8"> 
                            Start Date
                            <br />
                            <asp:TextBox ID="CarhireStartDate" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="CarhireStartDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                            <asp:RegularExpressionValidator ID="DateValidator2" runat="server" ErrorMessage="Valid Date Required" 
                                ControlToValidate="CarhireStartDate" Display="Dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="SaveInvoice" />
                       	<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator6" runat="server" ControlToValidate="CarhireStartDate" 
                                Display="Dynamic" ValidationGroup="SaveInvoice"
                                >* </asp:RequiredFieldValidator>
                       
                        </td>
                     
                        <td style="width:80px;" class="style8">
                            End Date<br />
                            <asp:TextBox ID="CarhireEndDate" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="CarhireEndDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid Date Required"
                                ControlToValidate="CarhireEndDate" Display="Dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="SaveInvoice"/>
                       
                          	<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator7" runat="server" ControlToValidate="CarhireEndDate" 
                                Display="Dynamic"   ValidationGroup="SaveInvoice"
                                >* </asp:RequiredFieldValidator>
                        </td>
                             
                
                       
                        <td class="style8">
                            Admin Fees
                            <br />
                            <asp:TextBox ID="AdminFees" runat="server"></asp:TextBox>
                            				<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="AdminFees" 
                                Display="Dynamic"  ValidationGroup="SaveInvoice"
                                >* </asp:RequiredFieldValidator>
                                
                         <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator3" runat="server" ControlToValidate="AdminFees" 
                                    Display="Dynamic" ErrorMessage="" ValidationGroup="SaveInvoice"
                                    Text="*" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$" 
                      />
                            
                        </td>
                        
                           <td class="style8">
                            Delivery &amp; Collection Charges<br />
                            <asp:TextBox ID="DeliveryCharges" runat="server"></asp:TextBox>
                                    				<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="DeliveryCharges" 
                                Display="Dynamic" ValidationGroup="SaveInvoice" 
                                >* </asp:RequiredFieldValidator>
                                
                         <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator4" runat="server" ControlToValidate="DeliveryCharges" 
                                    Display="Dynamic" ErrorMessage="" ValidationGroup="SaveInvoice"
                                    Text="*" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$" 
                      />
                        </td>
                  
                        </tr>
                        </table>
                        <table>                   
                        <tr>
                                <td style="width:115px; padding-left:18px;" class="style8">
                         <div style="padding-bottom:5px;"> Choose Vehicle</div> 
                         
                            <asp:DropDownList ID="VehicleDropDown" runat="server" DataSourceID="ChooseCarDataStource"
                                DataTextField="VehicleReg" DataValueField="VehicleId" AutoPostBack="True" 
                                        onselectedindexchanged="VehicleDropDown_SelectedIndexChanged" ondatabound="DropdownCar_DataBound" >
                            </asp:DropDownList>
                            
                                 <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator5" runat="server" ControlToValidate="VehicleDropDown" 
                                    Display="Dynamic" ErrorMessage="" 
                                    Text="*" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$" 
                      />
                            
                            
                            
                            <asp:SqlDataSource ID="ChooseCarDataStource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                
                                        SelectCommand="SELECT [VehicleMake], [VehicleId], [VehicleModel], [VehicleReg] FROM [Vehicle] where VehicleType='CourtesyCar'"></asp:SqlDataSource>
                       
                      
                        </td>                    
                                             
                        <td style="width:110px;" class="style8">
                          <div style="padding-bottom:5px;">  Control Vehicles</div>
                         
                            <asp:DropDownList ID="ControlVehiclesDropDown" runat="server" Width="100" >
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width:110px;" class="style8">
                            <div style="padding-bottom:5px;">Estate Vehicles</div>
                            <asp:DropDownList ID="EstateVehiclesDropDown" runat="server"  Width="100">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                         <td style="width:130px;" class="style8">
                              <div style="padding-bottom:5px;"  >  Tow Bars/Baby Seats</div>
                            <asp:DropDownList ID="BabySeatsDropDown" runat="server" Width="120">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                      <td style="width:110px;" class="style8">
                             <div style="padding-bottom:5px;">   Additional Driver</div>
                            <asp:DropDownList ID="AdditionalDriverDropDown" runat="server" Width="100">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        
                          <td class="style8">
                              <div style="padding-bottom:5px;" > Automatic( <span style="font-size:10px;">semi-shift gearboxes, <span class="q1">direct
                                shift gearboxes</span></span> )</div>
                           
                            <asp:DropDownList ID="AutomaticDropDown1" runat="server" Width="120">
                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                <asp:ListItem Value="No" Text="No"></asp:ListItem>
                            </asp:DropDownList>
                            
                        </td>
                      </tr>
                       <tr> <td colspan="5"><div id="ShowVhicleDetails" visible="true" runat="server" class="bodytext" style="margin-left:20px;"></div></td></tr>
                   
                </table>
            
					
							
							</td>
						</tr>
					</table>
				
					
					
				</asp:Panel>
			</td>
		</tr>
	</table>
	
	<asp:Panel runat="server" ID="ShowInvoiceDetails" Visible="false">
						<div class="MainHeading" style="float:left;">
					Hire Invoice Details
	</div>
	
					<div style="float:left;margin-left:550px; margin-top:5px;">
					 <asp:HiddenField ID="ContactIDupdate" runat="server"  />
						<asp:Button ID="CancelButton1" runat="server" Text="Cancel Invoice" 
            onclick="CancelButton_Click1"/>

		<asp:Button ID="AddDocument" runat="server" Text="Next >>" OnClick="AddInvoiceClick" ValidationGroup="SaveInvoice" />
	
	</div>
	<table style="width:905px; margin-right:20px; background-color:#eee; margin-left:20px;">

	
				
	<%--			<tr>
                    
						<td class="style8" style="padding-left:20px; padding-top:10px; padding-bottom:5px;">
	<%--
				  <asp:DropDownList ID="DropdownContactType" runat="server" 
                                DataSourceID="SqlsourceDropdown" AutoPostBack="True" 
                                DataTextField="ContactTypeTitle" DataValueField="ContactTypeID" 
                                onselectedindexchanged="DropdownContactType_SelectedIndexChanged" 
                                
                                   ondatabound="DropdownContactType_DataBound" >
                               
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
                                Display="Dynamic"  
                                ValidationGroup="SaveInvoice" Text="CareHire company detailsd are required">* </asp:RequiredFieldValidator>
		        <%--    <asp:DropDownList ID="DropdownContact " runat="server" AutoPostBack="True" 
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
                </asp:SqlDataSource>
		--%>
			</td>
	
		<td class="style10" style="padding-left:20px; padding-top:10px;">
				Invoice Date<br />
				<asp:TextBox ID="InvoiceDate" runat="server" ></asp:TextBox>
				       <div style="float: left;">
                                    <cc1:CalendarExtender ID="InvoiceDate_calender" runat="server" Enabled="True"
                                        Format="dd/MM/yyyy" TargetControlID="InvoiceDate">
                                    </cc1:CalendarExtender>
                                    <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator2" runat="server" ControlToValidate="InvoiceDate" 
                                    Display="Dynamic" ErrorMessage="Valid Date Required"  ValidationGroup="InvoiceValidation"
                                    Text="*" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" 
                      />
                         			<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator3" runat="server" ControlToValidate="InvoiceTitleTextBox" 
                                Display="Dynamic"  
                                ValidationGroup="InvoiceValidation">* </asp:RequiredFieldValidator>
                         
                         
                         
                                </div>
				
			</td>
		</tr><tr>
			<td class="style9" style="padding-left:20px;">
				Contact Details<asp:TextBox ID="ContactDetails" runat="server"  TextMode="MultiLine" 
                    Width="350px" Height="60px"></asp:TextBox>
                    	<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ContactDetails" Display="Dynamic" ValidationGroup="SaveInvoice">* </asp:RequiredFieldValidator>
                    
                    
                    
                    
                <br />
                Invoice Header Information<asp:TextBox ID="TextBoxInvoiceHeader"  runat="server" Height="60px" 
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
