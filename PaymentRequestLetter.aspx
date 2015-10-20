<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="PaymentRequestLetter.aspx.cs" Inherits="UC_LIVE.PaymentRequestLetter" %>


	<style type="text/css">
		.style2
		{
			height: 38px;
		}
				
		.bodytext
		{
			font-family:Arial;
			font-size:12px;
			padding:10px;
			margin:5px;
		}
		
		.style6
		{
			height: 28px;
		}
		.style7
		{
			height: 30px;
		}
		.style8
		{
			height: 32px;
		}
		.style9
		{
			height: 34px;
		}
		.style10
		{
			height: 31px;
		}
		.style11
		{
			height: 29px;
		}
		.style12
		{
			height: 36px;
		}
		
	    .style13
        {
            width: 210px;
        }
        .style14
        {
            height: 28px;
            width: 210px;
        }
        .style15
        {
            height: 30px;
            width: 210px;
        }
        .style17
        {
            height: 34px;
            width: 210px;
        }
        .style18
        {
            height: 31px;
            width: 210px;
        }
        .style19
        {
            height: 29px;
            width: 210px;
            padding:5px;
        }
        		
	    .style22
        {
            height: 36px;
            font-weight: bold;
            width: 210px;
            padding: 5px;
        }
		
	    .style23
        {
            width: 210px;
            font-weight: bold;
            font-size:14px;
            padding:5px;
        }
		
	    </style>
	    
	     <input type="image" value="Print" onclick="window.print(); return false;" src="../Images/Icons/document-print.png"  />

