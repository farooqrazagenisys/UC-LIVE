<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimAdviceForm.aspx.cs" Inherits="UC_LIVE.ClaimAdviceForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>Claim Advice Form</title>
<style type="text/css">
    .TextAreaStyle
        {
            
           border: 1px solid #EEE;
           overflow:hidden; 
   
            }
    .style1
    {
        width: 512px;
    }
    .style2
    {
        width: 134px;
    }
    .style3
    {
        width: 296px;
    }
    .style4
    {
        font-weight: bold;
    }
</style>
</head>
<body>
    <form id="form1" runat="server" style="margin-left:70px; font-family:Arial;">    


         <input type="image" value="Print" onclick="window.print(); return false;" src="../Images/Icons/document-print.png"  />
        
        <table style="margin-top: 0px; width:700px;" >
            <tr>
                <td colspan="4">
                         
        <div id="DocumentHeader" runat="server"></div>  <br /><br /> 
         <div id="insurancecompanydiv" runat="server" style="width:300px; margin-top:20px; margin-left:50px; float:left; font-family:Arial;height:70px;"></div>
        <div id="HireStartDate" runat="server" style='width:178px; font-weight:bold; margin-left:150px; margin-top:20px; float:left;  font-family:Microsoft Sans Serif; font-size:12px;'>
             
        </div>
        <div style="clear:both;  "></div>
        <br /><br /> <br /><br />
        <div style="text-align: center; width:700px; color:#1d398d; font-size:x-large;  font-family:Times New Roman;">
                        ABI General Terms of Agreement - New Claim Advice
                        
                        <div style="text-align: center; background-color:#FFF;color:#000; padding:10px; 
                            font-family:Times New Roman;">
                               Initial Notification:<br />
                               <br />
                               <span style="font-size:medium" class="style4">
                               *Please Note: For litigation enquiries please forward all correspondence to the 
                               appointed law firm. </span><div id="ClaimRef" style="font-size:45px;" runat="server"></div>
                          
                               
                      
                                   <div style="color: #1d398d; text-align:center;  margin-bottom:40px; padding-bottom: 0px;
                             font-family: Microsoft Sans Serif; font-size: 11px; border:solid 1px white; color:Black;">
                              <asp:DetailsView ID="DetailsView7" runat="server" AutoGenerateRows="False" 
                                  DataSourceID="SqlDataSource7" Height="24px" BackColor="White" BorderColor="#CCCCCC" 
                                           BorderStyle="None" BorderWidth="0px" CellPadding="4" ForeColor="Black" 
                                           GridLines="Horizontal">
                                  <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                  <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                  <Fields>
                                      <asp:BoundField DataField="DriverPolicyNo" HeaderText="TP Driver Policy No:" />
                                  </Fields>
                                  <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                  <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                              </asp:DetailsView>
                              <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=8">
                                  <SelectParameters>
                                      <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
               </div> </div>    </div>
                </td>
            </tr>
            <tr>
                <td class="style3">
                </td>
                <td class="style1" valign="top" style="font-family: Arail; font-size: 11px;">
                    <h3 style="color: #FFF; background-color:#203a8e; padding:5px; height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; text-align:center; padding-left: 10px;">
                        Your Client (Fault Driver Details)</h3>
                    
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID='8'">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                                       <br />
                          <div style="padding-left:2px;font-size:medium; font-weight:bold;"> Vehicle Details:</div><br />
                    
                                       <asp:DetailsView ID="DetailsView9" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource8"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="VehicleMake" HeaderText="Vehicle Make:" 
                                SortExpression="VehicleMake"  ItemStyle-Width="150" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="VehicleModel" HeaderText="Vehicle Model:" 
                                SortExpression="VehicleModel" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="VehicleReg" HeaderText="Vehicle Reg:" 
                                SortExpression="VehicleReg" HeaderStyle-Font-Bold="true"  />
                    
                                
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select Vehicle.VehicleMake, Vehicle.VehicleModel, Vehicle.VehicleReg from vehicle, ClaimContact, Claim where Claim.ClaimID = ClaimContact.ClaimID and Vehicle.VehicleOwnerId = ClaimContact.ContactID and ClaimContact.ContactTypeID=8 and ClaimContact.ClaimID = @ClaimId">
                   
                              <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                         <div style="padding-left:2px;font-size:medium; font-weight:bold;"> 
                  <br />
                  Accident Damage:<br /><br />
                    </div>
                    </div>
                   	<asp:DetailsView ID="DetailsView12" runat="server" AutoGenerateRows="False" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px" 
                            CellPadding="4" DataSourceID="DamagetoVehiSqlDataSource2" ForeColor="Black" 
                            GridLines="Vertical" Height="16px" Width="315px" 
                            Style="" >
						<FooterStyle BackColor="#CCCC99" />
						<RowStyle BackColor="#EEEEEE" />
						<PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
						<Fields>
							<asp:BoundField  HeaderText="Vehicle Roadworthy:" SortExpression="VehicleRoadworthy" ItemStyle-Width="150" HeaderStyle-Font-Bold="true" />
							<asp:BoundField HeaderText="Damage To Vehcle:" SortExpression="DamageToVehcle" HeaderStyle-Font-Bold="true"  />
												<asp:BoundField  HeaderText="Vehcle Status:" SortExpression="DamageToVehcle"  HeaderStyle-Font-Bold="true" />
						</Fields>
						<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"  />
						<EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White"  />
					    <AlternatingRowStyle BackColor="White" />
					</asp:DetailsView>
					<asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [VehicleRoadworthy], [DamageToVehcle] FROM [Claim] WHERE ([ClaimId] = @ClaimId)">
						<SelectParameters>
							<asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimID" Type="Int32" />
						</SelectParameters>
					</asp:SqlDataSource>
                        <br />
                </td>
                <td class="style2">
                </td>
                <td class="style8" valign="top" style="font-family: Arail; font-size: 11px;">
                    <h3 style="color: #FFF; background-color:#203a8e;  text-align:center; padding:5px;height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; padding-left: 10px;">
                        Our Client (Claimant) Details</h3>
                    <asp:DetailsView ID="DetailsView21" runat="server" AutoGenerateRows="False" DataSourceID="ClientSqlDataSource1"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="ClientSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=7">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                               <br />
                         <div style="padding-left:2px;font-size:medium; font-weight:bold;">Vehicle Details:</div><br />
                                    <asp:DetailsView ID="DetailsView10" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource9"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px" HeaderStyle-Font-Bold="true" >
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="VehicleMake" HeaderText="Vehicle Make:" 
                                SortExpression="VehicleMake"  ItemStyle-Width="150" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="VehicleModel" HeaderText="Vehicle Model:" 
                                SortExpression="VehicleModel" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="VehicleReg" HeaderText="Vehicle Reg:" 
                                SortExpression="VehicleReg" HeaderStyle-Font-Bold="true"  />
                                
                           
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        
                        
                        SelectCommand="select * from Claim , Vehicle where Claim.ClaimId = Vehicle.ClaimId and Claim.ClaimId=@ClaimId and VehicleType='ClientCar'">
                    
                           <SelectParameters>
                          <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
              <div style="padding-left:2px;font-size:medium; font-weight:bold;"> 
                  <br />
                  Accident Damage:<br />
                  <br />
                    </div>
                   	<asp:DetailsView ID="DetailsView28" runat="server" AutoGenerateRows="False" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px" 
                            CellPadding="4" DataSourceID="DamagetoVehiSqlDataSource2" ForeColor="Black" 
                            GridLines="Vertical" Height="16px" Width="315px" 
                            Style="" HeaderStyle-Font-Bold="true"  >
						<FooterStyle BackColor="#CCCC99" />
						<RowStyle BackColor="#EEEEEE" />
						<PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
						<Fields>
							<asp:BoundField DataField="VehicleRoadworthy" HeaderText="Vehicle Roadworthy:" SortExpression="VehicleRoadworthy" HeaderStyle-Font-Bold="true"  />
							<asp:BoundField DataField="DamageToVehcle" HeaderText="Damage To Vehicle:" SortExpression="DamageToVehcle"  HeaderStyle-Font-Bold="true" />
							<asp:BoundField  HeaderText="Vehcle Status:" SortExpression="DamageToVehcle:"  HeaderStyle-Font-Bold="true" />
						</Fields>
						<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
						<EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
					    <AlternatingRowStyle BackColor="White" />
					</asp:DetailsView>
					<asp:SqlDataSource ID="DamagetoVehiSqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [VehicleRoadworthy], [DamageToVehcle] FROM [Claim] WHERE ([ClaimId] = @ClaimId)">
						<SelectParameters>
							<asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimID" Type="Int32" />
						</SelectParameters>
					</asp:SqlDataSource>
                        <br />
                </td>
            </tr>
           
            <tr>
                <td class="style3">
                    &nbsp;
                </td>
                
                <td class="style1" valign="top" style="font-family: Arail; font-size: 11px;">
                    <h3 style="color: #FFF;  text-align:center; background-color:#203a8e; padding:5px; height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; padding-left: 10px;">
                        Accident Circumstances</h3>
                    <asp:DetailsView ID="DetailsView22" runat="server" AutoGenerateRows="False" DataKeyNames="ClaimId"
                        DataSourceID="ClaimSqlDataSourceCircumstances" BackColor="White" 
                        BorderColor="#DEDFDE" BorderStyle="None"
                        BorderWidth="0px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="16px"
                        Style="" Width="322px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="AccidentDate" HeaderText="Accident Date:" SortExpression="AccidentDate"
                                DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="AccidentLocation" HeaderText="Location:" SortExpression="AccidentLocation" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="AccidentInfo" HeaderText="Description:" SortExpression="AccidentInfo" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PoliceAttended" HeaderText="Police Involved:" SortExpression="PoliceAttended" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="AnyWitnesses" HeaderText="Any Witnesses:" SortExpression="AnyWitnesses" HeaderStyle-Font-Bold="true"  />
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="ClaimSqlDataSourceCircumstances" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [ClaimId], [AccidentDate],[AccidentLocation],[AccidentInfo],[InjuriesSustained], [AdditionalInfo],[AnyoneInjured],[PoliceAttended] , [AnyWitnesses]  FROM [Claim] WHERE ([ClaimId] = @ClaimId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                </td>
                   <td class="style1" valign="top" style="font-family: Arail; font-size: 11px;">
                     <h3 style="color: #FFF;  text-align:center; background-color:#203a8e; padding:5px; height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                            font-weight: bold; padding-left: 10px;"> Replacement Vehicle</h3>
                        
				                 <asp:DetailsView ID="DetailsView11" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource10"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" 
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:HyperLinkField Text="Yes" HeaderText="Replacement req'd: " 
                                HeaderStyle-Font-Bold="true" >  
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:HyperLinkField>
                                <asp:BoundField  HeaderText="Hire Arranged By: " 
                                SortExpression="CompanyAddressDetails" HeaderStyle-Font-Bold="true" 
                                DataField="CompanyAddressDetails">
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                                     <asp:BoundField DataField="VehicleGroupTitle" HeaderText="Group Required: " 
                                SortExpression="VehicleGroupTitle"  ItemStyle-Width="150" 
                                HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                                      <asp:BoundField DataField="DateTimeOut" HeaderText="Hire Start Date: " 
                                SortExpression="DateTimeOut"  DataFormatString="{0:dd-MMM-yyyy}" 
                                HeaderStyle-Font-Bold="true"  HtmlEncode="false">
                                
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                                
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                         
                           SelectCommand="SELECT     InvoiceDetails.VehicleID, VehicleGroup.VehicleGroupTitle, Invoice.CompanyAddressDetails, CarHireFormTable.DateTimeOut
FROM         CarHireFormTable INNER JOIN
                      Vehicle ON CarHireFormTable.VehicleMake = Vehicle.VehicleMake INNER JOIN
                      VehicleGroup ON Vehicle.VehicleGroupId = VehicleGroup.VehicleGroupId INNER JOIN
                      Invoice ON CarHireFormTable.ClaimID = Invoice.ClaimID INNER JOIN
                      InvoiceDetails ON InvoiceDetails.VehicleID = Vehicle.VehicleId AND Invoice.InvoiceID = InvoiceDetails.InvoiceID
WHERE     (CarHireFormTable.ClaimID = @ClaimID) AND (Invoice.InvoiceType = 'HIRE INVOICE') AND (Invoice.ClaimID =@ClaimID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource> 
                    <br />
                </td>
            </tr>
            <tr><td style="height:125px;"></td></tr>
            <tr>
               
                    <td class="style1" valign="top" 
                    style="font-family: Arail; font-size: 11px;">
   <%--                     <h3 style="color: #FFF; text-align:center; background-color:#203a8e; padding:5px; height: 20px; margin-left: 0px; width: 305px; 
                            font-size: 15px; font-weight: bold; padding-left: 10px;">
                            Witness 1</h3>
                        
                                       <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=6 and Contact.WitnessSequence=1">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                        <br />
                    </td>
                    <td class="style6">
                        &nbsp;
                    </td>
                    <td class="style9" valign="top">
   <%--                     <h3 style="color: #FFF;  text-align:center; background-color:#203a8e; padding:5px; height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                            font-weight: bold; padding-left: 10px;">
                            Witness 2</h3>
                                  <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=6 and Contact.WitnessSequence=2">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                    </td>
                </td>
            </tr>
            <tr><td style="height:19px;"></td></tr>
            <tr>
                <td class="style3">
                    <td class="style1" valign="top" 
                    style="font-family: Arail; font-size: 11px;">
                        <h3 style="color: #FFF;  text-align:center; background-color:#203a8e;  padding:5px;height: 20px; margin-left: 0px; width: 305px; 
                            font-size: 15px; font-weight: bold; padding-left: 10px;">
                            Engineer Details</h3>
					
                   <asp:DetailsView ID="DetailsView5" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource5"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                               <asp:BoundField DataField="Company" HeaderText="Company Name:" 
                                SortExpression="Company" HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                        
                        
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=3">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
					<br />
					<asp:DetailsView ID="DetailsView8" runat="server" AutoGenerateRows="False" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px" 
                            CellPadding="4" DataSourceID="VehicleInspectionSqlDataSource1" 
                            ForeColor="Black" GridLines="Vertical" Height="32px" Width="265px" 
                            Style="" >
						<FooterStyle BackColor="#CCCC99" />
						<RowStyle BackColor="#EEEEEE" />
						<PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
						<Fields>
							<asp:BoundField DataField="DateReceived" HeaderText="DateReceived" SortExpression="DateReceived"  HeaderStyle-Font-Bold="true" />
							<asp:BoundField DataField="DateInstructed" HeaderText="DateInstructed" SortExpression="DateInstructed" HeaderStyle-Font-Bold="true" />
							<asp:BoundField DataField="ClaimId" HeaderText="ClaimId" SortExpression="ClaimId" HeaderStyle-Font-Bold="true"  />
						</Fields>
						<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
						<EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
					    <AlternatingRowStyle BackColor="White" />
					</asp:DetailsView>
					<asp:SqlDataSource ID="VehicleInspectionSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DateReceived, DateInstructed, ClaimId FROM EngineerReport WHERE (ClaimId = @ClaimId)">
							<SelectParameters>
            <asp:QueryStringParameter Name="ClaimID"
QueryStringField="ClaimID" Type="Object" />
        </SelectParameters>
					</asp:SqlDataSource>
					<br />
					<asp:DetailsView ID="DetailsView14" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="HireID" DataSourceID="CarHireSqlDataSource1" Height="16px" 
                            Width="264px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                            BorderWidth="0px" CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                            Style="" >
						<FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
						<Fields>
							<asp:BoundField DataField="HireStartDate" HeaderText="HireStartDate" SortExpression="HireStartDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderStyle-Font-Bold="true"  />
							<asp:BoundField DataField="HireEndDate" HeaderText="HireEndDate" SortExpression="HireEndDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderStyle-Font-Bold="true" />
						</Fields>
						<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
					</asp:DetailsView>
					<asp:SqlDataSource ID="CarHireSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [VehicleHire] where ClaimId=@ClaimId">
						<SelectParameters>
							<asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
						</SelectParameters>
					</asp:SqlDataSource>
                        <br />
                    </td>
                    <td class="style6">
                        &nbsp;
                    </td>
                       <td class="style1" valign="top" style="font-family: Arail; font-size: 11px;">
                        <h3 style="color: #FFF;  text-align:center; background-color:#203a8e; height: 20px; padding:5px; margin-left: 0px; width: 305px; font-size: 15px;
                            font-weight: bold; padding-left: 10px;">
                            Storage Details</h3>
                            
					
                   <asp:DetailsView ID="DetailsView6" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource6"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                               <asp:BoundField DataField="Company" HeaderText="Company Name:" 
                                SortExpression="Company" HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=5">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                            
                    <br />
                            
				<asp:DetailsView ID="DetailsView15" runat="server" AutoGenerateRows="False" 
                            DataSourceID="StroageSqlDataSource1" Height="21px" Width="286px" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px" 
                            CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                            Style="">
					<FooterStyle BackColor="#CCCC99" />
					<RowStyle BackColor="#EEEEEE" />
					<PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
					<Fields>
						<asp:BoundField DataField="StorageStartDate" HeaderText="StorageStartDate" SortExpression="StorageStartDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderStyle-Font-Bold="true" />
						<asp:BoundField DataField="StorageEndDate" HeaderText="StorageEndDate" SortExpression="StorageEndDate"  DataFormatString="{0:dd-MMM-yyyy}" HeaderStyle-Font-Bold="true" />
						<asp:BoundField DataField="VehicleRepairedFrom" HeaderText="VehicleRepairedFrom" SortExpression="VehicleRepairedFrom" HeaderStyle-Font-Bold="true"  />
						<asp:BoundField DataField="StorageNoOfDays" HeaderText="StorageNoOfDays" SortExpression="StorageNoOfDays" DataFormatString="{0:dd-MMM-yyyy}" HeaderStyle-Font-Bold="true" />
					</Fields>
					<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
					<EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
				    <AlternatingRowStyle BackColor="White" />
				</asp:DetailsView>
				<asp:SqlDataSource ID="StroageSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StorageStartDate], [StorageEndDate], [VehicleRepairedFrom], [StorageNoOfDays] FROM [VehicleStorage] where ClaimId=@ClaimId">
					<SelectParameters>
						<asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
					</SelectParameters>
				</asp:SqlDataSource>
                    </td>
                </td>
            </tr>
            <tr>
    <td class="style3">
    <td class="style1" valign="top" style="font-family:Microsoft Sans Serif; font-size: 11px;" colspan="3">
  <h3 
            
            style="color: #FFF;  text-align:center; background-color:#203a8e; height: 20px; margin-left: 0px; width: 672px; font-size: 15px;
  font-weight: bold; padding-left: 10px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;">  Solicitor Details</h3>               
 <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource2"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" 
            Height="24px" Style=""
                        Width="683px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                                   <asp:BoundField DataField="Company" HeaderText="Company Name:" 
                                SortExpression="Company" HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" 
                                SortExpression="FirstName" HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" 
                                SortExpression="Surname" HeaderStyle-Font-Bold="true"  >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" 
                                SortExpression="Address1" HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" 
                                SortExpression="Address2" HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" 
                                HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" 
                                SortExpression="PostCode" HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" 
                                HeaderStyle-Font-Bold="true" >
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=2">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        <br />
                       
                    </td>

                    
                </td>
            </tr>
        </table>
        
   
    
    
      <div id="FooterValue" runat="server" style="text-align:center; width:650px; margin-top:300px; margin-left:50px; "></div>
    
    
    
    </form>
</body>
</html>
