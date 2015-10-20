<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="CreateNewUser.aspx.cs" Inherits="UC_LIVE.Security.CreateNewUser" %>
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
<div style="width:850px; margin-right:150px; margin-top:6px; background-color:White; clear:both; ">
	
		<div style="height:15px; background-color:#006699; width:850px; ">
		
              
            </div>
<div class="MainHeading">Create Users</div>
	<div style="
	     margin-left:30px;">
	
	
	<asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Height="181px" 
            Width="436px"  Font-Names="Verdana" Font-Size="10pt" BackColor="White" 
            LoginCreatedUser="False">
		<SideBarStyle BackColor="#CCCCCC" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
		<SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="#FFFFFF" />
		
		<NavigationButtonStyle BackColor="#FFFFFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
		<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Center" />
		<CreateUserButtonStyle BackColor="#FFFFFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
		<TitleTextStyle CssClass="headingbg"/>
		<StepStyle BorderWidth="0px"  />
		<WizardSteps>
			<asp:CreateUserWizardStep runat="server" />
			<asp:CompleteWizardStep runat="server" >
			
		        <ContentTemplate>
                    <table border="0" 
                        style="font-family:Verdana;font-size:100%;height:181px;width:436px;">
                        <tr>
                            <td align="center" class="style10" colspan="2">
                                Complete</td>
                        </tr>
                        <tr>
                            <td class="style9">
                                Your account has been successfully created.</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                            <%--    <asp:Button ID="ContinueButton" runat="server" BackColor="White" 
                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                    CausesValidation="False" CommandName="Continue" Font-Names="Verdana" 
                                    ForeColor="#284775" Text="Continue" ValidationGroup="CreateUserWizard1" />--%>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
			
		</WizardSteps>
	</asp:CreateUserWizard>
	
	</div>
		</div>
</asp:Content>
