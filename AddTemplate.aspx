<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="AddTemplate.aspx.cs" Inherits="UC_LIVE.AddTemplate" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: white;">
        <div class="MainHeading">
            Create New Template</div>
        <div id="Msg" runat="server">
        </div>
        <table style="width: 905px; margin-left: 20px; background-color: #EEE" class="style8">
            <tr>
                <td style="width: 150px; padding-left: 12px;">
                    <div style="padding-bottom:5px;">Choose Contact</div>
                    <asp:DropDownList ID="TemplateTypeID" runat="server">
                        <asp:ListItem Value="7">Client</asp:ListItem>
                        <asp:ListItem Value="1">Insurance Company</asp:ListItem>
                        <asp:ListItem Value="3">Enginner Company</asp:ListItem>
                        <asp:ListItem Value="2">Solicitor Company</asp:ListItem>
                        <asp:ListItem Value="4">Carhire Company</asp:ListItem>
                        <asp:ListItem Value="5">Stroage Company</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 90px;">
                   <div style="padding-bottom:5px;"> Template Title</div>
                    <asp:TextBox ID="TemplateTitle" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td style="width: 150px;">
                   <div style="padding-bottom:5px; "> Attach Header</div>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td style="padding-top:10px; padding-left:10px;">
                    <asp:Button ID="AddTemplateButton" runat="server" Text="Add Template" OnClick="AddTemplateButton_Click" />
                 <asp:Button ID="CancelButton1" runat="server" Text="Cancel" 
                        onclick="CancelButton1_Click" />
                
                </td>
            </tr>
            <tr>
                <td colspan="5">
                </td>
            
            </tr>
        </table>
        <div class="MainHeading">
            Template Description <span style="font-size: 11px;">(Template Body Text)</span>
            <br />
        </div>
        <table style="width: 905px; margin-left: 17px; margin-top: 5px;" class="style8">
            <tr>
                <td>
                <telerik:RadEditor ID="RadEditor1" runat="server" Skin="Windows7" 
                    Height="574px" Width="896px" >
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
                
                    <%--<FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Visible="True" Width="905"
                        Height="650">
                    </FCKeditorV2:FCKeditor>--%>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
