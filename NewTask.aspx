<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewTask.aspx.cs" Inherits="UC_LIVE.NewTask" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 	<link href="../Styles/textstyles.css" rel="stylesheet" type="text/css" />
     <style type="text/css">

         .style4
         {
		 	height: 48px;
		 }
         .style5
         {
             width: 186px;
             height: 48px;
         }
         .style9
         {
             width: 238px;
             height: 54px;
         }
         .style12
         {
             width: 238px;
             height: 16px;
         }
         .style13
         {
             height: 16px;
         }
         .style14
         {
             height: 54px;
         }
         </style>
                
              <div> 
              
               <asp:ValidationSummary ID="ValidationSummaryContact" HeaderText="You must enter a value in the following fields:" DisplayMode="BulletList" EnableClientScript="true" runat="server" ValidationGroup="ClaimValidation" />
                
             </div>     <table style="width:287px; height: 219px;">
             
   
     <tr>
		    <td class="style9" >                   
             <asp:DropDownList ID="ContactTypeID" runat="server" Height="30px" Width="170px">
             <asp:ListItem Value="0">Choose Task Type</asp:ListItem>  
            <asp:ListItem Value="1">Appointment</asp:ListItem>  
            <asp:ListItem Value="2">Task</asp:ListItem>            
            <asp:ListItem Value="3">Note</asp:ListItem>
          
            <asp:ListItem Value="6">Client</asp:ListItem>
        
        </asp:DropDownList></td>
         <td class="style14" >
			 <asp:Label ID="CompanyName" runat="server" Text="Task Title"></asp:Label>
           
	<br />
			 <asp:TextBox ID="CompanyTextBox" runat="server" Height="21px" Width="210px"></asp:TextBox>
           
        </td>
         <td class="style14" >
             </td>
     </tr>
     
     <tr>
                <td class="style12" valign="middle">
             <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="Mr">In Progress</asp:ListItem>  
            <asp:ListItem Value="Mrs">Completed</asp:ListItem>
            <asp:ListItem Value="Ms">Cancelled</asp:ListItem>
            <asp:ListItem Value="Miss">On Hold</asp:ListItem>

        </asp:DropDownList></td>
        <td valign="bottom" class="style12" style="padding-top:10px;">
                </td>
         <td class="style13" >
                </td>
     </tr>
 
       <tr>
         <td class="style4" colspan="2" style="text-align:right;">
     
             
             <asp:ImageButton ID="AddRecord" runat="server" Text="Add Record" onclick="AddNewRecord" ValidationGroup="ClaimValidation" ImageUrl="~/Images/Icons/AddContact.gif"/>
             
             
             
             
             </td>
         <td class="style5">
             &nbsp;</td>
     </tr>
    </table>
                
    </div>
    </form>
</body>
</html>
