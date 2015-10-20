<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="VehicleInvoice.aspx.cs" Inherits="UC_LIVE.VehicleInvoice" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 30px;
        }
        .style2
        {
            width: 30px;
            height: 30px;
        }
        .style3
        {
            height: 35px;
        }
        #Msg
        {
            height: 89px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <table style="width: 950px; background-color:white;">
        <tr>
            <td valign="top">
            
            
              <div class="MainHeading">
                                Vehicle Hire Invoice</div>
                               <div id="Msg" runat="server">
                </div>      
                                <div style="background-color:#EEE; margin-left:20px; padding-bottom:10px;padding-top:10px;">
                <table id="AddTable" runat="server" >
                    <tr>
                 
                        <td style="width:80px; padding-left:18px;" class="style8"> 
                            Start Date
                            <br />
                            <asp:TextBox ID="StorageStartDate" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="StorageStartDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                            <asp:RegularExpressionValidator ID="DateValidator2" runat="server" ErrorMessage="Valid Date Required"
                                ControlToValidate="StorageStartDate" Display="Dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
                        </td>
                     
                        <td style="width:80px;" class="style8">
                            End Date<br />
                            <asp:TextBox ID="StorageEndDate" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="StorageEndDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid Date Required"
                                ControlToValidate="StorageEndDate" Display="Dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
                        </td>
                             
                
                       
                        <td class="style8">
                            Admin Fees
                            <br />
                            <asp:TextBox ID="AdminFees" runat="server"></asp:TextBox>
                        </td>
                        
                           <td class="style8">
                            Delivery &amp; Collection Charges<br />
                            <asp:TextBox ID="DeliveryCharges" runat="server"></asp:TextBox>
                        </td>
                  
                        </tr>
                        </table>
                        <table>                   
                        <tr>
                                <td style="width:115px; padding-left:18px;" class="style8">
                         <div style="padding-bottom:5px;">  Choose Vehicle</div> 
                         
                            <asp:DropDownList ID="VehicleDropDown" runat="server" DataSourceID="ChooseCarDataStource"
                                DataTextField="VehicleMake" DataValueField="VehicleId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ChooseCarDataStource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [VehicleMake], [VehicleId] FROM [Vehicle]"></asp:SqlDataSource>
                        </td>                    
                                             
                        <td style="width:110px;" class="style8">
                          <div style="padding-bottom:5px;">  Control Vehicles</div>
                         
                            <asp:DropDownList ID="ControlVehiclesDropDown" runat="server" Width="100" >
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width:110px;" class="style8">
                            <div style="padding-bottom:5px;">    Estate Vehicles</div>
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
                </table>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <%--		<tr>
			<td class="style2">
				Invoice Title<br />
				<asp:TextBox ID="InvoiceTitleTextBox" runat="server" Height="24px" Width="326px"></asp:TextBox>
			</td>
			<td class="style2">
			</td>
		</tr>--%>
        <%--	<tr>
			<td class="style2">
				Invoice Header<br />
				<asp:TextBox ID="InvoiceHeaderTextBox" runat="server" Height="110px" Width="435px" TextMode="MultiLine"></asp:TextBox>
				<br />
				<asp:FileUpload ID="FileUpload1" runat="server" />
			</td>
			<td class="style2">
			</td>
		</tr>--%>
        <%--<tr>
			<td class="style2">
				Additional Instructions<br />
				<asp:TextBox ID="AdditoinalInstrucitonTextBox" runat="server" Height="110px" Width="436px" TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="style2">
			</td>
		</tr>--%>
        <tr>
            <td align="left" style="padding-left:20px;padding-top:5px;">
                <asp:Button ID="AddDocument" runat="server" Text="Submit Details" OnClick="AddInvoiceClick"
                    />
              
                <asp:Button ID="AddCarHire" runat="server" Text="Start CarHire"
                    OnClick="AddCarHire_Click" Visible="false"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="PanelInvoiceDetials" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:HiddenField ID="InvoiceIDUpdate" runat="server" />
                                &nbsp;<br />
                                <br />
                                <br />
                                &nbsp;<asp:Button ID="UpdateInvoice" runat="server" Text="Update Invoice" OnClick="UpdateInvoice_Click" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
               
                </asp:Panel>
              
            </td>
        </tr>
    </table>
</asp:Content>
