<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCarhireForm.aspx.cs" Inherits="UC_LIVE.NewCarhireForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
	<style type="text/css">
		
		body
		{
			
			margin:0px;
			padding:0px;
			font-size:14px;
			
			}
				
		.fontstyle
		{
			
			font-family:Arial;
			padding:10px;
			
			
		}
		
.TextAreaStyle
        {
            
           border: 1px solid white;
           overflow:hidden; 
   
            }
		
	p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:13.0pt;
	font-family:"Times New Roman","serif";
			margin-left: 0cm;
			margin-right: 0cm;
			margin-top: 0cm;
			width: 311px;
		}
		.style2
		{
			padding-left: 20px;
			width: 238px;
		}
		#Text1
		{
			height: 40px;
			width: 122px;
		}
		#Text2
		{
			height: 40px;
			width: 122px;
		}
		
		#Text3
		{
			height: 40px;
			width: 122px;
		}
		
		#Text4
		{
			height: 40px;
			width: 122px;
		}
		
		#Text5
		{
			height: 40px;
			width: 122px;
		}
		
		#Text6
		{
			height: 29px;
			width: 148px;
			margin-top: 3px;
		}
		
		#Text7
		{
			height: 29px;
			width: 257px;
			margin-top: 3px;
		}
		
		#Text8
		{
			height: 29px;
			width: 305px;
			margin-top: 3px;
		}
		
		.style15
		{
			padding-left: 20px;
			font-family: Arial;
			width: 640px;
		}
				
		.style21
		{
			width: 43px;
		}
		
		.style23
		{
			width: 26px;
		}
		
		.style24
		{
			height: 35px;
		}
		
		.style25
		{
            width: 183px;
            padding-left:10px;
        }
				
		.style27
		{
			height: 29px;
			padding-left:10px;
			float:left;
			text-align:left;
		}
		
		.style28
		{
			height: 30px;
		}
		
		.style29
		{
			width: 265px;
		}
		
		#DocumentHeader
        {
            width: 1080px;
        }
        
        
		
		.style30
        {
            width: 80px;
        }
        
        
		
		.style31
        {
            width: 284px;
        }
        .style32
        {
            width: 316px;
        }
        
        
		
		.style33
        {
            width: 28px;
        }
        .style34
        {
            width: 122px;
        }
        .style35
        {
            width: 190px;
        }
        
        
		
		.style36
        {
            height: 19px;
        }
        
        
		
		.style37
        {
            height: 22px;
        }
        
        
		
		.style38
        {
            width: 133px;
        }
        
        
		
		.style40
        {
            width: 239px;
        }
        
        
		
		.style41
        {
            width: 201px;
        }
        
        
		
		.style42
        {
            width: 6px;
        }
        
        
		
		.style44
        {
            width: 6px;
            height: 20px;
        }
        .style45
        {
            height: 20px;
        }
        
        
		
		</style>
