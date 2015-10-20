<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CarHire.aspx.cs" Inherits="UC_LIVE.CarHire" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.style1
		{
			width: 52px;
		}
		.style2
		{
			width: 169px;
		}
	p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
			margin-left: 0cm;
			margin-right: 0cm;
			margin-top: 0cm;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
		<tr>
			<td class="style2">
				Choose Client</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				Choose CarHire Company</td>
		</tr>
		<tr>
			<td class="style2">
				<asp:DropDownList ID="ClientDropDown" runat="server" DataSourceID="ClientSQLSource" DataTextField="FirstName" DataValueField="ContactID">
				</asp:DropDownList>
				<asp:SqlDataSource ID="ClientSQLSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [FirstName], [ContactID] FROM [Contact]"></asp:SqlDataSource>
			</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				<asp:DropDownList ID="HireCompanyDropDown" runat="server" DataSourceID="HireCompanySQLSource" DataTextField="Company" DataValueField="ContactID">
				</asp:DropDownList>
				<asp:SqlDataSource ID="HireCompanySQLSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ContactID], [Company], [ContactTypeID] FROM [Contact] WHERE ([ContactTypeID] = @ContactTypeID)">
					<SelectParameters>
						<asp:Parameter DefaultValue="4" Name="ContactTypeID" Type="Int32" />
					</SelectParameters>
				</asp:SqlDataSource>
			</td>
		</tr>
		<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				&nbsp;</td>
		</tr>
			<tr>
			<td class="style2">
				Choose Vehicle</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				Additional Driver</td>
		</tr>
			<tr>
			<td class="style2">
				<asp:DropDownList ID="VehicleDropDown" runat="server" DataSourceID="VehilcleSQLSource" DataTextField="VehicleMake" DataValueField="VehicleId">
				</asp:DropDownList>
				<asp:SqlDataSource ID="VehilcleSQLSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [VehicleId], [VehicleMake] FROM [Vehicle]"></asp:SqlDataSource>
				</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				<asp:DropDownList ID="AdditoinalDriverDropDown" runat="server">
				<asp:ListItem Value="yes">Yes</asp:ListItem>
				<asp:ListItem Value="no">No</asp:ListItem>
				</asp:DropDownList>
				</td>
		</tr>
			<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				&nbsp;</td>
		</tr>
			<tr>
			<td class="style2">
				Hire Start Date &amp; Time</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				Hire End Date &amp; Time</td>
		</tr>
			<tr>
			<td class="style2">
				<asp:TextBox ID="HireStartDate" runat="server"></asp:TextBox>
		<cc1:CalendarExtender ID="AccidentDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="HireStartDate" Format="dd/MM/yyyy">
												</cc1:CalendarExtender>
												               <asp:RegularExpressionValidator ID="DateValidator2" runat="server"     
                                    ErrorMessage="Valid Date Required" 
                                    ControlToValidate="HireStartDate"  Display="Dynamic"    
                                    ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				<asp:TextBox ID="HireEndDate" runat="server"></asp:TextBox>
				<cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Enabled="True" TargetControlID="HireEndDate">
				</cc1:CalendarExtender>
					<cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="HireEndDate" Format="dd/MM/yyyy">
												</cc1:CalendarExtender>
												               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"     
                                    ErrorMessage="Valid Date Required" 
                                    ControlToValidate="HireEndDate"  Display="Dynamic"    
                                    ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
				</td>
				
				
		</tr>
			<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				&nbsp;</td>
		</tr>
			
			<tr>
			<td class="style2">
				Delivery / Collection Charge</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				Automatics ( Semi-Shift Gearboxes, Direct Shif GearBoxes)</td>
		</tr>
				
			<tr>
			<td class="style2">
				<asp:TextBox ID="DeliveryCharge" runat="server"></asp:TextBox>
				</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				<asp:DropDownList ID="AutomaticsDropDown" runat="server">
				<asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
				<asp:ListItem Value="No" Text="No"></asp:ListItem>
					
				</asp:DropDownList>
				</td>
		</tr>
				
			<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				Estate Vehicles</td>
		</tr>
				
			<tr>
			<td class="style2">
				Admin Fees</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				<asp:DropDownList ID="EstateDropDown" runat="server">
						<asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
				<asp:ListItem Value="No" Text="No"></asp:ListItem>
				</asp:DropDownList>
				</td>
		</tr>
				<tr>
			<td class="style2">
				<asp:TextBox ID="AdminFees" runat="server"></asp:TextBox>
					</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				Tow Bars &amp; baby Seats</td>
		</tr>
				<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				<asp:DropDownList ID="BabySeatDropDown" runat="server">
						<asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
				<asp:ListItem Value="No" Text="No"></asp:ListItem>
				</asp:DropDownList>
					</td>
		</tr>
				<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				DuelControlVehicles</td>
		</tr>
				<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				<asp:DropDownList ID="DuelControlDropDown" runat="server">
						<asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
				<asp:ListItem Value="No" Text="No"></asp:ListItem>
				</asp:DropDownList>
					</td>
		</tr>
				
			<tr>
			<td class="style2">
				<asp:Button ID="Button1" runat="server" Text="Submit Details" onclick="Button1_Click" />
				</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				&nbsp;</td>
		</tr>
			
			<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				<p class="MsoNormal" style="margin-left:27.0pt;text-indent:-18.0pt;mso-list:l0 level1 lfo1;
tab-stops:list 27.0pt">
					<![if !supportLists]><b style="mso-bidi-font-weight:
normal"><span style="font-size:12.0pt;mso-fareast-font-family:Calibri"><span style="mso-list:Ignore">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]>
				</p>
				</td>
		</tr>
			
			<tr>
			<td class="style2">
				&nbsp;</td>
			<td class="style1">
				&nbsp;</td>
			<td>
				&nbsp;</td>
		</tr>
			
			<tr>
			<td class="style2">
				</td>
			<td class="style1">
				</td>
			<td>
				</td>
		</tr>
	</table>
</asp:Content>
