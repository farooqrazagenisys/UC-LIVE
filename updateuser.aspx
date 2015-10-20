<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateuser.aspx.cs" Inherits="UC_LIVE.updateuser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <strong><span style="color: #0066ff">Update User Account:-</span></strong><br />
    </span>
    <br />
    <table id="table1" runat="server" border="1" bordercolor="blue" style="width: 322px;
        position: static" visible="true">
        <tr>
            <td style="width: 203px">
                <strong>User Name:</strong></td>
            <td>
                <asp:Label ID="UsernameLabel" runat="server" Font-Bold="True"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 203px">
                <strong>Email:</strong></td>
            <td>
                <asp:TextBox ID="EmailText" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 203px">
                <strong>Password :</strong></td>
            <td>
                <asp:Label ID="lblPassword" runat="server" Font-Bold="True" Style="position: static"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 203px">
                <strong>Comment:</strong></td>
            <td>
                <asp:TextBox ID="CommentTextBox" runat="server" TextMode="multiline"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 203px">
                <asp:CheckBox ID="IsApprovedCheck" runat="server" Font-Bold="True" Text="Is Approved"
                    Width="105px" />
            </td>
            <td>
                <asp:CheckBox ID="IsLockedOutCheck" runat="Server" Font-Bold="True" Text="Locked Out" />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 28px; text-align: center">
                <asp:Button ID="btn_Update" runat="server" CssClass="SubmitBtn" Font-Bold="True"
                    OnClick="Button1_Click" Text="Update" Width="106px" /></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