</head>
<body class="fontstyle">
    <form id="form1" runat="server">
  
   <table style="margin-top:-5px;">
    
    <tr>
      
    <td style="margin-left:35px;">
    <div id="DocumentHeader"  style="width:1080px; margin-left:-10px; margin-bottom:8px; height:70px;" runat="server"></div>   
    
    </td>
   
    
    </tr>
    
    </table>
    
    
    
    
    <table width="1050" border="0"  cellpadding="0" cellspacing="0" style=" margin-left:-10px; font-family:Arial, Helvetica, sans-serif;font-size:12px; text-align: center; color: #333; height: 1030px;">
  <tr>
    <td width="850"><table width="932" height="358" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="350" valign="top"><table width="350" height="800" border="0" cellpadding="0" cellspacing="0">
        
          <tr>
            <td height="30" bgcolor="#000000" style="color:#FFF; font-size:16px;"><span class="style2">DETAILS OF HIRER(the &quot;Hirer&quot;)</span></td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF" style="color:#FFF">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF" style="color:#000" align="left"><div runat="server" id="ViewContactInfo"></div>
              <hr/></td>
          </tr>
          <tr>
            <td height="15" align="left" bgcolor="#FFFFFF">&nbsp;11. Category: </td>
          </tr>
          <tr>
            <td height="30" align="left" bgcolor="#FFFFFF">
            
				<%--<table width="47" height="25" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
                    <tr>
                      <td height="17" >    <table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td height="17" class="style21" align="left">A </td>
                    </tr>
                  </table></td>
                      <td height="17">    <table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td height="17" class="style21" align="left">B</td>
                    </tr>
                  </table></td>
                      <td height="17" class="style22">    <table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td height="17" class="style21" align="left">C</td>
                    </tr>
                  </table></td>
                      <td height="17" class="style22">    <table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td height="17" class="style21" align="left">D1</td>
                    </tr>
                  </table></td>
                    </tr>
                  </table>--%>
                <div id="CategoryDiv" runat="server" style=" padding-left:25px; font-weight:bold;"></div>
                
                
         
                </td>
          </tr>
          <tr>
            <td align="left" bgcolor="#FFFFFF" ><hr /></td>
          </tr>
          <tr>
            <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;12.&nbsp; Identification: 
              <div id="IdentificationDiv12" runat="server" style="padding-top:10px; padding-bottom:5px;font-weight:bold; padding-left:25px;"></div>
            </td>
            
          
          </tr>

         
          <tr>
            <td align="left" valign="top" bgcolor="#FFFFFF">
            
            <div style="text-align:justify; width:350px; height:800px; padding:10px; padding-top:10px; margin-top:0px; font-size:14px;">
            	13.&nbsp;
            READ THIS DOCUMENT CAREFULLY<br />
              <br />
              <div id="titlenew" style="float:left;">This Hire Agreement is made on:&nbsp; </div><div 
                    style="height: 13px; font-weight:bold; width: 75px; float:left;" id="DateOut1" 
                    runat="server"></div> between the owner and the Hirer in respect of the hire of the vehicle for the period from the date of this Agreement until the “Return Date” (being a date no more 12 weeks beginning with the date of this Agreement when the Hirer makes the Vehicle available for collection by the Owner) (the “Hire Period”) in consideration of the agreement to pay the rental charges set out in the right hand column of this document together with any amounts payable in respect of the insurance, CDW and other ancillary charges (the “Hire Charges”) and upon the Terms and Conditions set out on the reverse of this document.<br />
  <br />
             <span style="color:#999; font-weight: 700; color:Red; line-height:1.5em; font-weight:bold;" >THIS AGREEMENT COMPRISING, THE TERMS ON THE FRONT AND OVERLEAF ALONGSIDE WITH THE FEES &amp; CHARGES DOCUMENT; IS LEGALLY BINDING WHEN SIGNED BY THE HIRER; CONTAINS THE ENTIRE AGREEMENT BETWEEN THE OWNER AND THE HIRER AND SUPERSEDES ALL ORAL AND WRITTEN COMMUNICATION IN RESPECT OF THE HIRE OF THE VEHICLE.<br />
                <br />
                <span style="color:Black; font-size:14px; color:Red;  line-height:1.5em;">
                NOTICE OF THE RIGHTS TO CANCEL WHERE THIS CONTRACT HAS BEEN MADE DURING A VISIT 
                TO YOUR OR ANOTHER PERSON’S HOME, OR AT YOUR PLACE OF WORK OR DURING AN 
                EXCURSION ARRANGED BY US, YOU HAVE THE RIGHT TO CANCEL THIS CONTRACT WITHIN A 
                PERIOD OF 7 DAYS STARTING ON THE ABOVE STATED DATE.
 
               <br /><br />
               
                THIS CANCELLATION NOTICE IS IN ACCORDANCE WITH THE CANCELLATION OF CONTRACTS MADE IN 
                A CONSUMER’S HOME OR PLACE OF WORK REGULATION 2008. NO 1816</span></p>
              <p><%--Signed on the date set out above in agreement to the above terms and in confirmation of the Insurance Details.
         
              --%></p>
            </span>
              <div style="text-align: center">THE HIRER</div>
              <table width="281" height="38" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                <tr>
                  <td width="84" bgcolor="#FFFFFF" align="center">Signature </td>
                  <td width="138" height="36"><table width="184" height="27" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td width="180" height="25" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                  </table></td>
                </tr>
              </table>
              <p>Signed on the date set out in agreement to the above terms              </p>
              
                 <div style="text-align: center">For and on behalf of the Owner</div>
              <table width="281"  border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                <tr>
                  <td width="84" bgcolor="#FFFFFF" align="center">
                  
                  Signature </td>
                  <td width="138" height="36"><table width="184" height="27" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td width="180" height="35" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                  </table></td>
                </tr>
              </table>
              <br />
            </div>
            </td>
          </tr>
  
        
        </table></td>
        <td width="400" valign="top" bgcolor="#E8E8E8"><table width="350" height="212" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" colspan="2" bgcolor="#000000" style="color:#FFF ; font-size:16px;" >INSURANCE DETAILS</td>
          </tr>
          <tr>
            <td height="19" colspan="2" bgcolor="#E8E8E8"><table height="164" border="0" cellpadding="0" cellspacing="0" style="width: 312px">
              <tr>
                <td width="24" height="74" valign="top" style="padding-top:5px;">
					
					14</td>
                <td valign="top"  align="left" style="padding-top:5px;" class="style32">Have you had a proposal declined, a policy cancelled, renewal refused or&nbsp;had special conditions by any motor insurer?</td>
                <td width="67" valign="top" style="text-align: right; padding-top:5px;"><strong>Yes or No</strong>                
                  <table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td width="43" height="17">&nbsp;</td>
                    </tr>
                  </table>
               </td>
              </tr>
              <tr>
                <td width="24" height="84" valign="top">&nbsp;</td>
                <td valign="top" align="left" class="style32">Have you been convicted of any motoring 
                  offence during the past five years or had your 
                  license suspended during the past ten years, 
                  or is any prosecution<span style="">&nbsp; </span>pending?</td>
                <td width="67" valign="top" bgcolor="#E8E8E8" style="text-align: right"><br />
                  <table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="43" height="17">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="19" colspan="2" bgcolor="#E8E8E8" style="color:#FFF"><table height="62" border="0" align="center" cellpadding="0" cellspacing="0" style="width: 327px" >
              <tr>
                <td><table width="290" height="79" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
                  <tr>
                    <td width="97" height="26" bgcolor="#000000" style="text-align: center">Date</td>
                    <td width="112" bgcolor="#000000" style="text-align: center">Code</td>
                    <td width="99" bgcolor="#000000" style="text-align: center">Fine</td>
                  </tr>
                  <tr>
                    <td colspan="3" bgcolor="#FFFFFF" style="text-align: center"><p style="height: 19px; width: 324px">&nbsp;</p>
                      <p>&nbsp;</p></td>
                  </tr>
                  </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="10" colspan="2" valign="top" bgcolor="#E8E8E8"><table height="169" border="0" align="left" cellpadding="0" cellspacing="0" style="width: 331px">
              <tr>
                <td width="19" height="52" valign="top">&nbsp;</td>
                <td valign="middle" style="text-align: left" class="style31"><br />
                  Have you any physical or mental defect <br />
                  or infirmity or suffered from diabetes, <br />
                  fits or any heart complaint? </td>
                <td width="59" height="50" valign="middle" style="text-align: right">
                  <table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="43" height="17">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="38" valign="top">&nbsp;</td>
                <td height="50" valign="middle" style="text-align: left" class="style31">Have you had a <u>full</u> <u>driving</u> <u>license<br />
                </u> for more than 12 months</td>
                <td height="50" valign="middle" style="text-align: right"><table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="43" height="23">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td width="19" height="59" valign="top">&nbsp;</td>
                <td valign="middle" style="text-align: left" class="style31"> Have you had any accident and/or<br />
                  claims in the past 36 calendar months? </td>
                <td width="59" height="50" valign="middle" style="text-align: right">                
                  <table width="47" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td width="43" height="17">&nbsp;</td>
                    </tr>
                  </table>
               
                    
                  </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="10" colspan="2" valign="top" bgcolor="#E8E8E8"><table height="62" border="0" align="center" cellpadding="0" cellspacing="0" style="width: 325px" >
              <tr>
                <td><table width="327" height="68" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
                  <tr>
                    <td width="40" bgcolor="#000000" style="text-align: center; color: #FFF;">No</td>
                    <td width="90" bgcolor="#000000" style="text-align: center; color: #FFF;">Amount Own Damage</td>
                    <td width="81" bgcolor="#000000" style="text-align: center; color: #FFF;">Third Party</td>
                    <td bgcolor="#000000" style="text-align: center; color: #FFF;" class="style30">Outstanding Claim</td>
                  </tr>
                  <tr>
                    <td colspan="4" bgcolor="#FFFFFF" style="text-align: center"><p>&nbsp;</p>
                      <p>&nbsp;</p></td>
                  </tr>
                  </table></td>
              </tr>
            </table></td>
          </tr>
          <tr><td colspan="3"><hr /></td></tr>
          <tr>
            <td width="26" height="10" valign="top" bgcolor="#E8E8E8"><br />
        
          
              1<span style="text-align: center">5</span></td>
            <td height="10" align="left" bgcolor="#E8E8E8" class="style29"><div style="padding-left:5px; padding-right:5px; width: 298px;" align="justify"><br />
              I declare that to the best of my knowledge and belief that&nbsp;the particulars given in the insurance proposal are true and no information has been withheld which might influence 
              
              acceptance of the proposal which, with this declaration
              , shall form the basis of the contract of insurance.<p> I agree that if the above particulars are completed by any                  &nbsp;other person, such person shall be deemed my agent 
                
                and I also declare that the above statements and answers 
                
                are true and complete to the best of my knowledge 
                
                and belief and I have taken all reasonable steps to 
                
                ensure their accuracy. I agree that the proposal 
                
                and declaration shall be the basis of and form the                  &nbsp;basis of the contract of insurance.
                <br />
              <table width="281" height="38" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                <tr>
                  <td width="84" bgcolor="#E8E8E8" align="left">Signature </td>
                  <td width="138" height="36" bgcolor="#EDEDED"><table width="184" height="27" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td width="180" height="25" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                  </table></td>
                </tr>
              </table>
            </div></td>
          </tr>
             <tr><td colspan="3"><hr /></td></tr>
          <tr>
            <td height="19" colspan="2" bgcolor="#E8E8E8"><table width="307" height="146" border="0" cellpadding="0" cellspacing="0">
              
             
              <tr>
                <td width="26" height="146" valign="top" style="padding-top:1px;">
				
					16</td>
                <td width="281" align="justify" valign="top" style="padding-right:10px; text-align:left;"><p>Additional Authorised Drivers<br />
                  Who have had a completed Insurance Proposal Form accepted</p>
                  <p>Full Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;Date of Birth
                  <table width="269" height="33" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td class="style35">&nbsp;</td>
                      <td bgcolor="#CCCCCC" class="style33">&nbsp;</td>
                      <td class="style34">&nbsp;</td>
                    </tr>
                  </table>
                    &nbsp;  &nbsp;  &nbsp;&nbsp; &nbsp;
                </td>
              </tr>
            </table></td>
          </tr>
                       <tr>
                <td height="30" valign="middle" bgcolor="#000000" style="text-align: center; color:White;"  class="style23" >17 </td>
                <td align="justify" valign="middle" bgcolor="#000000" style="text-align: left; color:White;">&nbsp;&nbsp;Own Insurance </td>
              </tr>
            <td colspan="2" valign="top" bgcolor="#E8E8E8" class="style36"><table width="307" border="0" cellpadding="0" cellspacing="0" style="color:#FFF; height: 200px;">
 
              <tr>
                <td height="150" valign="top" class="style23">&nbsp;</td>
                <td valign="top" style="padding-right:10px; color: #333; text-align: left;" align="justify"><table width="287" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="30" colspan="2">
                        <br />
                       
                      Complete ONLY if the vehicle is to be insured on  the customers own insurance.</td>
                  </tr>
                  <tr>
                    <td>Hirer's Insurance Co.</td>
                    <td height="30" style="text-align: right"><table width="145" height="24" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                    <tr>
                      <td width="43">&nbsp;</td>
                    </tr>
                  </table></td>
                  </tr>
                  <tr>
                    <td>Policy No</td>
                    <td height="30" style="text-align: right"><table width="145" height="24" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                      <tr>
                        <td width="43">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td>Cover Note No.</td>
                    <td height="30" style="text-align: right"><table width="145" height="24" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                      <tr>
                        <td width="43">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td>Contact</td>
                    <td height="30" style="text-align: right"><table width="145" height="24" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                      <tr>
                        <td width="43">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="142" class="style28">Hirer's Own excess</td>
              <td style="text-align: right" class="style28"><table width="145" height="24" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                      <tr>
                        <td width="43">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                </table>
                   
                   </td>
              </tr>
            </table></td>
          </tr>
          <tr><td colspan="3"> <hr /></td></tr>
          <tr><td valign="top">18</td><td style="text-align:left;">Collision Damage Liability initialling below signifies the Hirer’s agreement to pay the Collision Damage Waiver charge (CDW) shown in the column headed ‘CHARGES’. This reduces the excess from £2500 to the amount shown in the box below. Once initialled, the OWNER waives it right under sections 5.2.2 and 5.2.3 ONLY of this agreement. Refusal may leave the Hirer liable for the excess of £2500 and also liability for the Owners loss of use in the event of an accident however caused. We recommend CDW even if the Vehicle is insured on the hirer’s own policy.
              <br />
              </td></tr>
      

          <tr>
            <td height="19" colspan="2" bgcolor="#E8E8E8"><table height="61" border="0" align="center" cellpadding="0" cellspacing="2" bordercolor="#CCCCCC" style="width: 322px">
              <tr>
                <td width="86" height="30" bgcolor="#E8E8E8" style="text-align: center; color: #000;">Accepted</td>
                <td width="97" bgcolor="#E8E8E8" style="text-align: center">Refused</td>
                <td width="87" bgcolor="#E8E8E8" style="text-align: center">Application Excess</td>
              </tr>
              <tr>
                <td height="22" bgcolor="#E8E8E8" style="text-align: center"><table width="80" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="66" height="23">&nbsp;</td>
                  </tr>
                </table></td>
                <td bgcolor="#E8E8E8" style="text-align: center"><table width="80" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="70" height="23">&nbsp;</td>
                  </tr>
                </table></td>
                <td bgcolor="#E8E8E8" style="text-align: center"><table width="80" height="25" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="43" height="23">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
 
        </table></td>
        <td width="400" valign="top"><table border="0" cellpadding="0" cellspacing="0" style="height:1000px; width: 350px;">
          <tr>
            <td bgcolor="#000000" style="color:#FFF" class="style42"></td>
            <td bgcolor="#000000" style="color:#FFF" class="style28"><span class="style15">VEHICLE &nbsp; (the&quot;VEHICLE&quot;)&nbsp; AND CHARGES</span></td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF" align="justify" valign="top" style="padding-top:5px;" 
                  class="style42">19</td>
            <td height="20" bgcolor="#FFFFFF" align="left" style="padding:5px; text-align:justify;">
                Statement of Liability<br />
				<br />
                I agree that while the rental agreement is in force I will be liable  as owner of the vehicle, or any replacement vehicle, for any fixed penalty offence  or parking charge for that vehicle under s66 Road Traffic Offenders Act 1988 and  Schedule 6 Road Traffic Act 1991 including any locally levied congestion  charges howsoever incurred during the Hire Period. I also agree to pay the  Owner an administration charge of £25.00 for each charge that the owner has to  transfer to the Hirer.<br />
                <br />
                <table height="38" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF" style="width: 326px">
                  <tr>
                    <td width="84" bgcolor="#FFFFFF" align="center">Signature </td>
                    <td width="138" height="36"><table width="200" height="27" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                      <tr>
                        <td width="180" height="25" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
          </tr>
       <tr><td colspan="2"><hr /></td></tr>
          <tr>
            <td bgcolor="#FFFFFF" valign="top" style="padding-top:5px;" class="style42">20.</td>
            <td height="20" bgcolor="#E8E8E8" style="padding:5px; text-align: left;" align="left">I wish to pay the full hire charges by Mastercard/Visa/Other (delete  if not applicable). I agree that Swift may deduct from this card any  liabilities under section 19 above.</td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF" class="style42">&nbsp;</td>
            <td height="20" bgcolor="#E8E8E8"><table width="339" height="114" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top">&nbsp;</td>
                <td height="24" align="left" valign="top">Credit Card Type</td>
                <td width="183" valign="top" style="text-align: right"><table width="181" height="24" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td height="17" class="style21">&nbsp;</td>
                  </tr>
                </table>                  </td>
              </tr>
              <tr>
                <td align="left" valign="middle">&nbsp;</td>
                <td height="30" align="left" valign="middle">Expiry Date<u></u></td>
                <td height="22" valign="middle" style="text-align: left"><table width="92" height="24" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="43">&nbsp;</td>
                    <td width="43" height="17">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td width="18" align="left" valign="middle">&nbsp;</td>
                <td width="108" height="30" align="left" valign="middle">3 digits security no
                 </td>
                <td width="183" style="text-align:left"><table width="137" height="24" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="43">&nbsp;</td>
                    <td width="43">&nbsp;</td>
                    <td width="43" height="17">&nbsp;</td>
                  </tr>
                </table>                 </td>
              </tr>
              <tr>
                <td align="left" valign="middle">&nbsp;</td>
                <td height="30" align="left" valign="middle">Last 4 digits of card no</td>
                <td valign="middle" style="text-align:left"><table width="182" height="24" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td width="20" class="style37"></td>
                    <td width="20" class="style37"></td>
                    <td width="20" class="style37"></td>
                    <td width="20" class="style37" ></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF" class="style42">&nbsp;</td>
            <td height="31" bgcolor="#E8E8E8" align="right"><table border="0" align="left" 
                    cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF" 
                    style="width: 329px; height: 28px;">
              <tr>
                <td bgcolor="#E8E8E8" align="center" class="style41">Signature </td>
                <td width="138" height="36" bgcolor="#E8E8E8"><table width="175" height="27" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                  <tr>
                    <td height="25" align="center" bgcolor="#FFFFFF" class="style38">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        
          <tr>
            <td bgcolor="#FFFFFF" valign="top" colspan="2"><table height="190" border="0" cellpadding="0" cellspacing="0" style="width:355px" >
              <tr>
                <td height="15" valign="top" style="text-align: left" class="style25">&nbsp;</td>
                <td height="15" valign="top" style="text-align: left">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" style="text-align: left" class="style25">21. Vehicle Registeration No<br />
				  <div style="font-weight:bold;" id="VehicleRegNo" runat="server"></div></td>
                <td width="154" valign="top" valign="top" style="text-align: left" class="style24">22. Make<br />
                	  <div style="font-weight:bold;" id="Make" runat="server"></div>
                </td>
                </tr>
              
            <tr>
                <td colspan="2">
                <hr />
                </td>
                </tr>
              <tr>
      
                <td height="35" valign="top" style="text-align: left" class="style25">23. Model
                <div style="font-weight:bold;" id="VehicleModel" runat="server"></div>
                </td>
                <td height="35" valign="top" style="text-align: left"><span style="text-align: left">24. </span>Engine&nbsp; 
                
                     <div style="font-weight:bold;" id="Engine" runat="server"></div>
                </td>
                </tr>
                
                   <tr>
                <td colspan="2">
                <hr />
                </td>
                </tr>
              <tr>
                <td height="35" valign="top" style="text-align: left" class="style25">25. Transmission
                 <div style="font-weight:bold;" id="Transmission" runat="server"></div>
                </td>
                <td width="154" height="35" valign="top" style="text-align: left">26. BodyShape
                 <br /> <div style="font-weight:bold;" id="BodyShape" runat="server"></div>
                </td>
                </tr>
                
                   <tr>
                <td colspan="2">
                <hr />
                </td>
                </tr>
              <tr>
                <td height="35" valign="top" style="text-align: left" class="style25">27. Date Out<div style="font-weight:bold;" id="DateOut" runat="server"></div></td>
                <td height="35" valign="top" style="text-align: left">28. Date back<%--<div style="font-weight:bold;" id="DateBack" runat="server"></div>--%>
               <div style="font-weight:bold;" >Refer to invoice</div></td>
                </tr>
                
             <tr>
                <td colspan="2">
                <hr />
                </td>
                </tr>
                    <tr>
                <td height="35" valign="top" style="text-align: left" class="style25">29. Time Out <div style="font-weight:bold;" id="TimeOut" runat="server"></div></td>
                <td height="35" valign="top" style="text-align: left">30. Time back<%--<div style="font-weight:bold;" id="TimeBack" runat="server"></div>--%>
                <div style="font-weight:bold;" >Refer to invoice</div></td>
                </tr>
             
              </table></td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF" colspan="2"><hr/></td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF" class="style42">&nbsp;</td>
            <td height="20" align="left" bgcolor="#FFFFFF" style="padding:5px;"><p>31 Calculating the Charges</p>
              <p>The first 6 days of the Hire Period will be charged at the 1-6 day  rate, the next 21 days at the 7-27 day rate and any days over 27 days at the  28+ rate. The rate charged is for each complete day or any part of a day.<br />
                  <br />
                </p></td>
          </tr>
          
          <tr>
            <td bgcolor="#000000" class="style44"></td>
            <td align="left" bgcolor="#000000" style="padding:5px;" class="style45">
            
            <table style="width:319px; border:0px;" border="0" cellpadding="0" cellspacing="0" >            
            <tr>            
                 <td style="color:White;" class="style40">RATES</td>
                 <td style="color:White;">Charges</td>     
               
            </tr>
             
            </table>
            
            </td>
          </tr>
          
          
          <tr>
            <td bgcolor="#FFFFFF" colspan="2"><table border="0" cellpadding="0" cellspacing="0" style="height: 121px; width: 355px; text-align:left;">
           
              <tr>
                <td valign="middle" class="style27" style="padding-top:20px; width:200px;">Contractual Rate (Per Day): </td>
                <td valign="middle" class="style27" style="padding-top:20px;"><div id="AbiRate" runat="server" style="font-weight:bold;" ></div> </td>
              </tr>
              <tr><td style="height:5px;"></td>
              
               <tr>
                <td valign="middle" class="style27" style="width:200px;"  >ABI Handling Fee: </td>
                <td valign="middle" class="style27" style=""><div runat="server" id="ABIHandlingFEE" style="font-weight:bold"></div></td>
              
              
              
              
              </tr>   
              </tr>
                <td valign="middle" class="style27"  style="width:200px;">Delivery&nbsp; &amp; Collection Charges</td>
                <td valign="middle" class="style27"><div id="DeliveryCharges" runat="server" style="font-weight:bold; "></div></td>
              </tr>    
                   
       <tr>
                <td valign="middle" class="style27"  style="width:200px;" >No of Days: </td>
                <td valign="middle" class="style27" style="">Refer to Invoice<%--<div runat="server" id="NoOfDays" style="font-weight:bold;padding-left:70px;"></div>--%></td>
                </tr>
         <%--     
                 <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="2"><hr/></td>
          </tr>
              
                        <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="2"><hr/></td>
          </tr>--%>
          <%--      <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>--%>
      <%--   <tr>
                <td valign="middle" class="style27">Rental Charges: </td>
                <td valign="middle" class="style27" ><div id="RentalCharges1" runat="server" style="font-weight:bold;padding-left:40px;"></div></td>
              </tr> --%>    
             
           
           </td></tr>
           </table>
           
    
           
             
           <table>            
    
           
             <tr>
           
           <td style="background-color:Black;" class="style42"></td>
           
           <td style="background-color:Black; text-align:left; color:White; height:25px;">Extras</td>
           
           </tr>
           <tr>
           
           <td colspan="2">
           <table style="width: 355px" style="text-align:left;">
              
                      <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3" style="font-size:14px;">
             
                <img src="Images/extras111.jpg" />
            
            </td>
          </tr>
              <%--<tr>
                <td width="171" valign="middle" style="padding-top:10px;" class="style27">Estate Vehicles - £5.00 Per </td>
                <td width="76" height="35" class="style27"><div id="Estate" runat="server" style="font-weight:bold;"></div></td>
              </tr>--%>
     <%--                 <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>
         
              <tr>
                <td valign="middle" class="style27">Control Vehicles - £5.00 Per Day</td>
                <td height="35" valign="middle" class="style27"><div id="Control" runat="server" style="font-weight:bold;"></div></td>
              </tr>
              
                      <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>
              <tr>
                <td valign="middle" class="style27">Tow Bars or Baby Seats- £5.00 Per Day</td>
                <td height="35" valign="middle" class="style27">
                <div id="TowBars" runat="server" style="font-weight:bold;"></div></td>
              </tr>
                      <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>
              <tr>
                <td valign="middle" class="style27">Additional Driver- £5.00 Per Day</td>
                <td height="35" valign="middle" class="style27"><div id="Additional" runat="server" style="font-weight:bold;"></div></td>
              </tr>
                      <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>
              <tr>
                <td valign="middle" class="style27">Automatic - £5.00 Per Day</td>
                <td height="35" valign="middle" class="style27"><div id="Automatic" runat="server" style="font-weight:bold;"></div></td>
              </tr>
                      <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>
            --%>
        <%--              <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>--%>
    
             <%--         <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>--%>
     
                  <%--    <tr style="background-color:#EEE">
                <td valign="middle" class="style43">Hire Charges</td>
                <td height="35" valign="middle" class="style27" ><div id="HireCharges" runat="server" style="font-weight:bold;padding-left:5px;"></div></td>
              </tr>--%>
              
     <%--            <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>--%>
                     <%-- <tr style="background-color:#EEE">
                <td valign="middle" class="style43">Total&nbsp; VAT @20%</td>
                <td height="35" valign="middle" class="style27"><div id="TotalVat" runat="server" style="font-weight:bold;padding-left:5px;"></div></td>
              </tr>--%>
              
            <%--     <tr>

            <td height="10" bgcolor="#FFFFFF" colspan="3"><hr/></td>
          </tr>
               --%>     
                        <%--<tr style="background-color:#EEE">
                <td valign="middle"  class="style27"><b>Total</b> </td>
                <td height="35" valign="middle" class="style27"><div id="TotalCharges" runat="server" style="font-weight:bold;padding-left:5px;"></div></td>
              </tr>--%>

            </table>
           
               </td>
           
           </tr>
             
                    
         
        </table>
      <%--  </td>
      </tr>
    </table></td>
  </tr>
</table>--%>

<div style="text-align:center; width:1080px; padding-top:2px; font-size:12px; font-weight:bold;">**** This is an Exempt Consumer Credit Act Agreement under Article 3(I)(a) of the Consumer Credit(Exempt Agreements) Order 1989****</div>
       <div id="FooterValue" runat="server" style=" font-size:13px; width:800px; margin-top:-10px; margin-left:200px; text-align:center;"></div>
			     
      <%--<input type="image" value="Print" onclick="window.print(); return false;" src="../Images/Icons/document-print.png"  />--%>
     <a href="NewCarhireForm.aspx?ClaimID=64630" target="_blank"><img src="../Images/Icons/document-print.png" border="0" /></a>
 
    </form>
</body>
</html>
