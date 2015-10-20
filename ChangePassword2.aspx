<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="ChangePassword2.aspx.cs" Inherits="UC_LIVE.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <style type="text/css">
        .style9
        {
            height: 34px;
        }
        .style10
        {
            color: Black;
            font-size: 14px;
            font-weight: bold;
            font-style: normal;
            font-family: Microsoft Sans Serif;
            padding-top: 0px;
            text-align: left;
            margin-bottom: 10px;
            height: 6px;
            background-repeat: repeat-x;
            padding-left: 5px;
            padding-right: 5px;
            padding-bottom: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<div style="width:950px; margin-left:20px; margin-top:8px; background-color:White; clear:both; ">
	
		<div style="height:15px; background-color:#006699; width:950px; ">
		
              
            </div>
<div class="MainHeading">Change Your Password</div>
	<div style="
	     margin-left:25px; font-family:Verdana; font-size:14px; padding:10px; ">
	<asp:ChangePassword ID="ChangePassword2" runat="server" Height="201px" Width="543px" ContinueButtonText="" TitleTextStyle-ForeColor="White" PasswordLabelText="Old Password: " TextBoxStyle-Width="150" >
	
	</asp:ChangePassword>
	
	</div>
	</div>
</asp:Content>
