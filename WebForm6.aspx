<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="UC_LIVE.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewClaims.ascx.cs" Inherits="UC_LIVE.Controls.ViewClaims" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
<link href="../Styles/tabs.css" rel="stylesheet" type="text/css" />
<asp:DropDownList ID="ClaimTypesDropdownlist" runat="server" DataSourceID="ClaimTypesDropdown1" DataTextField="ClaimType" DataValueField="ClaimTypeID" AutoPostBack="True" Font-Size="12" Width="150">
</asp:DropDownList>



<%--<div style="margin-bottom: 5px;">
	<asp:TextBox ID="SearchClaims" runat="server" Height="22px" Width="167px"></asp:TextBox>
	<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search Claims" />
</div>--%>
<asp:SqlDataSource ID="ClaimTypesDropdown1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>


<div style="border:solid 1px #EEE; width:905px;">
 <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" MultiPageID="RadMultiPage1"
                SelectedIndex="0" Width="905">
                <Tabs>
                    <telerik:RadTab Text="Potential Claims" runat="server" TabIndex="0">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Accepted Claims" runat="server" TabIndex="1">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Rejected Claims" runat="server" TabIndex="2">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Replacement Claims" runat="server" TabIndex="2">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Completed Claims" runat="server" TabIndex="3">
                    </telerik:RadTab>
                 
                </Tabs>
                
                
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="bodytext">
                <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="1">
               <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ClaimId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" OnRowUpdated="GridView1_RowUpdated" CssClass="GridView1">
				<Columns>
					
					<asp:BoundField DataField="ClaimId" HeaderText="Claim Ref" ReadOnly="True" SortExpression="ClaimId" />
					<asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" />
					<asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate">
						<EditItemTemplate>
							<asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:TextBox>
							<cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" Format="dd/MM/yyyy">
							</cc1:CalendarExtender>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Claim Type" SortExpression="ClaimType">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData" DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Claim Status" SortExpression="ClaimStatusTitle">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData" DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				<asp:CommandField ShowDeleteButton="True"  ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />	
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/info.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					
				</Columns>
				<AlternatingRowStyle CssClass="AlternatingRowStyle" />
				<EditRowStyle BackColor="#FDFDFD" />
				<FooterStyle CssClass="FooterStyle1" />
				<HeaderStyle CssClass="HeaderStyle1" />
				<PagerStyle CssClass="PagesStyle1" />
				<RowStyle CssClass="RowStyle1" />
				<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
			</asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ClaimStatus.ClaimStatusID, ClaimTypes.ClaimTypeID, Claim.ClaimId, Claim.ClaimTitle, Claim.AccidentDate, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle FROM Claim INNER JOIN ClaimTypes ON Claim.ClaimTypeID = ClaimTypes.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID AND ClaimStatus.ClaimStatusTitle = 'Potential Claims' and Claim.ClaimTypeID = @ClaimTypeDropdown order by Claim.ClaimId desc " UpdateCommand="UPDATE Claim SET ClaimTitle = @ClaimTitle, AccidentDate = @AccidentDate, ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
				<DeleteParameters>
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="DateCreated" Type="DateTime" />
					<asp:Parameter Name="DateUpdated" Type="DateTime" />
					<asp:Parameter Name="RefferedBy" Type="String" />
					<asp:Parameter Name="AccidentLocation" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="AccidentInfo" Type="String" />
					<asp:Parameter Name="RoadCondition" Type="String" />
					<asp:Parameter Name="DriverPolicyNo" Type="String" />
					<asp:Parameter Name="WhotoBlame" Type="String" />
					<asp:Parameter Name="PoliceAttended" Type="String" />
					<asp:Parameter Name="PoliceOfficerName" Type="String" />
					<asp:Parameter Name="PoliceLogNo" Type="String" />
					<asp:Parameter Name="PoliceAddress" Type="String" />
					<asp:Parameter Name="VehicleRoadworthy" Type="String" />
					<asp:Parameter Name="DamageToVehcle" Type="String" />
					<asp:Parameter Name="AdditionalInfo" Type="String" />
					<asp:Parameter Name="AnyoneInjured" Type="String" />
					<asp:Parameter Name="PassengerClaims" Type="String" />
					<asp:Parameter Name="AnyWitnesses" Type="String" />
					<asp:Parameter Name="PreviousAccidents" Type="String" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="2">
                	<asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ClaimId" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" OnRowUpdated="GridView2_RowUpdated" CssClass="GridView1">
				<AlternatingRowStyle CssClass="AlternatingRowStyle" />
				<Columns>
					
					<asp:BoundField DataField="ClaimId" HeaderText="Claim Ref" ReadOnly="True" SortExpression="ClaimId" />
					<asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" />
					<asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate">
						<EditItemTemplate>
							<asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:TextBox><cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" Format="dd/MM/yyyy">
							</cc1:CalendarExtender>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ClaimType" SortExpression="ClaimType">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData" DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ClaimStatus" SortExpression="ClaimStatusTitle">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData" DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					
					<asp:CommandField ShowDeleteButton="True"  ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif"  ShowCancelButton="true" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/info.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					
				</Columns>
				<EditRowStyle BackColor="#FDFDFD" />
				<FooterStyle CssClass="FooterStyle1" />
				<HeaderStyle CssClass="HeaderStyle1" />
				<PagerStyle CssClass="PagesStyle1" />
				<RowStyle CssClass="RowStyle1" />
				<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
			</asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ClaimStatus.ClaimStatusID, ClaimTypes.ClaimTypeID, Claim.ClaimId, Claim.ClaimTitle, Claim.AccidentDate, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle FROM Claim INNER JOIN ClaimTypes ON Claim.ClaimTypeID = ClaimTypes.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID AND ClaimStatus.ClaimStatusTitle = 'Accepted Claims' and Claim.ClaimTypeID = @ClaimTypeDropdown order by Claim.ClaimId desc" UpdateCommand="UPDATE Claim SET ClaimTitle = @ClaimTitle, AccidentDate = @AccidentDate, ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
				<DeleteParameters>
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="DateCreated" Type="DateTime" />
					<asp:Parameter Name="DateUpdated" Type="DateTime" />
					<asp:Parameter Name="RefferedBy" Type="String" />
					<asp:Parameter Name="AccidentLocation" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="AccidentInfo" Type="String" />
					<asp:Parameter Name="RoadCondition" Type="String" />
					<asp:Parameter Name="DriverPolicyNo" Type="String" />
					<asp:Parameter Name="WhotoBlame" Type="String" />
					<asp:Parameter Name="PoliceAttended" Type="String" />
					<asp:Parameter Name="PoliceOfficerName" Type="String" />
					<asp:Parameter Name="PoliceLogNo" Type="String" />
					<asp:Parameter Name="PoliceAddress" Type="String" />
					<asp:Parameter Name="VehicleRoadworthy" Type="String" />
					<asp:Parameter Name="DamageToVehcle" Type="String" />
					<asp:Parameter Name="AdditionalInfo" Type="String" />
					<asp:Parameter Name="AnyoneInjured" Type="String" />
					<asp:Parameter Name="PassengerClaims" Type="String" />
					<asp:Parameter Name="AnyWitnesses" Type="String" />
					<asp:Parameter Name="PreviousAccidents" Type="String" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="3">
              	<asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ClaimId" DataSourceID="SqlDataSource3" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" OnRowUpdated="GridView3_RowUpdated" CssClass="GridView1">
				<RowStyle CssClass="RowStyle1" />
				<Columns>
					
					<asp:BoundField DataField="ClaimId" HeaderText="Claim Ref" ReadOnly="True" SortExpression="ClaimId" />
					<asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" />
					<asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate">
						<EditItemTemplate>
							<asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:TextBox><cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" Format="dd/MM/yyyy">
							</cc1:CalendarExtender>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ClaimType" SortExpression="ClaimType">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData" DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ClaimStatus" SortExpression="ClaimStatusTitle">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData" DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					
					<asp:CommandField ShowDeleteButton="True"  ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif"  ShowCancelButton="true" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/info.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					
				</Columns>
				<FooterStyle CssClass="FooterStyle1" />
				<PagerStyle CssClass="PagesStyle1" />
				<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
				<HeaderStyle CssClass="HeaderStyle1" />
				<EditRowStyle BackColor="#FDFDFD" />
				<AlternatingRowStyle CssClass="AlternatingRowStyle" />
			</asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ClaimStatus.ClaimStatusID, ClaimTypes.ClaimTypeID, Claim.ClaimId, Claim.ClaimTitle, Claim.AccidentDate, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle FROM Claim INNER JOIN ClaimTypes ON Claim.ClaimTypeID = ClaimTypes.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID AND ClaimStatus.ClaimStatusTitle = 'Rejected Claims' and Claim.ClaimTypeID = @ClaimTypeDropdown order by Claim.ClaimId desc" UpdateCommand="UPDATE Claim SET ClaimTitle = @ClaimTitle, AccidentDate = @AccidentDate, ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
				<SelectParameters>
					<asp:ControlParameter ControlID="ClaimTypesDropdownlist" Name="ClaimTypeDropdown" PropertyName="SelectedValue" DefaultValue="1" />
				</SelectParameters>
				<DeleteParameters>
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="DateCreated" Type="DateTime" />
					<asp:Parameter Name="DateUpdated" Type="DateTime" />
					<asp:Parameter Name="RefferedBy" Type="String" />
					<asp:Parameter Name="AccidentLocation" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="AccidentInfo" Type="String" />
					<asp:Parameter Name="RoadCondition" Type="String" />
					<asp:Parameter Name="DriverPolicyNo" Type="String" />
					<asp:Parameter Name="WhotoBlame" Type="String" />
					<asp:Parameter Name="PoliceAttended" Type="String" />
					<asp:Parameter Name="PoliceOfficerName" Type="String" />
					<asp:Parameter Name="PoliceLogNo" Type="String" />
					<asp:Parameter Name="PoliceAddress" Type="String" />
					<asp:Parameter Name="VehicleRoadworthy" Type="String" />
					<asp:Parameter Name="DamageToVehcle" Type="String" />
					<asp:Parameter Name="AdditionalInfo" Type="String" />
					<asp:Parameter Name="AnyoneInjured" Type="String" />
					<asp:Parameter Name="PassengerClaims" Type="String" />
					<asp:Parameter Name="AnyWitnesses" Type="String" />
					<asp:Parameter Name="PreviousAccidents" Type="String" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="4">
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ClaimId" DataSourceID="SqlDataSource4" OnRowUpdated="GridView4_RowUpdated" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" CssClass="GridView1">
				<RowStyle CssClass="RowStyle1" />
				<Columns>

					<asp:BoundField DataField="ClaimId" HeaderText="Claim Ref" ReadOnly="True" SortExpression="ClaimId" />
					<asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" />
					<asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate">
						<EditItemTemplate>
							<asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:TextBox><cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" Format="dd/MM/yyyy">
							</cc1:CalendarExtender>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ClaimType" SortExpression="ClaimType">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData" DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ClaimStatus" SortExpression="ClaimStatusTitle">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData" DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					
					<asp:CommandField ShowDeleteButton="True"  ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif"  ShowCancelButton="true" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/info.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					
				</Columns>
				<FooterStyle CssClass="FooterStyle1" />
				<PagerStyle CssClass="PagesStyle1" />
				<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
				<HeaderStyle CssClass="HeaderStyle1" />
				<EditRowStyle BackColor="#FDFDFD" />
				<AlternatingRowStyle CssClass="AlternatingRowStyle" />
			</asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ClaimStatus.ClaimStatusID, ClaimTypes.ClaimTypeID, Claim.ClaimId, Claim.ClaimTitle, Claim.AccidentDate, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle FROM Claim INNER JOIN ClaimTypes ON Claim.ClaimTypeID = ClaimTypes.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID AND ClaimStatus.ClaimStatusTitle = 'Replacement Claims' and Claim.ClaimTypeID = @ClaimTypeDropdown order by Claim.ClaimId desc" UpdateCommand="UPDATE Claim SET ClaimTitle = @ClaimTitle, AccidentDate = @AccidentDate, ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
				<SelectParameters>
					<asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
				</SelectParameters>
				<DeleteParameters>
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="DateCreated" Type="DateTime" />
					<asp:Parameter Name="DateUpdated" Type="DateTime" />
					<asp:Parameter Name="RefferedBy" Type="String" />
					<asp:Parameter Name="AccidentLocation" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="AccidentInfo" Type="String" />
					<asp:Parameter Name="RoadCondition" Type="String" />
					<asp:Parameter Name="DriverPolicyNo" Type="String" />
					<asp:Parameter Name="WhotoBlame" Type="String" />
					<asp:Parameter Name="PoliceAttended" Type="String" />
					<asp:Parameter Name="PoliceOfficerName" Type="String" />
					<asp:Parameter Name="PoliceLogNo" Type="String" />
					<asp:Parameter Name="PoliceAddress" Type="String" />
					<asp:Parameter Name="VehicleRoadworthy" Type="String" />
					<asp:Parameter Name="DamageToVehcle" Type="String" />
					<asp:Parameter Name="AdditionalInfo" Type="String" />
					<asp:Parameter Name="AnyoneInjured" Type="String" />
					<asp:Parameter Name="PassengerClaims" Type="String" />
					<asp:Parameter Name="AnyWitnesses" Type="String" />
					<asp:Parameter Name="PreviousAccidents" Type="String" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="5">
             <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ClaimId" DataSourceID="SqlDataSource5" OnRowUpdated="GridView5_RowUpdated" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" CssClass="GridView1">
				<RowStyle CssClass="RowStyle1" />
				<Columns>
					
					<asp:BoundField DataField="ClaimId" HeaderText="Claim Ref" ReadOnly="True" SortExpression="ClaimId" />
					<asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" />
					<asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate">
						<EditItemTemplate>
							<asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:TextBox><cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" Format="dd/MM/yyyy">
							</cc1:CalendarExtender>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ClaimType" SortExpression="ClaimType">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData" DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="ClaimStatus" SortExpression="ClaimStatusTitle">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData" DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
							</asp:DropDownList>
							<asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]"></asp:SqlDataSource>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
					</asp:TemplateField>
					
					<asp:CommandField ShowDeleteButton="True"  ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png" ShowSelectButton="True" SelectImageUrl="~/Images/Grid/select.gif"  ShowCancelButton="true" UpdateImageUrl="~/Images/Grid/IconUpdate.gif" CancelImageUrl="~/Images/Grid/IconCancel.gif" />
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText=" ">
						<ItemTemplate>
							<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>' ForeColor="GrayText" ImageUrl="~/Images/info.png"></asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateField>
					
				</Columns>
				<FooterStyle CssClass="FooterStyle1" />
				<PagerStyle CssClass="PagesStyle1" />
				<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
				<HeaderStyle CssClass="HeaderStyle1" />
				<EditRowStyle BackColor="#FDFDFD" />
				<AlternatingRowStyle CssClass="AlternatingRowStyle" />
			</asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ClaimStatus.ClaimStatusID, ClaimTypes.ClaimTypeID, Claim.ClaimId, Claim.ClaimTitle, Claim.AccidentDate, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle FROM Claim INNER JOIN ClaimTypes ON Claim.ClaimTypeID = ClaimTypes.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID AND ClaimStatus.ClaimStatusTitle = 'Completed Claims' and Claim.ClaimTypeID = @ClaimTypeDropdown order by Claim.ClaimId desc" UpdateCommand="UPDATE Claim SET ClaimTitle = @ClaimTitle, AccidentDate = @AccidentDate, ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
				<SelectParameters>
					<asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" Name="ClaimTypeDropdown" PropertyName="SelectedValue" />
				</SelectParameters>
				<DeleteParameters>
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="DateCreated" Type="DateTime" />
					<asp:Parameter Name="DateUpdated" Type="DateTime" />
					<asp:Parameter Name="RefferedBy" Type="String" />
					<asp:Parameter Name="AccidentLocation" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="AccidentInfo" Type="String" />
					<asp:Parameter Name="RoadCondition" Type="String" />
					<asp:Parameter Name="DriverPolicyNo" Type="String" />
					<asp:Parameter Name="WhotoBlame" Type="String" />
					<asp:Parameter Name="PoliceAttended" Type="String" />
					<asp:Parameter Name="PoliceOfficerName" Type="String" />
					<asp:Parameter Name="PoliceLogNo" Type="String" />
					<asp:Parameter Name="PoliceAddress" Type="String" />
					<asp:Parameter Name="VehicleRoadworthy" Type="String" />
					<asp:Parameter Name="DamageToVehcle" Type="String" />
					<asp:Parameter Name="AdditionalInfo" Type="String" />
					<asp:Parameter Name="AnyoneInjured" Type="String" />
					<asp:Parameter Name="PassengerClaims" Type="String" />
					<asp:Parameter Name="AnyWitnesses" Type="String" />
					<asp:Parameter Name="PreviousAccidents" Type="String" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="ClaimTitle" Type="String" />
					<asp:Parameter Name="AccidentDate" Type="DateTime" />
					<asp:Parameter Name="ClaimTypeID" Type="Int32" />
					<asp:Parameter Name="ClaimStatusID" Type="Int32" />
					<asp:Parameter Name="ClaimId" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
                </telerik:RadPageView>
            
                
                
                </telerik:RadMultiPage>

</div>
<%--
<cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="915" Height="450" CssClass="ajax__tab_lightblue-theme">


</cc1:TabContainer>
--%>
</asp:Content>
