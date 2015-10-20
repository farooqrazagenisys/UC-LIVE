<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="UC_LIVE.EditUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

	<style type="text/css">
		.style1
		{
			width: 142px;
		}
	</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div style=" margin-right:50px; width: 895px; height: 460px;">
<div style=" margin-top:32px;    width: 850px; height: 460px;">
    
<div style="width:850px;  margin-top:-25px; background-color:White; clear:both; ">
<div style="height:15px; background-color:#006699; width:850px; " class="style8">

</div>
 <div class="MainHeading" >Update User Details</div>
   <asp:Label id="Msg" ForeColor="maroon" runat="server" style="margin-left:25px;"  /><br /><br />

  <table cellpadding="3" border="0" style="margin-left:25px; background-color:White;" class="style8">
    <tr>
      <td>E-mail Address: </td>
      
     <div id="UsernameValue" runat="server" class="style8"></div>
                            
      
      <td><asp:TextBox id="EmailTextBox" MaxLength="128" Columns="30" runat="server" /></td>
      
                                     <td class="style1">
                                     <asp:Button id="UpdateEmailButton" Text="Update E-mail" OnClick="UpdateEmailButton_OnClick" runat="server" />
                                     </td>
                                     <td class="style1"><asp:RequiredFieldValidator id="EmailRequiredValidator" runat="server"
                                    ControlToValidate="EmailTextBox" ForeColor="red"
                                    Display="Static" ErrorMessage="Required" /></td>    </tr>
    
        <tr>
      <td>Choose Group:</td>
      <td>
		  <asp:DropDownList ID="RoleDropDown" runat="server">
			<asp:ListItem Text="Administrator" Value="Administrator"></asp:ListItem>
			<asp:ListItem Text="Staff" Value="Staff"></asp:ListItem>		
			<asp:ListItem Text="Agent" Value="Agent"></asp:ListItem>
			<asp:ListItem Text="Branch" Value="Branch"></asp:ListItem>
			<asp:ListItem Text="Guest" Value="Guest"></asp:ListItem>
			<asp:ListItem Text="Claims Manager" Value="Claims Manager"></asp:ListItem>
				

		  </asp:DropDownList>
      </td>
      
      
      
      
      
      
      <td class="style1">
		  <asp:Button ID="Button1" runat="server" Text="Update Role" onclick="Button1_Click" Height="26px" Width="124px" />
      </td>
    </tr>
    
    <tr>
    
      <td>Authorized Delete:</td>
    <td>
    
    	  <asp:DropDownList ID="ChooseDelete" runat="server">
    	  	<asp:ListItem Text="select" Value="select"></asp:ListItem>
    	  	<asp:ListItem Text="No" Value="No"></asp:ListItem>
			<asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
		
				

		  </asp:DropDownList>
		  
		  
     
    </td>
    
    <td>
             <asp:Button ID="Button2" runat="server" Text="Update Delete"  onclick="Delete_Click"  Height="26px" Width="124px" />
    </td>
    
    
    </tr>
    
    
    <tr>
      <td></td>
      <td></td>
    </tr>
  </table>
  </div>
  </div>
    </div>
</asp:Content>