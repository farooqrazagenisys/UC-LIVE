<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="users1.aspx.cs" Inherits="UC_LIVE.users1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 673px; width: 555px">
    <script language="javascript" type="text/javascript">
     //--- For Checkbox in Gridview
function SelectAll(id)
      {
       var frm = document.forms[0];
            
            for (i=0;i<frm.elements.length;i++)
            {
                if (frm.elements[i].type =="checkbox")
                {
           frm.elements[i].checked = document.getElementById(id).checked;
           
                }
            }

        }
</script>

    <strong><span style="font-size: 11pt; color: #0066ff">Users Account Management</span></strong><p>
    </p>
    <b>- The total registered users is:
        <asp:Literal ID="lblTotalUsers" runat="server"></asp:Literal><br />
        <br />
        - The total online users at this moment:
        <asp:Literal ID="lblOnlineUsers" runat="server"></asp:Literal></b>
    <p>
    </p>
    In order to display all users whose name begins with letter click on the link letter:
    <p>
    </p>
    <asp:Repeater ID="rptAlphabetBar" runat="server" OnItemCommand="rptAlphabetBar_ItemCommand">
        <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Container.DataItem %>'
                Text='<%# Container.DataItem %>'></asp:LinkButton>
             
        </ItemTemplate>
    </asp:Repeater>
    <p>
    </p>
    Use the below feature to search users by partial username or e-mail:
    <p>
    </p>
    <asp:DropDownList ID="ddlUserSearchTypes" runat="server" Style="position: static">
        <asp:ListItem Selected="true" Text="UserName"></asp:ListItem>
        <asp:ListItem Text="E-mail"></asp:ListItem>
    </asp:DropDownList>
    contains
    <asp:TextBox ID="txtSearchText" runat="server" Style="position: static"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Font-Bold="True" OnClick="btnSearch_Click"
        Style="position: static" Text="Search" BackColor="White" BorderColor="#507CD1"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Times New Roman"
        Font-Size="10.5pt" ForeColor="#284E98"/>
    <br />
    <br />
    <br />
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="UserName" ForeColor="#333333"
        GridLines="None" OnDataBound="gvUsers_DataBound" OnRowDataBound="gvUsers_RowDataBound" Style="position: static">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="cbxAll" runat="server" Style="position: static" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="cbxId" runat="server" Style="position: static" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="Email" DataFormatString="<a href=mailto:{0}>{0}</a>" HtmlEncode="False" />
            <asp:TemplateField HeaderText="Created">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CreationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CreationDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last activity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("LastActivityDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastActivityDate",  "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="IsApproved" HeaderText="Is Approved" />
            <asp:TemplateField HeaderText="UserName1">
                     <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("UserName", "EditEmail.aspx?UserName={0}") %>' 
                        Text='<%# Eval("UserName") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
		
			

                   


                    </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EmptyDataTemplate>
            No users found. 
        </EmptyDataTemplate>
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <br />
    <asp:Button ID="btn_Delete" runat="server" CssClass="SubmitBtn" Font-Bold="True"
        OnClick="btn_Delete_Click" Style="position: static" Text="Delete Selected" BackColor="White" BorderColor="#507CD1"
                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Times New Roman"
                            Font-Size="10.5pt" ForeColor="#284E98"/><br />
    <br />
    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="#FF0000" Style="position: static"
        Width="211px"></asp:Label>
  
  
  
    </div>
    </form>
</body>
</html>