<table style="text-align:center; margin-left:80px;"><td align="center" style="text-align:center;">
<div id="DocumentHeader" runat="server"></div>

 
<div style="color: White; font-size: 14px; height: 180px; text-align: center; width: 800px;">

 <div id="insurancecompanydiv" runat="server" style='width:278px; margin-left:10px;float:left;  font-family:Arial;  marging-top:25px;   height:80px; text-align:left; color:Black;'></div>
	 <div id="HireStartDate" runat="server" style='width:178px; font-weight:bold; margin-left:300px; margin-top:40px; float:left;  font-family:Arial;     height:60px; font-size:12px; color:Black'></div>
	<div style="clear:both;">
		<div style="Background-color:#213b8f;  font-size:24px; margin-top: 20px;line-height:2em; ">
            <b>ABI General Terms of Agreement Payment Request Letter</b></div>
	
	<table style="width: 99%; height: 350px;" class="bodytext">
		<tr>
			<td colspan="5">
		
                    <br /><br /><span>Payment Request Letter (applicable to ABI Repair &amp; Hire Protocols)</span>
                    <br />
                <br />
                This claim is made under the terms of the ABI Hire and/or Repair Protocol and payment is required within 30 days please. 
				<br />
				<br />
				The heads of claim are listed below. Please note that the amounts vary depending on the period of time within which the claim is settled.
				All appropriate documents are enclosed in support together with the mitigation questionnaire signed by our customer.<o:p><br />
				<br />
			</td>
		</tr>
		<tr style="background-color:#EEEEEE"; color: Black;" class="style2">
			<td class="style23">
				Payment Cut Off Dates
			</td>
			<td class="style2" id="HireStartDate30" runat="server" style="text-align:center; font-weight:bold; width:100px;"> </td>
			<td class="style2" id="HireStartDate60" runat="server" style="text-align:center;font-weight:bold; width:100px;"> </td>
			<td class="style2" id="HireStartDate90" runat="server" style="text-align:center;font-weight:bold; width:100px;"></td>
			<td class="style2" id="HireStartDate90plus" runat="server" style="text-align:center;font-weight:bold; width:100px;"></td>
		</tr>
		<tr>
			<td class="style13">
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
		</tr>
		<tr>
			<td class="style14">
				Hire Cost
			</td>
			<td class="style6" id="DaysHireCharges30" runat="server" style="text-align:center"> 
			
			</td>
			<td class="style6" id="DaysHireCharges60" runat="server" style="text-align:center">
				</td>
			<td class="style6" id="DaysHireCharges90" runat="server" style="text-align:center">
			
			</td>
			<td class="style6" id="DaysHireCharges90plus" runat="server" style="text-align:center">		
			</td>
		</tr>

		<tr>
			<td class="style15">
				Delivery &amp; Collection Charges
			</td>
			<td id="DeliverandClollectionCharges" runat="server" class="style8" style="text-align:center"> 
	
			</td>
		<td id="DeliverandClollectionCharges1" runat="server" class="style8" style="text-align:center;">
			</td>
		<td id="DeliverandClollectionCharges2" runat="server" class="style8" style="text-align:center;">
			</td>
				<td id="DeliverandClollectionCharges3" runat="server" class="style8" style="text-align:center;">
			</td>
		</tr>
			<tr>
			<td class="style15">
				<b>Extra 1&nbsp; </b>- Automatic Transmission</td>
			<td id="Automatic" runat="server" class="style7" style="text-align:center"> 
	
			</td>
		<td id="Automatic1" runat="server" class="style7" style="text-align:center;">
			</td>
		<td id="Automatic2" runat="server" class="style7" style="text-align:center;">
			</td>
		<td id="Automatic3" runat="server" class="style7" style="text-align:center;">
			</td>
		</tr>
			<tr>
			<td class="style15">
				<b>Extra 2</b> - Tow Bars or Baby Seat</td>
			<td id="BabySeats" runat="server" class="style11" style="text-align:center"> 
	
			</td>
				<td id="BabySeats1" runat="server" class="style11" style="text-align:center;">
			</td>
			</td>
			<td id="BabySeats2" runat="server" class="style11" style="text-align:center;">
			</td>
			</td>
				<td id="BabySeats3" runat="server" class="style11" style="text-align:center;">
			</td>
			</td>
		</tr>
			<tr>
			<td class="style15">
				<b>Extra 3 </b>-&nbsp; Estate Vehicles</td>
			<td id="Estate" runat="server" class="style6" style="text-align:center"> 
	
			</td>
		<td id="Estate1" runat="server" class="style6" style="text-align:center;">
			</td>
		<td id="Estate2" runat="server" class="style6" style="text-align:center;">
			</td>
		<td id="Estate3" runat="server" class="style6" style="text-align:center;">
			</td>
		</tr>
			<tr>
			<td class="style14">
				<b>Extra 4 </b>-&nbsp; Dual Control Vehicles</td>
			<td id="Control" runat="server" class="style6" style="text-align:center"> 
	
			</td>
	        <td id="Control1" runat="server" class="style6" style="text-align:center"> 
			</td>
				<td id="Control2" runat="server" class="style6" style="text-align:center"> 
			</td>
				<td id="Control3" runat="server" class="style6" style="text-align:center"> 
			</td>
		</tr>
		<tr>
				
			<td class="style15">
					<b>Extra 5 - </b>&nbsp;Additional Driver Cost
			</td>
			<td id="AdditionalDriverCost" runat="server" class="style7" style="text-align:center"> 
				
			</td>
				<td id="AdditionalDriverCost1" runat="server" class="style7" style="text-align:center"> 
				</td>
						<td id="AdditionalDriverCost2" runat="server" class="style7" style="text-align:center"> 
				</td>
						<td id="AdditionalDriverCost3" runat="server" class="style7" style="text-align:center"> 
				</td>

		
		</tr>
		<tr>
			<td class="style13">
				Engineers Report Fee
			</td>
			<td id="EngineerFees" runat="server" class="style7" style="text-align:center"> 
			
			</td>
					<td id="EngineerFees1" runat="server" class="style7" style="text-align:center"> 
			
			</td>
					<td id="EngineerFees2" runat="server" class="style7" style="text-align:center"> 
			
			</td>
					<td id="EngineerFees3" runat="server" class="style7" style="text-align:center"> 
			
			</td>
		</tr>
		<tr>
			<td class="style17">
				Storage &amp; Recovery Charges
			</td>
			<td id="StorageCharges" runat="server" class="style7" style="text-align:center"> 
			</td>
					<td id="StorageCharges1" runat="server" class="style7" style="text-align:center"> 
			</td>
					<td id="StorageCharges2" runat="server" class="style7" style="text-align:center"> 
			</td>
					<td id="StorageCharges3" runat="server" class="style7" style="text-align:center"> 
			</td>
		</tr>
		<tr>
			<td class="style18">
				ABI Handling Fee</td>
			<td class="style10">
				<div id="AdminFees" runat="server"  class="style7" style="text-align:center"> 
				</div>
			</td>
			<td id="AdminFees1" runat="server" class="style7" style="text-align:center"> 
			</td>
		<td id="AdminFees2" runat="server" class="style7" style="text-align:center"> 
			</td>
		<td id="AdminFees3" runat="server" class="style7" style="text-align:center"> 
			</td>
		</tr>
		<tr style="background-color:#EEEEEE">
			<td class="style19">
				<b>Total (excluding VAT) </b>
			</td>
			<td id="TotalCharges" runat="server" class="style11" style="text-align:center;font-weight:bold;">

			</td>
			<td class="style11" id="TotalCharges60" runat="server" style="text-align:center;font-weight:bold;">

			</td>
			<td class="style11" id="TotalCharges90" runat="server" style="text-align:center;font-weight:bold;">
                &nbsp;</td>
			<td class="style11" id="TotalCharges90Plus" runat="server" style="text-align:center;font-weight:bold;">
