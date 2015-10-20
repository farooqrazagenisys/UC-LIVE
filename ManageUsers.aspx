<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true"
    CodeBehind="ManageUsers.aspx.cs" Inherits="UC_LIVE.ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script language="javascript" type="text/javascript">
        //--- For Checkbox in Gridview
        function SelectAll(id) {
            var frm = document.forms[0];

            for (i = 0; i < frm.elements.length; i++) {
                if (frm.elements[i].type == "checkbox") {
                    frm.elements[i].checked = document.getElementById(id).checked;

                }
            }

        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-right: 100px; margin-top: 64px; width: 850px; height: 460px;">
        <div style="width: 850px; margin-top: -25px; background-color: White; clear: both;">
            <div style="height: 15px; background-color: #006699; width: 850px;">
            </div>
            <div class="MainHeading">
                View Users</div>
               
            <div style="margin-left: 0px; font-family:Microsoft Sans Serif;">
                <div style="font-size: 12px; margin-left: 20px;">
                    <b>The total registered users are:
                        <asp:Literal ID="lblTotalUsers" runat="server"></asp:Literal><br />
                        <br />
                        The total online users at this moment:
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
                    <br />
                    Use the below feature to search users by partial username or e-mail:<br />
                    <br />
                    <%--<div id="DivUserName" runat="server"></div>--%>
                    <div style="padding-left: 5px; padding-right: 5px; float: left;">
                        <asp:DropDownList ID="ddlUserSearchTypes" runat="server" Style="position: static">
                            <asp:ListItem Selected="true" Text="UserName"></asp:ListItem>
                            <asp:ListItem Text="E-mail"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="padding-left: 5px; padding-right: 5px; float: left;">
                        Contains</div>
                    <div style="padding-left: 5px; padding-right: 5px; float: left;">
                        <asp:TextBox ID="txtSearchText" runat="server" Style="position: static"></asp:TextBox><br />
                    </div>
                    <div style="padding-left: 5px; padding-right: 5px; float: left;">
                        <asp:Button ID="btnSearch" runat="server" Font-Bold="True" OnClick="btnSearch_Click"
                            Style="position: static" Text="Search" BackColor="White" BorderColor="#507CD1"
                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Times New Roman" Font-Size="10.5pt"
                            ForeColor="#284E98" /></div>
                 
                    <br />  <br />  <br />
                    <div style="margin-left:10px;">
                    <asp:Button ID="btn_Delete" runat="server" CssClass="SubmitBtn" Font-Bold="True"
                        OnClick="btn_Delete_Click" Style="position: static" Text="Delete Selected" BackColor="White"
                        BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Times New Roman"
                        Font-Size="10.5pt" ForeColor="#284E98" /></div><br />
                   
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="#FF0000" Style="position: static"
                        Width="211px"></asp:Label>
                    <br />
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CellPadding="1"
                        DataKeyNames="UserName" ForeColor="#333333" GridLines="None" OnDataBound="gvUsers_DataBound"
                        OnRowDataBound="gvUsers_RowDataBound" Style="position: static" Height="83px"
                        Width="750px" CssClass="GridView1">
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
                            <asp:BoundField DataField="Email" HeaderText="Email" DataFormatString="<a href=mailto:{0}>{0}</a>"
                                HtmlEncode="False" />
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
                            <%--  <asp:BoundField DataField="IsApproved" HeaderText="Is Approved" />--%>
                            <asp:TemplateField HeaderText="UserName">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("UserName") %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("UserName", "EditUser.aspx?UserName={0}") %>'
                                        Text='Update Section'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            No users found.
                        </EmptyDataTemplate>
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        <EditRowStyle BackColor="#FDFDFD" />
                        <FooterStyle CssClass="FooterStyle1" />
                        <HeaderStyle CssClass="HeaderStyle1" />
                        <PagerStyle CssClass="PagesStyle1" />
                        <RowStyle CssClass="RowStyle1" />
                    </asp:GridView>
                
                </div>
            </div>
        </div>
    </div>
</asp:Content>
