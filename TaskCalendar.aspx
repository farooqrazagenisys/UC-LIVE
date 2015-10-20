<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TaskCalendar.aspx.cs" Inherits="UC_LIVE.TaskCalendar" %>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





    <telerik:RadScheduler ID="RadScheduler1" runat="server" 
        DataDescriptionField="TaskDescription" DataEndField="DateDue" 
        DataKeyField="TaskId" DataSourceID="TasksCalender" DataStartField="DateCreated" 
        DataSubjectField="TaskTitle" EnableDescriptionField="True" 
        Skin="Windows7" Height="700" Width="950" CssClass="FontStyle" Font-Size="Small">
    </telerik:RadScheduler>

    <asp:SqlDataSource ID="TasksCalender" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [TaskTitle], [TaskId], [TaskDescription], [DateCreated], [DateDue], [TaskStatusID], [TaskTypeID]  FROM [Tasks]"
        UpdateCommand="UPDATE Tasks SET TaskTitle = @TaskTitle, TaskDescription = @TaskDescription, DateCreated = @DateCreated,  DateDue = @DateDue,  TaskStatusID = @TaskStatusID WHERE (TaskId = @TaskId)"
         DeleteCommand="DELETE FROM [Tasks] WHERE [TaskId] = @TaskId" 
        InsertCommand="INSERT INTO [Tasks] ([TaskTitle], [TaskDescription], [DateCreated], [DateDue], [TaskStatusID]          
             ) VALUES(@TaskTitle, @TaskDescription, @DateCreated, @DateDue, @TaskStatusID)">
      
                <DeleteParameters>
                    <asp:Parameter Name="TaskId" Type="Int32" />
                </DeleteParameters>
                                <InsertParameters>
                    <asp:Parameter Name="TaskTitle" Type="String" />
                    <asp:Parameter Name="TaskDescription" Type="String" />
                    <asp:Parameter Name="DateCreated" Type="DateTime" />
                    <asp:Parameter Name="DateDue" Type="DateTime" />
                    <asp:Parameter Name="TaskStatusID" Type="String" />                      
                </InsertParameters>
         
                <UpdateParameters>
                    <asp:Parameter Name="TaskTitle" Type="String" />
                    <asp:Parameter Name="TaskDescription" Type="String" />
                    <asp:Parameter Name="DateCreated" Type="DateTime" />
                    <asp:Parameter Name="DateDue" Type="DateTime" />
                    <asp:Parameter Name="TaskStatusID" Type="String" />   
                     <asp:Parameter Name="TaskId" Type="String" />
                </UpdateParameters>
                
                
            </asp:SqlDataSource>
            
            

</asp:Content>