&nbsp;</td>
		</tr>
			<tr style="background-color:#EEEEEE">
			<td class="style22">
			<div id="VATRATE" runat="server"></div>
			</td>
			<td runat="server" id="VATDiv" class="style7" style="text-align:center;font-weight:bold;"> 
	
			</td>
				<td runat="server" id="VATDiv1" class="style7" style="text-align:center;font-weight:bold;"> 
			</td>
				<td runat="server" id="VATDiv2" class="style7" style="text-align:center;font-weight:bold;"> 
			</td>
				<td runat="server" id="VATDiv3" class="style7" style="text-align:center;font-weight:bold;"> 
			</td>
		</tr>
			<tr style="background-color:#EEEEEE">
			<td class="style22">
				Grand Total (Inclusive VAT)
			</td>
			<td runat="server" id="ThirtydaysGrandTotal"  class="style7" style="text-align:center;font-weight:bold;"> 
	
			</td>
			<td runat="server" id="SixetydaysGrandTotal"  class="style7" style="text-align:center;font-weight:bold;"> 
		
			</td>
			<td runat="server" id="NightydaysGrandTotal"  class="style7" style="text-align:center;font-weight:bold;"> 
			
			</td>
			<td runat="server" id="NightyPlusdaysGrandTotal"  class="style7" style="text-align:center;font-weight:bold;"> 
				
			</td>
		</tr>

		<tr>
			<td colspan="5">
	
				<div style="text-align:center;"><b>*Please see attached sheet for a breakdown of the hire charges.</b></div>
                <b><br />
		
				Please note that any other uninsured losses will be notified separately if applicable. Please forward a cheque for the total cost payable to Universal Claims Group Ltd quoting reference <span runat="server" id="ClaimReference"></span><br />
				<br />
				We should be promptly advised in writing if payment would be delayed beyond the agreed terms. Please note that the hire rates quoted are discounted by concession only from our contractual rates for payment within 90 days under the terms ABI GTA.
				<br />
				<br />
				If payment is not received within this period, the full contractual rate will be charged. Please note that any cheque received will be banked on an interim basis on account generally so as not to prejudice any other elements of the claim, which may arise from this accident.
			    </b>
			    
			
			</td>
		</tr>
		
					<tr><td class="style15">
			
					
					
					    <td class="style9" valign="top" colspan="4" style="text-align:center;">
					 
					        &nbsp;</td></tr>
	</table>
	
</td>
	</tr></table>
	
</div>

   <div id="FooterValue" runat="server" style="margin-bottom:10px; font-size:12px; margin-left:50px; text-align:center; width:800px; margin-top:200px;"></div>