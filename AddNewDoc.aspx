<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="AddNewDoc.aspx.cs" Inherits="UC_LIVE.AddNewDoc" ValidateRequest="false" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            height: 454px;
            width: 897px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: White;">
        <div class="MainHeading" style="float:left;">
            Add New Document
        </div>
       <div style="float:right; margin-right:25px; margin-top:8px;"> <asp:Button ID="CancelButton1" runat="server" 
               Text="Cancel" onclick="CancelButton1_Click" 
                       /></div>
        
        <div id="Msg" runat="server">
        </div>
        <table style="width: 900px; vertical-align: top; margin-left: 18px; margin-top: 5px;
            height: 60px; background-color: #EEEEEE;"  class="style8">
            <tr>
                <td valign="top" style="padding-left: 12px; padding-top: 10px; width:130px;">
                    <div style="padding-bottom:5px;">Select Header Type</div>
                    
                    <asp:DropDownList ID="TemplateTypeID" runat="server" DataSourceID="TemplateDropDown"
                        DataTextField="ContactTypeTitle" DataValueField="ContactTypeID" AutoPostBack="True"
                        OnSelectedIndexChanged="TemplateTypeID_SelectedIndexChanged" OnLoad="TemplateTypeID_Load">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="TemplateDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [ContactTypeID], [ContactTypeTitle] FROM [ContactType]">
                    </asp:SqlDataSource>
                </td>
                <td style="padding-top: 10px; width: 130px; padding-bottom: 10px;">
                    <div style="padding-bottom:5px;">Header Contact</div>
                    
                    <asp:DropDownList ID="ContactDropDownMain" runat="server" DataSourceID="ContactTitleDatasource0"
                        DataTextField="FirstName" DataValueField="ContactID" Width="120">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ContactTitleDatasource0" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT * from Contact, ClaimContact where Contact.ContactTypeID=@TemplateTypeID and ClaimContact.ClaimID=@ClaimID and ClaimContact.ContactID=Contact.ContactID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TemplateTypeID" Name="TemplateTypeID" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:QueryStringParameter QueryStringField="ClaimId" Name="ClaimID" Type="Int32">
                            </asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                        <td valign="top" style="padding-top:10px; width:130px; padding-bottom: 10px;">
               <div style="padding-bottom:5px;">     Select Body Type</div>

                    <asp:DropDownList ID="TemplateTypeID0" runat="server" DataSourceID="TemplateDropDown0"
                        DataTextField="ContactTypeTitle" DataValueField="ContactTypeID" AutoPostBack="True"
                        OnSelectedIndexChanged="TemplateTypeID_SelectedIndexChanged" OnLoad="TemplateTypeID_Load">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="TemplateDropDown0" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [ContactTypeID], [ContactTypeTitle] FROM [ContactType]">
                    </asp:SqlDataSource>
                </td>
                <td >
                   <div style="padding-bottom:5px; width:120px;">Body&nbsp; Contact</div>  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="FirstName" DataValueField="ContactID" Width="120">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT * from Contact, ClaimContact where Contact.ContactTypeID=@TemplateTypeID0 and ClaimContact.ClaimID=@ClaimID and ClaimContact.ContactID=Contact.ContactID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TemplateTypeID0" Name="TemplateTypeID0" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:QueryStringParameter QueryStringField="ClaimId" Name="ClaimID" Type="Int32">
                            </asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                 <td style="width:150px;">
                   
                      <div style="padding-bottom:5px;">Choose Template </div><asp:DropDownList ID="TemplateIDDropdown" runat="server" DataSourceID="TemplatesDropdown"
                        DataTextField="TemplateTitle" DataValueField="TemplateID" AutoPostBack="True"
                        OnSelectedIndexChanged="TemplateIDDropdown_SelectedIndexChanged" OnLoad="TemplateIDDropdown_Load" Width="140">
                        <asp:ListItem Value="0" Text="Not Selected" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="TemplatesDropdown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT [TemplateID], [TemplateTitle], [TemplateTypeID] FROM [DocumentTemplate] WHERE ([TemplateTypeID] = @TemplateTypeID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TemplateTypeID" DefaultValue="1" Name="TemplateTypeID"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>          
                <td style="padding-top:10px; margin-left:50px;">
                    <div style="padding-bottom:0px;">
                    <asp:Button ID="AddDocument" runat="server" Text="Add New Document" OnClick="AddDocument_Click" />
                   </div>
                </td>
            </tr>
        </table>
        <table style="background-color:White">
            <tr>
                <td colspan="2" class="MainHeading">
                    Description <span style="font-size:10px;">(Document Body)</span> <br />
                   
            </td></tr>
            <tr><td style="padding-left:18px;">    
            
            <div>
            
                <telerik:RadEditor ID="RadEditor1" runat="server" Skin="Windows7" 
                    Height="574px" Width="896px">
                    <CssFiles>
                    <telerik:EditorCssFile Value ="~/Styles/RadEditorStyle.css" />
                    </CssFiles>
                    <Tools>
                        <telerik:EditorToolGroup Tag="MainToolbar">
                            <telerik:EditorTool Name="Print" ShortCut="CTRL+P" />
                            <telerik:EditorTool Name="AjaxSpellCheck" />
                            <telerik:EditorTool Name="FindAndReplace" ShortCut="CTRL+F" />
                            <telerik:EditorTool Name="SelectAll" ShortCut="CTRL+A" />
                            <telerik:EditorTool Name="Cut" />
                            <telerik:EditorTool Name="Copy" ShortCut="CTRL+C" />
                            <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                            <telerik:EditorTool Name="PasteStrip" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="Undo" ShortCut="CTRL+Z" />
                            <telerik:EditorTool Name="Redo" ShortCut="CTRL+Y" />
                        </telerik:EditorToolGroup>
                        <telerik:EditorToolGroup Tag="InsertToolbar">
                            <telerik:EditorTool Name="ImageManager" ShortCut="CTRL+G" />
                            <telerik:EditorTool Name="DocumentManager" />
                            <telerik:EditorTool Name="FlashManager" />
                            <telerik:EditorTool Name="MediaManager" />
                            <telerik:EditorTool Name="TemplateManager" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="LinkManager" ShortCut="CTRL+K" />
                            <telerik:EditorTool Name="Unlink" ShortCut="CTRL+SHIFT+K" />
                        </telerik:EditorToolGroup>
                        <telerik:EditorToolGroup>
                            <telerik:EditorTool Name="Superscript" />
                            <telerik:EditorTool Name="Subscript" />
                            <telerik:EditorTool Name="InsertParagraph" />
                            <telerik:EditorTool Name="InsertGroupbox" />
                            <telerik:EditorTool Name="InsertHorizontalRule" />
                            <telerik:EditorTool Name="InsertDate" />
                            <telerik:EditorTool Name="InsertTime" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="FormatCodeBlock" />
                        </telerik:EditorToolGroup>
                        <telerik:EditorToolGroup>
                            <telerik:EditorTool Name="FormatBlock" />
                            <telerik:EditorTool Name="FontName" ShortCut="CTRL+SHIFT+F" />
                            <telerik:EditorTool Name="RealFontSize" ShortCut="CTRL+SHIFT+P" />
                        </telerik:EditorToolGroup>
                        <telerik:EditorToolGroup>
                            <telerik:EditorTool Name="AbsolutePosition" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="Bold" ShortCut="CTRL+B" />
                            <telerik:EditorTool Name="Italic" ShortCut="CTRL+I" />
                            <telerik:EditorTool Name="Underline" ShortCut="CTRL+U" />
                            <telerik:EditorTool Name="StrikeThrough" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="JustifyLeft" />
                            <telerik:EditorTool Name="JustifyCenter" />
                            <telerik:EditorTool Name="JustifyRight" />
                            <telerik:EditorTool Name="JustifyFull" />
                            <telerik:EditorTool Name="JustifyNone" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="Indent" />
                            <telerik:EditorTool Name="Outdent" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="InsertOrderedList" />
                            <telerik:EditorTool Name="InsertUnorderedList" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="ToggleTableBorder" />
                            <telerik:EditorTool Name="XhtmlValidator" />
                        </telerik:EditorToolGroup>
                        <telerik:EditorToolGroup>
                            <telerik:EditorTool Name="ForeColor" />
                            <telerik:EditorTool Name="BackColor" />
                            <telerik:EditorTool Name="ApplyClass" />
                            <telerik:EditorTool Name="FormatStripper" />
                        </telerik:EditorToolGroup>
                        <telerik:EditorToolGroup Tag="DropdownToolbar">
                            <telerik:EditorTool Name="InsertSymbol" />
                            <telerik:EditorTool Name="InsertTable" />
                            <telerik:EditorTool Name="InsertFormElement" />
                            <telerik:EditorTool Name="InsertSnippet" />
                            <telerik:EditorTool Name="ImageMapDialog" />
                            <telerik:EditorTool Name="InsertCustomLink" ShortCut="CTRL+ALT+K" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="ConvertToLower" />
                            <telerik:EditorTool Name="ConvertToUpper" />
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="Zoom" />
                            <telerik:EditorTool Name="ModuleManager" />
                            <telerik:EditorTool Name="ToggleScreenMode" ShortCut="F11" />
                            <telerik:EditorTool Name="AboutDialog" />
                        </telerik:EditorToolGroup>
                    </Tools>
                    <Content>
</Content>
                </telerik:RadEditor>
            
                </div>
              <%--      <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Visible="True" Width="902"
                        Height="700">
                    </FCKeditorV2:FCKeditor>--%>
                </td>
            </tr>
        </table>
    </div>
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadEditor1">
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</asp:Content>
