<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="UC_LIVE.WebForm8" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="Controls/ContactDetails.ascx" tagname="ContactDetails" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style6
        {
            width: 478px;
            height: 37px;
        }
        .style7
        {
            width: 478px;
        }
        .style8
        {
            width: 444px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="height: 261px; width: 484px;">
            <tr style="width:150px; height:30px;">
                <td class="style8">Allocate Insurance <br /> <asp:DropDownList ID="AllocateInsurance" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="Company" 
                        DataValueField="Company">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT  [ContactID] , [Company] FROM [Contact] WHERE ([ContactTypeID] = 1) order by [company] ASC" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
      
                </td>
                  <td >Allocate Engineer <br /> <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Company" 
                        DataValueField="Company">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                          SelectCommand="SELECT Company FROM Contact WHERE (ContactTypeID = 3) ORDER BY Company" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
                      <br />
                </td>
            </tr>
           <tr style="width:150px; height:30px;">
                <td class="style8">Allocate Solicitor<br /> <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="Company" 
                        DataValueField="Company">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT [Company] FROM [Contact] WHERE ([ContactTypeID] = 2) order by [company]" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
                </td>
                  <td class="style6">Allocate Car hire<br /> <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSource4" DataTextField="Company" 
                        DataValueField="Company">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                          SelectCommand="SELECT Company FROM Contact WHERE (ContactTypeID = 4) ORDER BY Company" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
                      <br />
                </td>
            </tr>
            
             <tr style="width:150px; height:30px;">
                <td class="style8" >Allocate Storage<br /> <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="SqlDataSource5" DataTextField="Company" 
                        DataValueField="Company">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT [Company] FROM [Contact] WHERE ([ContactTypeID] = 5) order by [company]" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
                    <br />
                </td>
                  <td class="style7" >
					  <asp:Button ID="Button1" runat="server" Height="33px" onclick="Button1_Click" Text="Allocate Suppliers" Width="155px" />
				 </td>
            </tr>
            
       
        </table>
     
    
    </div>
    <uc1:ContactDetails ID="ContactDetails1" runat="server" ViewMode="Compact" />
    </form>
</body>
</html>
