<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

int pageSize = 5;
int totalUsers;
int totalPages;
int currentPage = 1;

public void Page_Load()
{
  if (!IsPostBack)
  {
    GetUsers();
  }
}

private void GetUsers()
{
  UsersOnlineLabel.Text = Membership.GetNumberOfUsersOnline().ToString();

  UserGrid.DataSource = Membership.GetAllUsers(currentPage-1, pageSize, out totalUsers);
  totalPages = ((totalUsers - 1) / pageSize) + 1;

  // Ensure that we do not navigate past the last page of users.

  if (currentPage > totalPages)
  {
    currentPage = totalPages;
    GetUsers();
    return;
  }

  UserGrid.DataBind();
  CurrentPageLabel.Text = currentPage.ToString();
  TotalPagesLabel.Text = totalPages.ToString();

  if (currentPage == totalPages)
    NextButton.Visible = false;
  else
    NextButton.Visible = true;

  if (currentPage == 1)
    PreviousButton.Visible = false;
  else
    PreviousButton.Visible = true;

  if (totalUsers <= 0)
    NavigationPanel.Visible = false;
  else
    NavigationPanel.Visible = true;
}

public void NextButton_OnClick(object sender, EventArgs args)
{
  currentPage = Convert.ToInt32(CurrentPageLabel.Text);
  currentPage++;
  GetUsers();
}

public void PreviousButton_OnClick(object sender, EventArgs args)
{
  currentPage = Convert.ToInt32(CurrentPageLabel.Text);
  currentPage--;
  GetUsers();
}

</script>
<html  >
<head>
<title>Sample: Find Users</title>
</head>
<body>

<form id="form1" runat="server">
  <h3>User List</h3>

  Number of Users Online: <asp:Label id="UsersOnlineLabel" runat="Server" /><br />

  <asp:Panel id="NavigationPanel" Visible="false" runat="server">
    <table border="0" cellpadding="3" cellspacing="3">
      <tr>
        <td style="width:100">Page <asp:Label id="CurrentPageLabel" runat="server" />
            of <asp:Label id="TotalPagesLabel" runat="server" /></td>
        <td style="width:60"><asp:LinkButton id="PreviousButton" Text="< Prev"
                            OnClick="PreviousButton_OnClick" runat="server" /></td>
        <td style="width:60"><asp:LinkButton id="NextButton" Text="Next >"
                            OnClick="NextButton_OnClick" runat="server" /></td>
      </tr>
    </table>
  </asp:Panel>

  <asp:DataGrid id="UserGrid" runat="server"  Gridlines="None" ForeColor="#333333" Height="166px" Width="157px" 
                      OnRowDataBound="GridView1_RowDataBound" 
              OnRowUpdated="GridView1_RowUpdated" 
              OnRowUpdating="GridView1_RowUpdating" 
              OnRowEditing="GridView1_RowEditing">
        
             
            
      <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
	  <EditItemStyle BackColor="#2461BF" />
	  <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
	  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
	  <AlternatingItemStyle BackColor="White" />
	  <ItemStyle BackColor="#EFF3FB" />
    <HeaderStyle BackColor="#507CD1" ForeColor="white" Font-Bold="True" />
  </asp:DataGrid>

</form>

</body>
</html>

