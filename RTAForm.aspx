<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RTAForm.aspx.cs" Inherits="UC_LIVE.RTAForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style>
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
            width: 20px;
        }
    .style3
    {
        height: 211px;
    }
    .style4
    {
        width: 512px;
        height: 211px;
    }
    .style5
    {
        width: 20px;
        height: 211px;
    }
        .style6
        {
            height: 618px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="font-family:Arial">
    <div style="margin-left:80px;">
     
     <input type="image" value="Print" onclick="window.print(); return false;" src="../Images/Icons/document-print.png"  />
        
        <div id="DocumentHeader" runat="server"></div>   
        <div id="solicitoraddress" runat="server" style='width:360px; margin-left:50px; margin-top:40px; float:left;  font-family:Arial;     height:80px;'></div>
        <div id="HireStartDate" runat="server" style='width:178px; font-weight:bold; margin-left:100px; margin-top:40px; float:left;  font-family:Arial; height:60px; font-size:12px;'>
</div>



<%--<div id="test" server" style='width:278px; margin:20px;float:left;  font-family:Arial;     height:80px;'></div>--%>
    
        <%--<div id="insurancecompanydiv" runat="server" style='width:278px; margin:20px;float:left;  font-family:Arial;     height:80px;'></div>--%>
      <%--  <div id="HireStartDate" runat="server" style='width:278px; font-weight:bold; margin-left:200px; margin-top:20px; float:left;  font-family:Arial;     height:60px; font-size:12px;'>--%>
        <br />
        
            
     
       
      
               <div style="clear:both;"></div>
        
        
        
        
        <div style="font-family: Arail; font-size: small; font-family: Arail;
        font-size: 11px; padding: 2px;" id="Actions">
        
        
        <table style="width: 700px; margin-left:-80px; margin-top: 2px; font-family: Arail; font-size: 11px;" align="center">
            <tr>
                <td colspan="4" align="center" style="text-align: center; font-family: Arail;
                    font-size: 11px;" valign="top">
                   
                    <h2 style="text-align: center; background-color:#FFF;color:#1d398d; padding:5px; padding-top:2px; font-family:Times New Roman;">
                        Road Traffic Accident                  
                        CLAIM FORM 
                      
                        <br />
                            <div style="text-align: center; background-color:#FFF;color:#000; padding:10px; font-family:Times New Roman;">
                               Initial Notification:
                             
                                <div id="ClaimRef" style="font-size:45px; font-weight:normal;" runat="server"></div>
                                   <div style="color: #1d398d;  margin-left: 10px;  padding-bottom: 0px;
                             font-family: Arial; font-size: 11px; border:solid 1px white; color:Black;">
                              <%--<asp:DetailsView ID="DetailsView7" runat="server" AutoGenerateRows="False" 
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
                              </asp:DetailsView>--%>
                              <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId">
                                  <SelectParameters>
                                      <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
           </div>
                </td>
            </tr>
            <tr>
                <td class="style13">
                </td>
                <td class="style1" valign="top" style="font-family: Arail; font-size: 11px;">
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
                            <asp:BoundField DataField="Company" HeaderText="Company Name:" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />

                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                            
                           <asp:BoundField DataField="DOB" HeaderText="D.O.B:" SortExpression="DOB" HeaderStyle-Font-Bold="true"  DataFormatString="{0:dd-MMM-yyyy}"  />
                            <asp:BoundField DataField="NINo" HeaderText="N.I No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                             <asp:BoundField DataField="DriverInsurers" HeaderText="Insurer:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        <asp:BoundField DataField="DriverPolicyNo" HeaderText="Policy No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                         
                        
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
                          <div style="padding-left:2px;font-size:medium; font-weight:bold; color:Black;"> Vehicle Details:</div><br />
                    
                                       <asp:DetailsView ID="DetailsView9" runat="server" 
                        AutoGenerateRows="False" DataSourceID="SqlDataSource9"
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
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="select Vehicle.VehicleMake, Vehicle.VehicleModel, Vehicle.VehicleReg from vehicle, ClaimContact, Claim where Claim.ClaimID = ClaimContact.ClaimID and Vehicle.VehicleOwnerId = ClaimContact.ContactID and ClaimContact.ContactTypeID=8 and ClaimContact.ClaimID = @ClaimId">
                   
                              <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                         <div style="padding-left:2px;font-size:medium; font-weight:bold;"> 
                             <br />
                             Vehicle Owner:<br />
                             <br />
                       </div>
                 
                    <asp:DetailsView ID="DetailsView29" runat="server" AutoGenerateRows="False" DataSourceID="ClientSqlDataSource2"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                           
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />
                             <asp:BoundField DataField="Company" HeaderText="Company:" SortExpression="Company" HeaderStyle-Font-Bold="true"  />
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
                    
                 
                    <asp:SqlDataSource ID="ClientSqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        
                                 SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=9">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                             <br />
                    <br /><br /><br />
              <div style="padding-left:2px;font-size:medium; font-weight:bold;"> 
                  Accident Damage:</div>
                    <br />
                   	<asp:DetailsView ID="DetailsView12" runat="server" AutoGenerateRows="False" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px" 
                            CellPadding="4" DataSourceID="SqlDataSource11" ForeColor="Black" 
                            GridLines="Vertical" Height="16px" Width="315px" 
                            Style="" >
						<FooterStyle BackColor="#CCCC99" />
						<RowStyle BackColor="#EEEEEE" />
						<PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
						<Fields>
							<asp:BoundField  HeaderText="VehicleRoadworthy:" 
                                SortExpression="VehicleRoadworthy" ItemStyle-Width="150" 
                                HeaderStyle-Font-Bold="true" DataField="VehicleRoadworthy" />
							<asp:BoundField HeaderText="DamageToVehcle:" SortExpression="DamageToVehcle" 
                                HeaderStyle-Font-Bold="true" DataField="DamageToVehcle"  />
                                <asp:BoundField HeaderText="Vehicle Status:" SortExpression="DamageToVehcle" 
                                HeaderStyle-Font-Bold="true"  />
						</Fields>
						<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"  />
						<EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White"  />
					    <AlternatingRowStyle BackColor="White" />
					</asp:DetailsView>
					<asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT Vehicle.VehicleRoadworthy, Claim.DamageToVehcle FROM Claim, Vehicle WHERE Claim.ClaimId = @ClaimId and Vehicle.ClaimId = Claim.ClaimId and Vehicle.VehicleType='ClientCar'">
						<SelectParameters>
							<asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimID" Type="Int32" />
						</SelectParameters>
					</asp:SqlDataSource>
                        <br />
                          <br />
                    
                    </div>
                    
                </td>
                <td class="style2">
                </td>
                <td class="style8" valign="top" style="font-family: Arail; font-size: 11px;">
                    <h3 style="color: #FFF; background-color:#203a8e; padding:5px; height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; text-align:center; padding-left: 10px;">
                        Party at Fault ( Defendant&#39;s Details)</h3>
                    
                    <asp:DetailsView ID="DetailsView31" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="Company" HeaderText="Company Name:" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />

                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                            
                           <asp:BoundField DataField="DOB" HeaderText="D.O.B:" SortExpression="DOB" HeaderStyle-Font-Bold="true"  DataFormatString="{0:dd-MMM-yyyy}"  />
                            <asp:BoundField DataField="NINo" HeaderText="N.I No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                           
                        <asp:BoundField DataField="DriverPolicyNo" HeaderText="Policy No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                         
                        
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
                    
                          <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource10"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <Fields>
                         <asp:BoundField DataField="Company" HeaderText="Insurer:" 
                                HeaderStyle-Font-Bold="true"   ItemStyle-Width="150" >                        
                        
                        
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                        
                        
                        </Fields>
                    </asp:DetailsView>
                   
                   
                   
                   
                   
                   
                   <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID='1'">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                         <div style="padding-left:2px;font-size:medium; font-weight:bold;">  Vehicle Details:</div><br />
                                    <asp:DetailsView ID="DetailsView10" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource12"
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
                             Vehicle Owner: [ N / A ]<br />
                             <br />
                       </div>
                 
                    <asp:DetailsView ID="DetailsView30" runat="server" AutoGenerateRows="False" DataSourceID="ClientSqlDataSource3"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                           
                            <asp:BoundField HeaderText="First Name:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />
                                                       <asp:BoundField HeaderText="Company:" SortExpression="Company" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField  HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField  HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField  HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                     
                           
                        
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    
                 
                    <asp:SqlDataSource ID="ClientSqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        
                                 
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=9">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
              <div style="padding-left:2px;font-size:medium; font-weight:bold;"> 
                        <br />
                    <br /><br /> 
                  Accident Damage: [ N / A ]<br />
                  <br />
                    </div>
                   	<asp:DetailsView ID="DetailsView32" runat="server" AutoGenerateRows="False" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px" 
                            CellPadding="4" DataSourceID="DamagetoVehiSqlDataSource2" ForeColor="Black" 
                            GridLines="Vertical" Height="16px" Width="315px" 
                            Style="" >
						<FooterStyle BackColor="#CCCC99" />
						<RowStyle BackColor="#EEEEEE" />
						<PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
						<Fields>
							<asp:BoundField  HeaderText="VehicleRoadworthy:" 
                                SortExpression="VehicleRoadworthy" ItemStyle-Width="150" 
                                HeaderStyle-Font-Bold="true"  />
							<asp:BoundField HeaderText="DamageToVehcle:" SortExpression="DamageToVehcle" 
                                HeaderStyle-Font-Bold="true"   />
                                <asp:BoundField HeaderText="Vehicle Status:" SortExpression="DamageToVehcle" 
                                HeaderStyle-Font-Bold="true"  />
						</Fields>
						<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"  />
						<EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White"  />
					    <AlternatingRowStyle BackColor="White" />
					</asp:DetailsView>
					<asp:SqlDataSource ID="DamagetoVehiSqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [VehicleRoadworthy], [DamageToVehcle] FROM [Claim] WHERE ([ClaimId] = @ClaimId)">
						<SelectParameters>
							<asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimID" Type="Int32" />
						</SelectParameters>
					</asp:SqlDataSource>
                    
                   
                </td>
            </tr>
            <tr>
                <td class="style10">
                    &nbsp;
                </td>
                <td class="style1" valign="top" style="font-family: Arail; font-size: 11px;">
                    <h3 style="color: #FFF;  text-align:center; background-color:#203a8e; padding:5px; height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; padding-left: 10px;">
                        Accident Details</h3>
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
                           
                             <asp:BoundField DataField="RoadCondition" HeaderText="Road Condition:" SortExpression="RoadCondition"
                   HeaderStyle-Font-Bold="true" />
                           
                            <asp:BoundField DataField="ClaimTitle" HeaderText="Description:" SortExpression="AccidentInfo" HeaderStyle-Font-Bold="true" />
<%--                        <asp:BoundField DataField="AnyWitnesses" HeaderText="Any Witnesses:" SortExpression="AnyWitnesses" HeaderStyle-Font-Bold="true"  />--%>
                            <asp:BoundField DataField="PoliceAttended" HeaderText="Police Involved:" SortExpression="PoliceAttended" HeaderStyle-Font-Bold="true" />
                          
                      <asp:BoundField DataField="PoliceOfficerName" HeaderText="Police Officer Name:" SortExpression="PoliceAttended" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PoliceLogNo" HeaderText="Police Log No:" SortExpression="AnyWitnesses" HeaderStyle-Font-Bold="true"  />
                     
                     
                     
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="ClaimSqlDataSourceCircumstances" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [ClaimId],[RoadCondition], [AccidentDate],[PoliceOfficerName], [PoliceLogNo], [AccidentLocation],[ClaimTitle],[InjuriesSustained], [AdditionalInfo],[AnyoneInjured],[PoliceAttended] , [AnyWitnesses]  FROM [Claim] WHERE ([ClaimId] = @ClaimId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="style2">
                </td>
                <td class="style8" valign="top" style="font-family: Arail; font-size: 11px;">
  <h3 style="color: #FFF;  text-align:center; background-color:#203a8e; padding:5px; height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; padding-left: 10px;">                       
                        Accident Circumstances</h3>
             
                                <asp:DetailsView ID="DetailsView2" runat="server" 
                        AutoGenerateRows="False" DataSourceID="SqlDataSource2"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="153px" Style="margin-bottom: 9px"
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="Accidentinfo" HeaderText="" 
                                SortExpression="FirstName" HeaderStyle-Font-Bold="true" >
                           
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                           
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                </td>
            </tr>
            <tr>
                <td class="style7">
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
                    <td class="style2">
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
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [Accidentinfo], [AccidentDate],[PoliceOfficerName], [PoliceLogNo], [AccidentLocation],[ClaimTitle],[InjuriesSustained], [AdditionalInfo],[AnyoneInjured],[PoliceAttended] , [AnyWitnesses]  FROM [Claim] WHERE ([ClaimId] = @ClaimId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    <td class="style1" valign="top" 
                    style="font-family: Arail; font-size: 11px;">
                    <h3 style="color: #FFF; background-color:#203a8e;  text-align:center; padding:5px;height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; padding-left: 10px;">
                        GP Details</h3>
                        
                    <asp:DetailsView ID="DetailsView23" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                           
                            
                            <asp:BoundField DataField="Surname" HeaderText="Surgery Name:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />
<asp:BoundField DataField="FirstName" HeaderText="GP Name:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                                <asp:BoundField DataField="InjuriesSustained" HeaderText="Injuries Sustained:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                            
<%--                           <asp:BoundField DataField="DOB" HeaderText="D.O.B:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="NINo" HeaderText="N.I No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                             <asp:BoundField DataField="DriverInsurers" HeaderText="Insurer:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        <asp:BoundField DataField="DriverPolicyNo" HeaderText="Policy No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />--%>
                           
                        
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                   <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=11">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                        <br />
                        
                </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                    <td class="style9" valign="top">
                    <h3 style="color: #FFF; background-color:#203a8e;  text-align:center; padding:5px;height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; padding-left: 10px;">
                        Hospital Details</h3>
                        
                    <asp:DetailsView ID="DetailsView24" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                         
                            <asp:BoundField DataField="FirstName" HeaderText="Hospital Name:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Surname" HeaderText="Department:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />

                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="OtherLosses" HeaderText="Other Losses:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                            
                        <%--   <asp:BoundField DataField="DOB" HeaderText="D.O.B:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="NINo" HeaderText="N.I No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                             <asp:BoundField DataField="DriverInsurers" HeaderText="Insurer:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        <asp:BoundField DataField="DriverPolicyNo" HeaderText="Policy No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                           --%>
                        
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                       <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=10">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                        </td>
                </td>
            </tr>
             <tr>
            
            <td>
            
            </td>
            <td colspan="3">
            
  <h3 
                    
                    style="color: #FFF;  text-align:center; background-color:#203a8e; height: 20px; margin-left: 0px; width: 667px; font-size: 15px;
                        font-weight: bold; padding-left: 10px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;">                       
                        Who was to blame & Why</h3>
                              
                                <asp:DetailsView ID="DetailsView25" runat="server" 
                        AutoGenerateRows="False" DataSourceID="SqlDataSource8"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="130px" Style=""
                        Width="681px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="WhotoBlame" HeaderText="" 
                                SortExpression="WhotoBlame" HeaderStyle-Font-Bold="true" >
                           
<HeaderStyle Font-Bold="True"></HeaderStyle>
                            </asp:BoundField>
                           
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                                 <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
  SelectCommand="SELECT [WhotoBlame], [AccidentDate],[PoliceOfficerName], [PoliceLogNo], [AccidentLocation],[ClaimTitle],[InjuriesSustained], [AdditionalInfo],[AnyoneInjured],[PoliceAttended] , [AnyWitnesses]  FROM [Claim] WHERE ([ClaimId] = @ClaimId)">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
             <br />
            </td>
        
               <br />
            </tr>
    
    <tr>
 
                <td class="style3">
                    <td class="style4" valign="top" 
                    style="font-family: Arail; font-size: 11px;">
                    <h3 style="color: #FFF; background-color:#203a8e;  text-align:center; padding:5px;height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; padding-left: 10px;">
                        Witness(1) Details</h3>
                        
                    <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource5"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                           
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                               
<%--                           <asp:BoundField DataField="DOB" HeaderText="D.O.B:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="NINo" HeaderText="N.I No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                             <asp:BoundField DataField="DriverInsurers" HeaderText="Insurer:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        <asp:BoundField DataField="DriverPolicyNo" HeaderText="Policy No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />--%>
                           
                        
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                   <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=6 and WitnessSequence=1">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                        <br />
                        
                </td>
                    <td class="style5">
                        &nbsp;
                    </td>
                    <td class="style3" valign="top">
                    <h3 style="color: #FFF; background-color:#203a8e;  text-align:center; padding:5px;height: 20px; margin-left: 0px; width: 305px; font-size: 15px;
                        font-weight: bold; padding-left: 10px;">
                        Witness(2) Details</h3>
                        
                    <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource6"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px"
                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="24px" Style=""
                        Width="319px">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#EEEEEE" />
                        <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                         
                                   <asp:BoundField DataField="FirstName" HeaderText="FirstName:" SortExpression="FirstName" ItemStyle-Width="150" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address1" HeaderText="Address1:" SortExpression="Address1" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Address2" HeaderText="Address2:" SortExpression="Address2" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PostCode" HeaderText="Post Code:" SortExpression="PostCode" HeaderStyle-Font-Bold="true"  />
                            <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone" HeaderStyle-Font-Bold="true"  />
                       
                        <%--   <asp:BoundField DataField="DOB" HeaderText="D.O.B:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="NINo" HeaderText="N.I No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                             <asp:BoundField DataField="DriverInsurers" HeaderText="Insurer:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                        <asp:BoundField DataField="DriverPolicyNo" HeaderText="Policy No:" SortExpression="Phone" HeaderStyle-Font-Bold="true" />
                           --%>
                        
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                       <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
 SelectCommand="Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=6 and WitnessSequence=2">
                          <SelectParameters>
                            <asp:QueryStringParameter Name="ClaimId" QueryStringField="ClaimId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                        </td>
                </td>
              
   
            </tr>
            <tr>  <td colspan="4" class="style6">
                             
          
                <div id="FooterValue" runat="server" style="clear:both;text-align:center; margin-top:200px; "></div>
                </td></tr>
           
        </table>
    </div>       
 
    </div>
    </form>
</body>
</html>
