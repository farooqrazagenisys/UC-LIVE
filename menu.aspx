new<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="UC_LIVE.menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
	<style>.level1
{
    color: White;
    background-color: Black;
    font-variant: small-caps;
    font-size: large;
    font-weight: bold;
}

.level2
{
    color: Blue;
    font-family: Gill Sans MT !important;
    font-size: medium;
    background-color: Gray;
}

.level3
{
    color: black;
    background-color: Silver;
    font-family: Gill Sans MT !important;
    font-size: small;
}

.hoverstyle
{
    font-weight: bold;
}
       
.sublevel1
{
    background-color: Gray !important;
    color: White !important;
    font-variant: small-caps;
}  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<p>


		&nbsp;</p>
	<p>


		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TaskId" CssClass="GridView1"
		DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" Height="124px" Width="317px" CellPadding="1" ForeColor="#333333" GridLines="None">
		<EditRowStyle BackColor="#999999" />

			<FooterStyle CssClass="FooterStyle1" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
			<HeaderStyle CssClass="HeaderStyle1" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
			<PagerStyle CssClass="PagesStyle1" BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
			<RowStyle CssClass="RowStyle1" BackColor="#F7F6F3" ForeColor="#333333" />

<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
			<Columns>
				<asp:BoundField DataField="TaskTitle" HeaderText="TaskTitle" SortExpression="TaskTitle" />
				<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
				<asp:TemplateField HeaderText="DateDue" SortExpression="DateDue">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateDue") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("DateDue") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:BoundField DataField="TaskStatusID" HeaderText="TaskStatusID" SortExpression="TaskStatusID" />
			</Columns>
			<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		</asp:GridView>
		
		
		
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Tasks] WHERE [TaskId] = @TaskId" InsertCommand="INSERT INTO [Tasks] ([TaskTitle], [TaskDescription], [DateCreated], [DateUpdated], [DateDue], [ReminderDate], [TaskStatusID], [TaskTypeID]) VALUES (@TaskTitle, @TaskDescription, @DateCreated, @DateUpdated, @DateDue, @ReminderDate, @TaskStatusID, @TaskTypeID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Tasks.TaskId, Tasks.TaskTitle, Tasks.TaskDescription, Tasks.DateCreated, Tasks.DateUpdated, Tasks.IsDeleted, Tasks.DateDue, Tasks.ReminderDate, Tasks.TaskStatusID FROM Tasks INNER JOIN TaskType ON Tasks.TaskTypeID = TaskType.TaskTypeID WHERE (TaskType.TaskTypeTitle = 'tasks')" UpdateCommand="UPDATE [Tasks] SET [TaskTitle] = @TaskTitle, [TaskDescription] = @TaskDescription, [DateCreated] = @DateCreated, [DateUpdated] = @DateUpdated, [DateDue] = @DateDue, [ReminderDate] = @ReminderDate, [TaskStatusID] = @TaskStatusID, [TaskTypeID] = @TaskTypeID WHERE [TaskId] = @TaskId">
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
	</p>
</asp:Content>
