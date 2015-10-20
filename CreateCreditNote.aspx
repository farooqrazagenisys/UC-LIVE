<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateCreditNote.aspx.cs" Inherits="UC_LIVE.CreateCreditNote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div style="background-color:White;">
		<div  class="MainHeading">Create Credit Note</div>
		<table style=" width:905px; margin-left:20px; margin-right:20px; background-color:#EEE;">
		
			<tr>
				<td style="height: 5px;" valign="top" style="padding-left:20px; padding-top:10px;">				
			
					
			<div class="style8" >Please click on confirm button to create credit note</div>
							
			<div id="ErrorMessage" runat="server" style="color:Red;"></div>	
				
				<div style="padding-top:10px; padding-bottom:10px;">
					<asp:Button ID="CreateCreditNote1" runat="server" Text="Create Credit Note" 
                        onclick="CreateCreditNote1_Click"/>
                        	<asp:Button ID="CancelButton" runat="server" Text="Cancel" 
            onclick="CancelButton_Click"/>
	
	
                        
					</div>
				</td>
			</tr>
	
		</table>
	

</div>


</asp:Content>
