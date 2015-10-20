<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="AddVehicles.aspx.cs" Inherits="UC_LIVE.AddVehicles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: White;">
        <div class="MainHeading">
            Manage Vehicles
        </div>
        <table style="width: 905px; margin-left: 20px; background-color: #EEE" class="style8">
            <tr>
                <td style="padding-left: 12px; width: 180px;">
                    <asp:DropDownList ID="CategoryDropDown" runat="server" AutoPostBack="True" DataSourceID="DataVehicleCategory"
                        DataTextField="VehicleCategory" DataValueField="CategroyId" 
                        onselectedindexchanged="CategoryDropDown_SelectedIndexChanged" ondatabound="DropdownCategory_DataBound">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DataVehicleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [VehicleCategory], [CategroyId] FROM [VehicleCategory]">
                    </asp:SqlDataSource>
                </td>
                <td style="width: 180px;">
                    <asp:DropDownList ID="GroupDropDown1" runat="server" AutoPostBack="True" DataSourceID="DataVehicleGroup"
                        DataTextField="VehicleGroupTitle" DataValueField="VehicleGroupId" 
                        onselectedindexchanged="GroupDropDown1_SelectedIndexChanged" ondatabound="DropdownGroupType_DataBound">

                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DataVehicleGroup" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [VehicleGroupId], [VehicleGroupTitle] FROM [VehicleGroup] WHERE ([VehicleCategoryID] = @VehicleCategoryID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CategoryDropDown" Name="VehicleCategoryID" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td style="padding-top: 15px;">
                    <asp:Button ID="AddVehicle" runat="server" Text="Add Vehicle" OnClick="AddVehicle_Click" />
                </td>
            </tr>
            <tr>
                <td style="height: 5px;">
                </td>
            </tr>
        </table>
        <div style="margin-left: 16px; margin-top: 10px;">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="1" DataKeyNames="VehicleId" DataSourceID="SqlDataSource1"
                EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
                CssClass="GridView1" Height="16px" Width="903px" PageSize="20">
                
                <Columns>
                           
                          <asp:ButtonField Text="" />
                           
                    <asp:BoundField DataField="VehicleMake" HeaderText="Vehicle Make" 
                        SortExpression="VehicleMake" />
                    <asp:BoundField DataField="VehicleModel" HeaderText="Vehicle Model" 
                        SortExpression="VehicleModel" />
                    <asp:BoundField DataField="VehicleTransmission" 
                        HeaderText="Vehicle Transmission" SortExpression="VehicleTransmission" />
                    <asp:BoundField DataField="Bodyshape" HeaderText="Bodyshape" 
                        SortExpression="Bodyshape" />
                    <asp:BoundField DataField="VehicleEngine" HeaderText="Vehicle Engine" 
                        SortExpression="VehicleEngine" />
                    <asp:BoundField DataField="VehicleReg" HeaderText="Vehicle Reg" 
                        SortExpression="VehicleReg" />          
               <asp:CommandField  ShowEditButton="True" ButtonType="Image"
                        EditImageUrl="~/Images/Grid/IconEdit.png" DeleteImageUrl="~/Images/Grid/IconDelete.png"
                        UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
                        CancelImageUrl="~/Images/Grid/IconCancel.gif" />
                               <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:ImageButton ID="lnkDelete" Text="Delete" ImageUrl="~/Images/Grid/IconDelete.png"
                                    runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('You are about to delete a record, Are you sure?');">
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
                DeleteCommand="DELETE FROM [Vehicle] WHERE [VehicleId] = @VehicleId" InsertCommand="INSERT INTO [Vehicle] ([VehicleId], [VehicleMake], [VehicleModel], [VehicleReg], [InsuranceCompany], [InsurancePolicyNo], [InsranceCompanyId], [SampleVehicles], [VehicleOwnerId], [ClaimId], [VehicleGroupId],[VehicleType] ) VALUES (@VehicleId, @VehicleMake, @VehicleModel, @VehicleReg, @InsuranceCompany, @InsurancePolicyNo, @InsranceCompanyId, @SampleVehicles, @VehicleOwnerId, @ClaimId, @VehicleGroupId, 'CourtesyCar')"
                ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                SelectCommand="SELECT VehicleId, VehicleMake, VehicleModel, VehicleTransmission,Bodyshape,VehicleEngine, VehicleReg, InsuranceCompany, InsurancePolicyNo, InsranceCompanyId, SampleVehicles, VehicleOwnerId FROM Vehicle WHERE (VehicleGroupId = @VehicleGroupID) ORDER BY VehicleId DESC"
                
                UpdateCommand="UPDATE [Vehicle] SET [VehicleMake] = @VehicleMake, [Bodyshape] = @Bodyshape,[VehicleEngine] = @VehicleEngine,[VehicleTransmission] = @VehicleTransmission, [VehicleModel] = @VehicleModel, [VehicleReg] = @VehicleReg, [InsuranceCompany] = @InsuranceCompany, [InsurancePolicyNo] = @InsurancePolicyNo, [InsranceCompanyId] = @InsranceCompanyId, [SampleVehicles] = @SampleVehicles, [VehicleOwnerId] = @VehicleOwnerId WHERE [VehicleId] = @VehicleId">
                <DeleteParameters>
                    <asp:Parameter Name="VehicleId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="VehicleId" Type="Int32" />
                    <asp:Parameter Name="VehicleMake" Type="String" />
                    <asp:Parameter Name="VehicleModel" Type="String" />
                    <asp:Parameter Name="VehicleReg" Type="String" />
                    <asp:Parameter Name="InsuranceCompany" Type="String" />
                    <asp:Parameter Name="InsurancePolicyNo" Type="String" />
                    <asp:Parameter Name="InsranceCompanyId" Type="String" />
                    <asp:Parameter Name="SampleVehicles" Type="String" />
                      <asp:Parameter Name="Bodyshape" Type="String" />
                    <asp:Parameter Name="VehicleTransmission" Type="String" />
                    <asp:Parameter Name="VehicleEngine" Type="String" />
                    <asp:Parameter Name="VehicleOwnerId" Type="String" />
                    <asp:Parameter Name="ClaimId" Type="String" />
                    <asp:Parameter Name="VehicleGroupId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="VehicleMake" Type="String" />
                    <asp:Parameter Name="VehicleModel" Type="String" />
                    <asp:Parameter Name="VehicleReg" Type="String" />
                    <asp:Parameter Name="InsuranceCompany" Type="String" />
                    <asp:Parameter Name="InsurancePolicyNo" Type="String" />
                    <asp:Parameter Name="InsranceCompanyId" Type="String" />
                    <asp:Parameter Name="SampleVehicles" Type="String" />
                    <asp:Parameter Name="VehicleOwnerId" Type="String" />
                    <asp:Parameter Name="VehicleId" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GroupDropDown1" Name="VehicleGroupID" 
                        PropertyName="SelectedValue" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
