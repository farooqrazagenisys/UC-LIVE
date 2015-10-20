<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="UploadDocument.aspx.cs" Inherits="UC_LIVE.UploadDocument" %>

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
            width: 154px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 950px; height: 558px; margin-right: 20px; background-color: White;"
        class="style8">
        <div class="MainHeading">
            Upload Document</div>
        <div id="Msg" runat="server">
        </div>
        <div style="width: 600x; margin-right: 20px; margin-left: 20px; background-color: #EEE;"
            class="style8">
            <table style="width: 600x;" class="style8">
                <tr>
                    <td>
                        <%--<div id="ClaimTitle" runat="server">
				</div>--%>
                        <div style="margin-left: 20px; margin-right: 20px; padding-bottom: 10px;">
                            <tr>
                                <td class="style8" style="width: 130px; padding-left: 12px;">
                                    <div style="padding-bottom: 5px;">
                                        Choose Contact Type</div>
                                    <asp:DropDownList ID="TemplateTypeID" runat="server" DataSourceID="TemplateDropDown"
                                        DataTextField="ContactTypeTitle" DataValueField="ContactTypeID" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="TemplateDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand="SELECT [ContactTypeID], [ContactTypeTitle] FROM [ContactType]">
                                    </asp:SqlDataSource>
                                    <br />
                                </td>
                       
                                <td>
                                  <div style="padding-bottom: 5px;">
                                        Choose Contact</div>
                                    <asp:DropDownList ID="ContactDropDownListList" runat="server" DataSourceID="ContactTitleDatasource"
                                        DataTextField="FirstName" DataValueField="ContactID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="ContactTitleDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand="SELECT * from Contact, ClaimContact where Contact.ContactTypeID=@ContactTypeID and ClaimContact.ClaimID=@ClaimID and ClaimContact.ContactID=Contact.ContactID">
                                        <SelectParameters>
                                   <asp:ControlParameter Name="ContactTypeID" ControlID="TemplateTypeID" Type="Int32" />
                                           <asp:QueryStringParameter QueryStringField="ClaimId" Name="ClaimID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
            </table>
            <table>
            
            
                <tr>
          <td style="width:5px;"></td>
                     <td class="style8" style="width: 110px; padding-bottom:10px;">
                        Document Title
                        <br />
                        <asp:TextBox ID="DocumentUpload" runat="server"></asp:TextBox>
                                				<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="DocumentUpload" 
                                Display="Dynamic" ValidationGroup="UploadDocument" 
                                >* </asp:RequiredFieldValidator>
              
                    </td>
             
                     <td class="style8" style="padding-bottom: 5px;  width: 130px; padding-left:12px;">
                        Upload File
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        		<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1"  ValidationGroup="UploadDocument"
                                Display="Dynamic"  
                                >* </asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
            </table>
          
            <table><tr>
            <td class="style8" style="padding-bottom: 20px;  width: 300px; padding-left:12px;">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload Document" ValidationGroup="UploadDocument" />
                    <asp:Button ID="CancelButton1" runat="server" Text="Cancel" 
                            onclick="CancelButton1_Click" />
                    
                    </td>
            </tr></table>
        </div>
    </div>
</asp:Content>
