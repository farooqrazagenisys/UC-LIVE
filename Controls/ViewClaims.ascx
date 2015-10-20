<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewClaims.ascx.cs"
    Inherits="UC_LIVE.Controls.ViewClaims" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
<link href="../Styles/tabs.css" rel="stylesheet" type="text/css" />
<table style="width: 905px; margin-left: 0px;">
 
    <tr>
        <td class="FormHeading" style="width: 130px; padding-left: 0px;">
            Choose Claim Type
        </td>
        <td>
            <asp:DropDownList ID="ClaimTypesDropdownlist" runat="server" DataSourceID="ClaimTypesDropdown1"
                DataTextField="ClaimType" DataValueField="ClaimTypeID" AutoPostBack="True" CssClass="DropdownList">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<%--<div style="margin-bottom: 5px;">
	<asp:TextBox ID="SearchClaims" runat="server" Height="22px" Width="167px"></asp:TextBox>
	<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search Claims" />
</div>--%>
<asp:SqlDataSource ID="ClaimTypesDropdown1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
<div style="border: solid 1px #EEE; width: 910px; padding-bottom:5px;">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" MultiPageID="RadMultiPage1"
        SelectedIndex="0" Width="910">
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
          <%--    <telerik:RadTab Text="Archived Claims" runat="server" TabIndex="3">
            </telerik:RadTab>--%>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="bodytext">
        <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="1">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="ClaimId" DataSourceID="SqlDataSource1"
                EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
                OnRowUpdated="GridView1_RowUpdated" Width="900px" CssClass="GridView1" 
                Font-Bold="False" HorizontalAlign="Left" PageSize="40">
                <Columns>                
                  <asp:ButtonField HeaderText="" ItemStyle-Width="10">                  
                    <ItemStyle Width="10px" />
                    </asp:ButtonField>  
                 <asp:TemplateField HeaderText="Claim Ref" ItemStyle-Width="100" >
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" ReadOnly="True" runat="server" SortExpression="ClaimId" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" Text='<%# Bind("ClaimId") %>'></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" ReadOnly="true" ItemStyle-Width="220" >
                    <ControlStyle Width="150px" />
                    </asp:BoundField>
                           <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                        SortExpression="FirstName" ReadOnly="true" ItemStyle-Width="100" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" 
                        SortExpression="Surname" ReadOnly="true" ItemStyle-Width="100"  />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ReadOnly="true" ItemStyle-Width="110" />
                     <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" SortExpression="AccidentDate" ReadOnly="true"   dataformatstring="{0:dd-MMM-yyyy}" htmlencode="false" ItemStyle-Width="130"/>
            <%--        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
                   <%-- <asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate"  ControlStyle-Width="100">
                        <EditItemTemplate>
                            <asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:TextBox><cc1:CalendarExtender
                                ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" >
                            </cc1:CalendarExtender>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Claim Type" SortExpression="ClaimType" >
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData"
                                DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>
                    
                    
                    
                    <asp:TemplateField HeaderText="Claim Status" SortExpression="ClaimStatusTitle" ControlStyle-Width="150">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData"
                                DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        
                        
                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View" ControlStyle-ForeColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/info.png" Target="_blank"></asp:HyperLink></ItemTemplate>
                        <ControlStyle ForeColor="White" />
                    </asp:TemplateField>
                    <asp:CommandField  ShowEditButton="True" ButtonType="Image" 
                        EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                        UpdateImageUrl="~/Images/Grid/IconUpdate.gif" 
                        CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        
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
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Potential Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') ORDER BY Claim.ClaimId DESC"
                
                
                UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
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
                    <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" Name="ClaimTypeDropdown"
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
      
                    <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                    <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                    <asp:Parameter Name="ClaimId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="2" CssClass="bodytext">
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="ClaimId" DataSourceID="SqlDataSource2"
                EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
                HeaderStyle-HorizontalAlign="Left" OnRowUpdated="GridView2_RowUpdated" CssClass="GridView1" PageSize="40">
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        <Columns>                
                  <asp:ButtonField HeaderText="" ItemStyle-Width="10">                  
                    <ItemStyle Width="10px" />
                    </asp:ButtonField>  
                 <asp:TemplateField HeaderText="Claim Ref" ItemStyle-Width="100" >
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" ReadOnly="True" runat="server" SortExpression="ClaimId" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" Text='<%# Bind("ClaimId") %>'></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" ReadOnly="true" ItemStyle-Width="220" >
                    <ControlStyle Width="150px" />
                    </asp:BoundField>
                           <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                        SortExpression="FirstName" ReadOnly="true" ItemStyle-Width="100" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" 
                        SortExpression="Surname" ReadOnly="true" ItemStyle-Width="100"  />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ReadOnly="true" ItemStyle-Width="110" />
                     <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" SortExpression="AccidentDate" ReadOnly="true"   dataformatstring="{0:dd-MMM-yyyy}" htmlencode="false" ItemStyle-Width="130"/>
            <%--        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
                   <%-- <asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate"  ControlStyle-Width="100">
                        <EditItemTemplate>
                            <asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:TextBox><cc1:CalendarExtender
                                ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" >
                            </cc1:CalendarExtender>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Claim Type" SortExpression="ClaimType" >
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData"
                                DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>
                    
                    
                    
                    <asp:TemplateField HeaderText="Claim Status" SortExpression="ClaimStatusTitle" ControlStyle-Width="150">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData"
                                DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        
                        
                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View" ControlStyle-ForeColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/info.png" Target="_blank"></asp:HyperLink></ItemTemplate>
                        <ControlStyle ForeColor="White" />
                    </asp:TemplateField>
                    <asp:CommandField  ShowEditButton="True" ButtonType="Image" 
                        EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                        UpdateImageUrl="~/Images/Grid/IconUpdate.gif" 
                        CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        
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
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Accepted Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') ORDER BY Claim.ClaimId DESC"
                UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
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
                    <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" Name="ClaimTypeDropdown"
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
              
                    <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                    <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                    <asp:Parameter Name="ClaimId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="3" CssClass="bodytext">
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="1" DataKeyNames="ClaimId" DataSourceID="SqlDataSource3"
                EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
                OnRowUpdated="GridView3_RowUpdated" CssClass="GridView1" PageSize="40">
                <RowStyle CssClass="RowStyle1" />
                         <Columns>                
                  <asp:ButtonField HeaderText="" ItemStyle-Width="10">                  
                    <ItemStyle Width="10px" />
                    </asp:ButtonField>  
                 <asp:TemplateField HeaderText="Claim Ref" ItemStyle-Width="100" >
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" ReadOnly="True" runat="server" SortExpression="ClaimId" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" Text='<%# Bind("ClaimId") %>'></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" ReadOnly="true" ItemStyle-Width="220" >
                    <ControlStyle Width="150px" />
                    </asp:BoundField>
                           <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                        SortExpression="FirstName" ReadOnly="true" ItemStyle-Width="100" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" 
                        SortExpression="Surname" ReadOnly="true" ItemStyle-Width="100"  />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ReadOnly="true" ItemStyle-Width="110" />
                     <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" SortExpression="AccidentDate" ReadOnly="true"   dataformatstring="{0:dd-MMM-yyyy}" htmlencode="false" ItemStyle-Width="130"/>
            <%--        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
                   <%-- <asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate"  ControlStyle-Width="100">
                        <EditItemTemplate>
                            <asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:TextBox><cc1:CalendarExtender
                                ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" >
                            </cc1:CalendarExtender>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Claim Type" SortExpression="ClaimType" >
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData"
                                DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>
                    
                    
                    
                    <asp:TemplateField HeaderText="Claim Status" SortExpression="ClaimStatusTitle" ControlStyle-Width="150">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData"
                                DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        
                        
                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View" ControlStyle-ForeColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/info.png" Target="_blank"></asp:HyperLink></ItemTemplate>
                        <ControlStyle ForeColor="White" />
                    </asp:TemplateField>
                    <asp:CommandField  ShowEditButton="True" ButtonType="Image" 
                        EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                        UpdateImageUrl="~/Images/Grid/IconUpdate.gif" 
                        CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        
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
                <FooterStyle CssClass="FooterStyle1" />
                <PagerStyle CssClass="PagesStyle1" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle CssClass="HeaderStyle1" />
                <EditRowStyle BackColor="#FDFDFD" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Rejected Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') ORDER BY Claim.ClaimId DESC"
                
                
                UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ClaimTypesDropdownlist" Name="ClaimTypeDropdown"
                        PropertyName="SelectedValue" DefaultValue="1" />
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

                    <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                    <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                    <asp:Parameter Name="ClaimId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="4">
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="1" DataKeyNames="ClaimId" DataSourceID="SqlDataSource4"
                OnRowUpdated="GridView4_RowUpdated" EmptyDataText="There are no data records to display."
                ForeColor="#333333" GridLines="None" CssClass="GridView1" PageSize="40">
                <RowStyle CssClass="RowStyle1" />
                         <Columns>                
                  <asp:ButtonField HeaderText="" ItemStyle-Width="10">                  
                    <ItemStyle Width="10px" />
                    </asp:ButtonField>  
                 <asp:TemplateField HeaderText="Claim Ref" ItemStyle-Width="100" >
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" ReadOnly="True" runat="server" SortExpression="ClaimId" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" Text='<%# Bind("ClaimId") %>'></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" ReadOnly="true" ItemStyle-Width="220" >
                    <ControlStyle Width="150px" />
                    </asp:BoundField>
                           <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                        SortExpression="FirstName" ReadOnly="true" ItemStyle-Width="100" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" 
                        SortExpression="Surname" ReadOnly="true" ItemStyle-Width="100"  />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ReadOnly="true" ItemStyle-Width="110" />
                     <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" SortExpression="AccidentDate" ReadOnly="true"   dataformatstring="{0:dd-MMM-yyyy}" htmlencode="false" ItemStyle-Width="130"/>
            <%--        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
                   <%-- <asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate"  ControlStyle-Width="100">
                        <EditItemTemplate>
                            <asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:TextBox><cc1:CalendarExtender
                                ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" >
                            </cc1:CalendarExtender>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Claim Type" SortExpression="ClaimType" >
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData"
                                DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>
                    
                    
                    
                    <asp:TemplateField HeaderText="Claim Status" SortExpression="ClaimStatusTitle" ControlStyle-Width="150">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData"
                                DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        
                        
                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View" ControlStyle-ForeColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/info.png" Target="_blank"></asp:HyperLink></ItemTemplate>
                        <ControlStyle ForeColor="White" />
                    </asp:TemplateField>
                    <asp:CommandField  ShowEditButton="True" ButtonType="Image" 
                        EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                        UpdateImageUrl="~/Images/Grid/IconUpdate.gif" 
                        CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        
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
                <FooterStyle CssClass="FooterStyle1" />
                <PagerStyle CssClass="PagesStyle1" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle CssClass="HeaderStyle1" />
                <EditRowStyle BackColor="#FDFDFD" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Replacement Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') ORDER BY Claim.ClaimId DESC"
                
                
                UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" Name="ClaimTypeDropdown"
                        PropertyName="SelectedValue" />
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
                     <asp:Parameter Name="ClaimTypeID" Type="Int32" />
                    <asp:Parameter Name="ClaimStatusID" Type="Int32" />
                    <asp:Parameter Name="ClaimId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="5">
            <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="1" DataKeyNames="ClaimId" DataSourceID="SqlDataSource5"
                OnRowUpdated="GridView5_RowUpdated" EmptyDataText="There are no data records to display."
                ForeColor="#333333" GridLines="None" CssClass="GridView1" PageSize="40">
                <RowStyle CssClass="RowStyle1" />
                        <Columns>                
                  <asp:ButtonField HeaderText="" ItemStyle-Width="10">                  
                    <ItemStyle Width="10px" />
                    </asp:ButtonField>  
                 <asp:TemplateField HeaderText="Claim Ref" ItemStyle-Width="100" >
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" ReadOnly="True" runat="server" SortExpression="ClaimId" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>' ForeColor="GrayText" Text='<%# Bind("ClaimId") %>'></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:BoundField DataField="ClaimTitle" HeaderText="Claim Title" SortExpression="ClaimTitle" ReadOnly="true" ItemStyle-Width="220" >
                    <ControlStyle Width="150px" />
                    </asp:BoundField>
                           <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                        SortExpression="FirstName" ReadOnly="true" ItemStyle-Width="100" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" 
                        SortExpression="Surname" ReadOnly="true" ItemStyle-Width="100"  />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ReadOnly="true" ItemStyle-Width="110" />
                     <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date" SortExpression="AccidentDate" ReadOnly="true"   dataformatstring="{0:dd-MMM-yyyy}" htmlencode="false" ItemStyle-Width="130"/>
            <%--        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
                   <%-- <asp:TemplateField HeaderText="Accident Date" SortExpression="AccidentDate"  ControlStyle-Width="100">
                        <EditItemTemplate>
                            <asp:TextBox ID="AccidentDate" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:TextBox><cc1:CalendarExtender
                                ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="AccidentDate" >
                            </cc1:CalendarExtender>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("AccidentDate", "{0:dd/M/yyyy}")%>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Claim Type" SortExpression="ClaimType" >
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ClaimTypeData"
                                DataTextField="ClaimType" DataValueField="ClaimTypeID" SelectedValue='<%# Bind("ClaimTypeID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimType], [ClaimTypeID] FROM [ClaimTypes]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClaimType") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="100px" />
                    </asp:TemplateField>
                    
                    
                    
                    <asp:TemplateField HeaderText="Claim Status" SortExpression="ClaimStatusTitle" ControlStyle-Width="150">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ClaimStatusData"
                                DataTextField="ClaimStatusTitle" DataValueField="ClaimStatusID" SelectedValue='<%# Bind("ClaimStatusID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ClaimStatusData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [ClaimStatusID], [ClaimStatusTitle] FROM [ClaimStatus]">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        
                        
                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClaimStatusTitle") %>'></asp:Label></ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/AddClaim.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View" ControlStyle-ForeColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ClaimId", "~/ClaimSummary.aspx?ClaimId={0}") %>'
                                ForeColor="GrayText" ImageUrl="~/Images/info.png" Target="_blank"></asp:HyperLink></ItemTemplate>
                        <ControlStyle ForeColor="White" />
                    </asp:TemplateField>
                    <asp:CommandField  ShowEditButton="True" ButtonType="Image" 
                        EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                        UpdateImageUrl="~/Images/Grid/IconUpdate.gif" 
                        CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                        
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
                <FooterStyle CssClass="FooterStyle1" />
                <PagerStyle CssClass="PagesStyle1" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle CssClass="HeaderStyle1" />
                <EditRowStyle BackColor="#FDFDFD" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Claim] WHERE [ClaimId] = @ClaimId" InsertCommand="INSERT INTO [Claim] ([ClaimTitle], [DateCreated], [DateUpdated], [RefferedBy], [AccidentLocation], [AccidentDate], [AccidentInfo], [RoadCondition], [DriverPolicyNo], [WhotoBlame], [PoliceAttended], [PoliceOfficerName], [PoliceLogNo], [PoliceAddress], [VehicleRoadworthy], [DamageToVehcle], [AdditionalInfo], [AnyoneInjured], [PassengerClaims], [AnyWitnesses], [PreviousAccidents], [ClaimTypeID], [ClaimStatusID]) VALUES (@ClaimTitle, @DateCreated, @DateUpdated, @RefferedBy, @AccidentLocation, @AccidentDate, @AccidentInfo, @RoadCondition, @DriverPolicyNo, @WhotoBlame, @PoliceAttended, @PoliceOfficerName, @PoliceLogNo, @PoliceAddress, @VehicleRoadworthy, @DamageToVehcle, @AdditionalInfo, @AnyoneInjured, @PassengerClaims, @AnyWitnesses, @PreviousAccidents, @ClaimTypeID, @ClaimStatusID)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Claim.ClaimId, Claim.ClaimTitle, Claim.ClaimTypeID, Claim.AccidentDate, Claim.ClaimStatusID, ClaimTypes.ClaimType, ClaimStatus.ClaimStatusTitle, Contact.FirstName, Contact.Surname, Contact.Phone, Contact.Email, Claim.UserFee FROM Contact INNER JOIN ClaimTypes INNER JOIN Claim ON ClaimTypes.ClaimTypeID = Claim.ClaimTypeID INNER JOIN ClaimStatus ON Claim.ClaimStatusID = ClaimStatus.ClaimStatusID INNER JOIN ClaimContact ON Claim.ClaimId = ClaimContact.ClaimID ON Contact.ContactID = ClaimContact.ContactID WHERE (ClaimStatus.ClaimStatusTitle = 'Completed Claims') AND (Claim.ClaimTypeID = @ClaimTypeDropdown) AND (Contact.ContactTypeID = '7') ORDER BY Claim.ClaimId DESC"
                
                
                UpdateCommand="UPDATE Claim SET ClaimTypeID = @ClaimTypeID, ClaimStatusID = @ClaimStatusID WHERE (ClaimId = @ClaimId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ClaimTypesDropdownlist" DefaultValue="1" Name="ClaimTypeDropdown"
                        PropertyName="SelectedValue" />
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