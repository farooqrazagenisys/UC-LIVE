<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimSummary.aspx.cs" Inherits="UC_LIVE.ClaimSummary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>

	<link href="Styles/textstyles.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		
		body
		{
			
			width:950px;
			margin: 0 auto;
	    }
		.style2
		{
			font-family: Arial, Helvetica, sans-serif;
			color: #333333;
			font-size: 14px;
			text-align: center;
			font-weight: bold;
			padding:0px;
			margin:0px;
			background-color:White;
			
		
		}
		.style3
		{
			font-family: Arial, Helvetica, sans-serif;
			color: #333333;
			font-size: 24px;
			text-align: left;
			height: 53px;
		}
		
		.heading2
		
		{
			background-color:#EEEEEE;
			padding: 10px;
			
			}
		
			.text_12
			{
				padding-left:10px;
				
				
				}
		td
		{
		padding-left:5px;
			
			}
	</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    	<table style="width: 93%; height: 258px;" class="style2" cellspacing="10">
		
			<tr>
				<td  colspan="4" style="text-align:center;  color:Black;">
					&nbsp;</td>
				<td style="text-align:center;  color:Black;">
					&nbsp;</td>
			</tr>
		
			<tr>
				<td  colspan="4" class="style3" style="text-align:center;  color:Black;">
					<div id="ClaimTitle" runat="server"></div> </td>
				<td class="style3" style="text-align:center;  color:Black;">
					&nbsp;</td>
			</tr>
	
			<tr>
				<td  >
					&nbsp;</td>
				<td class="heading2" >
					Client Details</td>
				<td class="heading2">
					Insurance Comapny</td>
				<td class="heading2">
					Solicitor Details</td>
				<td >
					&nbsp;</td>
			</tr>
			<tr>
				<td  class="text_12" >
					&nbsp;</td>
				<td  class="text_12" >
					<div id="ClientDetails" runat="server"></div></td>
				<td class="text_12">
				<div id="InsuranceDetails" runat="server"></div></td>
				<td class="text_12">
					<div id="SolicitorDetails" runat="server"></div></td>
				<td class="text_12">
					&nbsp;</td>
			</tr>
			<tr>
				<td >
					&nbsp;</td>
				<td >
					&nbsp;</td>
				<td>
					&nbsp;</td>
				<td>
					&nbsp;</td>
				<td>
					&nbsp;</td>
			</tr>
			<tr>
				<td >
					&nbsp;</td>
				<td class="heading2" >
					Engineer Details</td>
				<td class="heading2">
					Car Hire Details</td>
				<td class="heading2">
					Storage Details</td>
				<td >
					&nbsp;</td>
			</tr>
	<tr>
				<td  class="text_12" >
					&nbsp;</td>
				<td  class="text_12" >
					<div id="EngineerDetails" runat="server"></div></td>
				<td class="text_12">
				<div id="CarhireDetails" runat="server"></div></td>
				<td class="text_12">
					<div id="StorageDetails" runat="server"></div></td>
				<td class="text_12">
					&nbsp;</td>
			</tr>
			<tr>
				<td >
					&nbsp;</td>
				<td >
					&nbsp;</td>
				<td>
					&nbsp;</td>
				<td>
					&nbsp;</td>
				<td>
					&nbsp;</td>
			</tr>
			<tr>
				<td colspan="5" >
					&nbsp;</td>
			</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
