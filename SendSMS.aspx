<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SendSMS.aspx.cs" Inherits="UC_LIVE.SendSMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 950px; background-color: White;">
        <div style="margin-left: 18px; font-family: Microsoft Sans Serif; font-size: 12px;">
            <div class="MainHeading">Send SMS Message</div>
            
            <div id="messageid" runat="server" ></div>
            <div style="margin-left: 30px;">
                <table style="height: 49px; width: 284px">
                    <tr>
                        <td>
                            To<br />
                            <asp:TextBox ID="ToTextBox" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            From<br />
                            <asp:TextBox ID="From" runat="server" Text="UC Live"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                Message
                <asp:TextBox ID="SMSText" runat="server" TextMode="MultiLine" Height="132px" Width="575px"></asp:TextBox>
                <br />
            </div>
            <div style="padding-left: 30px; float:left">
                <asp:Button ID="SendMessage" runat="server" Text="Send Message" OnClick="SendMessage_Click" />
            </div>
             <div style="padding-left: 30px; float:left">
                <asp:Button ID="Button1" Text="Cancel" runat="server" onclick="Button1_Click" />
			    <br />
                <br />            </div>
        </div>
    </div>
</asp:Content>
