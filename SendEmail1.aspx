
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SendEmail1.aspx.cs" Inherits="UC_LIVE.SendEmail1" ValidateRequest="false" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
	    
	    body
	    {
	        font-family:Microsoft Sans Serif;
	        
	        
	        }
	    
		.style1
		{
			width: 880px;
		}
		.style2
		{
			width: 880px;
			height: 45px;
		}
		.style3
		{
			height: 51px;
		}
		.style4
		{
			height: 50px;
		}
		.style5
		{
			width: 880px;
			height: 47px;
		}
	</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div style="background-color:White;">
 <div class="MainHeading" style="float: left; width: 600px; margin-left:30px; ">Send Email</div>
<table style="width:865px; height: 558px; margin-left:50px;">
		<tr>
			<td colspan="2" class="style11">
		
			
				<div id="Msg2" runat="server">
					</div>
			</td>
			<td class="style11" >
				</td>
		</tr>
		
		<tr>
			<td class="style2">
				To :&nbsp;&nbsp;&nbsp;
				<asp:TextBox ID="ToEmail" runat="server" Height="20px" Width="302px"></asp:TextBox>
			</td>
		</tr>
				
		<tr>
			<td  colspan="2" class="style3" >
			
				From:&nbsp; 
				<asp:TextBox ID="FromEmail" runat="server" Height="20px" Width="302px"></asp:TextBox>
			</td>
			<td class="style3" >
			</td>
		</tr>

	<tr>
			<td  colspan="2" class="style3" >
			
				Subject:&nbsp; 
				<asp:TextBox ID="SubjectTextbox" runat="server" Width="300px"></asp:TextBox>
			</td>
			<td class="style3" >
			</td>
		</tr>
		</tr>
		
				<tr>
			<td  colspan="2" class="style4" >
					Attachment:&nbsp;
					<asp:FileUpload ID="FileUpload2" runat="server" />
				<br />
			</td>
			<td class="style4">
                    </td>
		</tr>
		<tr>
			<td align="left" class="style5">
			<asp:Button ID="SendEmail" runat="server" Text="Send Email" onclick="SendEmail_Click1"/>&nbsp;</td>
		</tr>
		<tr>
			<td  colspan="2" >
				Message:<br />
                <br />	
				
				

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

			</td>
			<td>
                  &nbsp;</td>
		</tr>
		<tr>
			<td class="style1">
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
                &nbsp;</td>
		</tr>
	
	</table>
	</div>
	</asp:Content>