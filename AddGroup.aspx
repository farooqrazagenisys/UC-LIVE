<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="AddGroup.aspx.cs" Inherits="UC_LIVE.AddGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: White;">
        <div class="MainHeading">
            Add Group
        </div>
        <table style="width: 905px; margin-left: 20px; background-color: #EEE" class="style8">
            <tr>
                <td style="padding-left: 12px; width: 110px;">
                    Choose Category
                </td>
                <td style="width: 140px;">
                    <asp:DropDownList ID="CategoryDropDown" runat="server" AutoPostBack="True" DataSourceID="CategoryDataSource"
                        DataTextField="VehicleCategory" DataValueField="CategroyId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="CategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [CategroyId], [VehicleCategory] FROM [VehicleCategory]">
                    </asp:SqlDataSource>
                </td>
                <td style="width: 100px;">
                    <asp:Button ID="AddGroupButton" runat="server" Text="Add Group" OnClick="AddGroupButton_Click" />
                </td>
                <td>
                    <asp:Button ID="AddCategory" runat="server" Text="Add Category" OnClick="AddCategory_Click" />
                </td>
            </tr>
        </table>
        <div style="margin-left: 20px; margin-top: 10px;">
            <div style="width: 800px; float: left;">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="1" DataKeyNames="VehicleGroupId" DataSourceID="SqlDataSource1"
                    EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
                    CssClass="GridView1" Height="44px" Width="900px" PageSize="40">
                    <Columns>
                        <asp:ButtonField HeaderText="" ItemStyle-Width="20" >
<ItemStyle Width="20px"></ItemStyle>
                        </asp:ButtonField>
                       <%-- <asp:BoundField DataField="VehicleGroupId" HeaderText="Group ID" ReadOnly="True"
                            SortExpression="VehicleGroupId" ItemStyle-Width="90" >
<ItemStyle Width="90px"></ItemStyle>
                        </asp:BoundField>--%>
                        <asp:BoundField DataField="VehicleGroupTitle" HeaderText="Title" SortExpression="VehicleGroupTitle"
                            ItemStyle-Width="90" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="GroupDailyRate" HeaderText="Rate" SortExpression="GroupDailyRate"
                            ItemStyle-Width="90" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="SampleVehicle" HeaderText="Sample Vehicles" SortExpression="SampleVehicle"
                            ItemStyle-Width="0" ControlStyle-Width="500" >

<ItemStyle Width="700px"></ItemStyle>
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png"
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
                    DeleteCommand="DELETE FROM [VehicleGroup] WHERE [VehicleGroupId] = @VehicleGroupId"
                    InsertCommand="INSERT INTO [VehicleGroup]  ([VehicleGroupTitle],[SampleVehicle], [GroupDailyRate], [VehicleCategoryID]) VALUES (@VehicleGroupTitle, @SampleVehicle, @GroupDailyRate, @VehicleCategoryID)"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    SelectCommand="SELECT [VehicleGroupId], [SampleVehicle],[VehicleGroupTitle], [GroupDailyRate], [VehicleCategoryID] FROM [VehicleGroup] where [VehicleCategoryID]= @VehicleCategoryID order by VehicleGroupID desc "
                    UpdateCommand="UPDATE [VehicleGroup] SET [VehicleGroupTitle] = @VehicleGroupTitle, [SampleVehicle] = @SampleVehicle, [GroupDailyRate] = @GroupDailyRate WHERE [VehicleGroupId] = @VehicleGroupId">
                    <DeleteParameters>
                        <asp:Parameter Name="VehicleGroupId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="VehicleGroupTitle" Type="String" />
                        <asp:Parameter Name="GroupDailyRate" Type="String" />
                        <asp:Parameter Name="VehicleCategoryID" Type="Int32" />
                        <asp:Parameter Name="SampleVehicle" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="VehicleGroupTitle" Type="String" />
                        <asp:Parameter Name="GroupDailyRate" Type="String" />
                        <asp:Parameter Name="VehicleGroupId" Type="Int32" />
                        <asp:Parameter Name="SampleVehicle" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CategoryDropDown" Name="VehicleCategoryID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </div>
            <div style="width: 300px; float: left;">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="1" DataKeyNames="CategroyId" DataSourceID="SqlDataSource2"
                    EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
                    CssClass="GridView1" Height="123px" Width="450px">
                    <Columns>
                        <asp:ButtonField HeaderText="" ItemStyle-Width="20" />
                        <asp:BoundField DataField="CategroyId" HeaderText="Category ID" ReadOnly="True" SortExpression="CategroyId" />
                        <asp:BoundField DataField="VehicleCategory" HeaderText="Category Title" SortExpression="VehicleCategory" />
                        <asp:CommandField ShowEditButton="True" ButtonType="Image" EditImageUrl="~/Images/Grid/IconEdit.png"
                            DeleteImageUrl="~/Images/Grid/IconDelete.png" UpdateImageUrl="~/Images/Grid/IconUpdate.gif"
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [VehicleCategory] WHERE [CategroyId] = @CategroyId"
                    InsertCommand="INSERT INTO [VehicleCategory] ([CategroyId], [VehicleCategory]) VALUES (@CategroyId, @VehicleCategory)"
                    ProviderName="<%$ ConnectionStrings:UC_LIVE.Properties.Settings.ConnectionString.ProviderName %>"
                    SelectCommand="SELECT [CategroyId], [VehicleCategory] FROM [VehicleCategory] order by CategroyId desc"
                    UpdateCommand="UPDATE [VehicleCategory] SET [VehicleCategory] = @VehicleCategory WHERE [CategroyId] = @CategroyId">
                    <DeleteParameters>
                        <asp:Parameter Name="CategroyId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CategroyId" Type="Int32" />
                        <asp:Parameter Name="VehicleCategory" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="VehicleCategory" Type="String" />
                        <asp:Parameter Name="CategroyId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
</asp:Content>
