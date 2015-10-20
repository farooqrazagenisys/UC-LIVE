<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewTaskList.ascx.cs" Inherits="UC_LIVE.Controls.ViewTaskList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
<link href="../Styles/tabs.css" rel="stylesheet" type="text/css" />
<style>
input[type="text"], textarea, select, checkboxes, input[type="password"]
{
    font-family: Arial, Sans-Serif;
    font-size: 13px;
    margin-bottom: 2px;
    display: block;
    padding: 4px;
    border: solid 1px #CCCCCC; 
    width: 100px; 
    background-image:url(../Images/inputfield_bg.png);
    margin-right:20px;
    margin-top:2px;
    background-repeat:repeat-x;
    font-weight:bold;
} 
</style>
<div style="Height:222px; border:1px solid #dfe9f5;">
 <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" MultiPageID="RadMultiPage1"
                SelectedIndex="0">
                <Tabs>
                    <telerik:RadTab Text="Tasks / Appointments" runat="server" TabIndex="0">
                    </telerik:RadTab>
                    
            
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="bodytext">
            <telerik:RadPageView ID="TasksView" runat="server" TabIndex="0">
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TaskId" CssClass="GridView1" GridLines="None" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" Width="425px" PageSize="4">
				<EditRowStyle BackColor="#FDFDFD" />
				<AlternatingRowStyle CssClass="AlternatingRowStyle" />
				<FooterStyle CssClass="FooterStyle1" />
				<HeaderStyle CssClass="HeaderStyle1" />
				<PagerStyle CssClass="PagesStyle1" />
				<RowStyle CssClass="RowStyle1" />
				<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
				<Columns>
					<asp:ButtonField ItemStyle-Width="30" />
					<asp:BoundField DataField="TaskTitle" HeaderText="Task Title" SortExpression="TaskTitle" ItemStyle-CssClass="Column50" />
					<asp:BoundField DataField="DateDue" HeaderText="Date Due" SortExpression="DateDue" ItemStyle-CssClass="Column50" DataFormatString="{0:dd-MM-yyyy}" />
				
					<%--<asp:BoundField DataField="TaskStatusID" HeaderText="Status" SortExpression="TaskStatusID" ItemStyle-CssClass="Column50" />--%>
	
				
				       <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink ID="EditTasksLink" runat="server" NavigateUrl="~/TaskCalendar.aspx"
                                ForeColor="GrayText" ImageUrl="~/Images/UpdateIcon.png"></asp:HyperLink></ItemTemplate>
                    </asp:TemplateField>
                    
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
			</asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Tasks] WHERE [TaskId] = @TaskId" InsertCommand="INSERT INTO [Tasks] ([TaskTitle], [TaskDescription], [DateCreated], [DateUpdated], [DateDue], [ReminderDate], [TaskStatusID], [TaskTypeID]) VALUES (@TaskTitle, @TaskDescription, @DateCreated, @DateUpdated, @DateDue, @ReminderDate, @TaskStatusID, @TaskTypeID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Tasks.TaskId, Tasks.TaskTitle, Tasks.TaskDescription, Tasks.DateCreated, Tasks.DateUpdated, Tasks.IsDeleted, Tasks.DateDue, Tasks.ReminderDate, Tasks.TaskStatusID FROM Tasks order by TaskID desc" UpdateCommand="UPDATE [Tasks] SET [TaskTitle] = @TaskTitle, [TaskDescription] = @TaskDescription, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated, [DateDue] = @DateDue, [ReminderDate] = @ReminderDate, [TaskStatusID] = @TaskStatusID, [TaskTypeID] = @TaskTypeID WHERE [TaskId] = @TaskId">
				<DeleteParameters>
					<asp:Parameter Name="TaskId" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="TaskTitle" Type="String" />
					<asp:Parameter Name="TaskDescription" Type="String" />
					<asp:Parameter Name="DateCreated" Type="DateTime" />
					<asp:Parameter Name="DateUpdated" Type="DateTime" />
					<asp:Parameter Name="DateDue" Type="DateTime" />
					<asp:Parameter Name="ReminderDate" Type="DateTime" />
					<asp:Parameter Name="TaskStatusID" Type="Int32" />
					<asp:Parameter Name="TaskTypeID" Type="Int32" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="TaskTitle" Type="String" />
					<asp:Parameter Name="TaskDescription" Type="String" />
					<asp:Parameter Name="DateCreated" Type="DateTime" />
					<asp:Parameter Name="DateUpdated" Type="DateTime" />
					<asp:Parameter Name="DateDue" Type="DateTime" />
					<asp:Parameter Name="ReminderDate" Type="DateTime" />
					<asp:Parameter Name="TaskStatusID" Type="Int32" />
					<asp:Parameter Name="TaskTypeID" Type="Int32" />
					<asp:Parameter Name="TaskId" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
            
            </telerik:RadPageView>
           
            
             </telerik:RadMultiPage>

</div>

<%--<cc1:TabContainer ID="DisplayTasks" runat="server" ActiveTabIndex="0" Width="465" Height="232" CssClass="ajax__tab_lightblue-theme">

	<cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel2">
		<HeaderTemplate>
			Notes
		
		
</HeaderTemplate>
		
<ContentTemplate>
		
		
		
</ContentTemplate>
	
</cc1:TabPanel>
	<cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel3">
		<HeaderTemplate>
			Appointments
		
		
</HeaderTemplate>
		
<ContentTemplate>
			
		
		
</ContentTemplate>
	
</cc1:TabPanel>
</cc1:TabContainer>--%>