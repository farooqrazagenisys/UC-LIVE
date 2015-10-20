<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddEngineerReport.aspx.cs" Inherits="UC_LIVE.AddEngineerReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
        #Text1
        {
            height: 24px;
            width: 291px;
        }
        #Text2
        {
            height: 24px;
            width: 163px;
        }
        .style9
     {
         font-size: 12px;
         font-family: Microsoft Sans Serif;
         color: #666666;
         width: 282px;
     }
        .style12
     {
         font-size: 12px;
         font-family: Microsoft Sans Serif;
         color: #666666;
         width: 16px;
     }
        .style13
     {
         font-size: 12px;
         font-family: Microsoft Sans Serif;
         color: #666666;
         width: 280px;
     }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="width: 950px; height: 558px; margin-right: 20px; background-color: White;"
        class="style8">
        <div class="MainHeading">
            Upload Engineer Report</div>
        <div id="Msg" runat="server">
        </div>
        <div style="width:600px; margin-right: 20px; margin-left: 20px; background-color: #EEE;"
            class="style8">
  <table style="width: 600x;" class="style8">
     
            </table>
            <table>
                <tr>
                  <%--  <td class="style8" style="padding-bottom: 5px; padding-left: 10px; width: 130px;">
                        Date Inspected
                        <asp:TextBox ID="DateInspected" runat="server"></asp:TextBox>
                        <cc1:calendarextender ID="Calendarextender1" runat="server" Enabled="True" TargetControlID="DateInspected"
                            Format="dd/MM/yyyy">
                        </cc1:calendarextender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid Date Required"
                            ControlToValidate="DateInspected" Display="Dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
                    </td>
                    <td class="style8" style="width: 110px; padding-top:10px;">
                        Date Instructed
                        <asp:TextBox ID="DateInstructed" runat="server"></asp:TextBox>
                        <cc1:calendarextender ID="Calendarextender2" runat="server" Enabled="True" TargetControlID="DateInstructed"
                            Format="dd/MM/yyyy">
                        </cc1:calendarextender>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ErrorMessage="Valid Date Required" ControlToValidate="DateInstructed" Display="Dynamic" ValidationGroup="UploadDocument"
                            ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$"  />
                    </td>--%>
                
                </tr>
            </table>
            <table>
                <tr>     <td class="style12" style="padding-bottom:10px;">
                         &nbsp;</td>
                    <td class="style9" style="padding-bottom:10px;">
                         Report Title
                        <br />
                        <asp:TextBox ID="DocumentUpload" runat="server" Text="Engineer Report"></asp:TextBox>
                                  				<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="DocumentUpload" 
                                Display="Dynamic"  ValidationGroup="UploadDocument"
                                >* </asp:RequiredFieldValidator>
              
                    </td>
                     <%-- <td class="style8" style="padding-bottom: 5px; padding-left: 10px; width: 130px;">
                        Date Recieved
                        <br />
                        <asp:TextBox ID="DateReceived" runat="server"></asp:TextBox>
                        <cc1:calendarextender ID="AccidentDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="DateReceived" Format="dd/MM/yyyy">
                        </cc1:calendarextender>
                        &nbsp;<asp:RegularExpressionValidator ID="DateValidator2" runat="server" ErrorMessage="Valid Date Required"
                            ControlToValidate="DateReceived" ValidationGroup="UploadDocument" Display="Dynamic" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" />
                    </td>--%>
             
               
                </tr>
                <tr>     <td class="style12" style="padding-bottom:10px;">
                         &nbsp;</td>
                    <td class="style9" style="padding-bottom:10px;">
                         Engineers Fees (Without VAT)<br />
                         <asp:TextBox ID="DocAmount" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                             ControlToValidate="DocAmount" Display="Dynamic" 
                             ValidationGroup="UploadDocument">* </asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                             ControlToValidate="DocAmount" Display="Dynamic" ErrorMessage="" Text="*" 
                             ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$" 
                             ValidationGroup="UploadDocument" />
                    </td>
                       <td class="style13" style="padding-bottom: 20px">
                           &nbsp;</td>
              
                   <td class="style8" style="padding-bottom: 5px;  width: 130px; padding-left:12px;">
                        &nbsp;</td>
               
                </tr>
                <tr>     <td class="style12" style="padding-bottom:10px;">
                         &nbsp;</td>
                    <td class="style9" style="padding-bottom:10px;">
                         Upload Report File
                         <br />
                         <asp:FileUpload ID="FileUpload1" runat="server" />
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                             ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="" Text="*" 
                             ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$" 
                             ValidationGroup="UploadDocument" />
                    </td>
                       <td class="style13" style="padding-bottom: 20px">
                           &nbsp;</td>
              
                   <td class="style8" style="padding-bottom: 5px;  width: 130px; padding-left:12px;">
                        &nbsp;</td>
               
                </tr>
            </table>
            <table><tr>
            <td class="style8" style="padding-bottom: 20px;  width: 300px; padding-left:12px;">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload Document" />
                 	<asp:Button ID="CancelButton1" runat="server" Text="Cancel" onclick="CancelButton1_Click" 
        />
                 
                    </td>
            </tr></table>
        </div>
    </div>
</asp:Content>
