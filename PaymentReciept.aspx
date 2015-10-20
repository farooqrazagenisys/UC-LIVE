<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentReciept.aspx.cs" Inherits="UC_LIVE.PaymentReciept" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<style type="text/css">
				
		#maindiv
		{
			width: 800px;
			text-align:center;	
			margin: 0 auto; 
			
		}
		
		.ColumnSize
		{
		    
		    width:50px;
		    
		  }
		
	    .style2
        {
            height: 34px;
        }
        		
	    .style6
        {
            height: 33px;
        }
        		
	    </style>

	<div id="maindiv" style="text-align:left; font-family:Arial;margin: 0 auto; height:1157px;">
		<table style="width: 54%; height: 448px; margin: 0 auto;">
			<tr>
				<td colspan="3">
				
				<div id="DocumentHeader" runat="server"></div>
				
					<div id="ViewHeaderImage" runat="server" style="margin-left:80px;">
					</div>
			</tr>
			<tr>
				<td style="height: 5px;">
				</td>
			</tr>
			<tr>
				<td class="style6">
					
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="style6">
				
					<div id="ViewContactInfo" runat="server" style="width:480px; float:left; margin-left:50px; margin-bottom:30px; text-align:left;  font-size:14px; ">
					</div>
					<div id="InvoiceNumber" runat="server" style="width:200px; margin-left:10px; float:left; text-align:left;  font-size:14px;">
					</div>
					<div id="ViewClaimReference" runat="server" style="width:200px; margin-left:10px; float:left; text-align:left;  font-size:14px; ">
					</div>
					
					
					
					
					
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="3" style="background-color:#FFFFFF; margin: 20px; height: 30px; text-align: center; font-size: 18px;">
				<div id="InvoiceType" runat="server" style="width:768px; padding-top:20px; margin-bottom:25px; text-align:center; height:35px; font-size:30px; font-weight:bold;">
					</div>
									<div id="ViewPaymentReciept" runat="server" style="width:776px; background-color:#FFFFFF; color:Black;  margin-bottom:3px; padding-top:35px; text-align:center; height:500px; font-size:18px; ">
					</div>
				</td>
			</tr>
			
			
			
			<tr>
				<td colspan="3" align="center" style="text-align: left;">
			
			
				</td>
			</tr>
			<tr>
				<td colspan="3" style="height: 10px;">
				</td>
			</tr>
			<tr>
				<td colspan="3" class="style2">
					
						</td>
			</tr>
		</table>
		
		<table><tr><td valign="middle" align="center"><div id="FooterValue" runat="server" style="   margin-top:280px; width:900px; font-size:11px; text-align:center;"></div>
	</td></tr></table>
	</div>
	
	
    </div>
  		
    </form>
</body>
</html>
