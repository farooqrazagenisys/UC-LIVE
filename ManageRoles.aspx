<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="UC_LIVE.ManageRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	

	<div style="margin-right:100px; margin-top:64px;    width: 850px; height: 460px;">
    
 

<div style="width:850px;  margin-top:-25px; background-color:White; clear:both; ">
<div style="height:15px; background-color:#006699; width:850px; ">
		
              
            </div>
 <div class="MainHeading">User Roles</div>
    	<div style="
	     margin-left:15px;">
  <asp:Label id="Msg" ForeColor="maroon" runat="server" />
 <%--<div class="style8"> Role name:</div> 

  <asp:TextBox id="RoleTextBox" runat="server" />



  <asp:Button Text="Create Role" id="CreateRoleButton"
              runat="server" OnClick="CreateRole_OnClick" />


  <div style="width: 654px;  margin-top:10px;">--%>
  <asp:GridView runat="server" CellPadding="1" id="RolesGrid" 
                Gridlines="None" AutoGenerateColumns="False" ForeColor="#333333" CssClass="GridView1" Width="800"  >
   
    <Columns>
    <asp:ButtonField ItemStyle-Width="10" />
      <asp:TemplateField HeaderText="Roles" >
        <ItemTemplate>
          <%# Container.DataItem.ToString() %>
        </ItemTemplate>
      </asp:TemplateField>
    </Columns>
    
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
	
	
	
	
</asp:Content>
