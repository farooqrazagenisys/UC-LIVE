<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="exportcontacts.aspx.cs" Inherits="UC_LIVE.exportcontacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="JQueryTools/jquery.tools.min.js" type="text/javascript"></script>

    <style type="text/css">
        /* use a semi-transparent image for the overlay */#overlay
        {
            /*background-image:url(http://static.flowplayer.org/img/overlay/transparent.png); */
            color: #efefef;
            height: 500px;
            background-color: #FFF;
            display: none;
            width: 700px;
            padding: 15px;
            text-align: left;
            border: 5px solid #EEE;
            height: 600px;
            opacity: 0.8;
        }
        div.contentWrap
        {
            width: 700px;
            height: 490px;
            overflow-y: auto;
            overflow-x: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: White; width: 950px;" class="style8">
        <div class="MainHeading">
            Export Contacts
            
           <%-- <a href="SendSMS.aspx" rel="#overlay" target="_blank"><img src="Images/Icons/EmailIcon.png"  border="0"/></a>--%>
            </div>
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" MultiPageID="RadMultiPage1"
            SelectedIndex="0">
            <Tabs>
                <telerik:RadTab Text="Client" runat="server" TabIndex="0" Selected="true">
                </telerik:RadTab>
                <telerik:RadTab Text="Insurance" runat="server" TabIndex="1">
                </telerik:RadTab>
                <telerik:RadTab Text="Engineer" runat="server" TabIndex="2">
                </telerik:RadTab>
                <telerik:RadTab Text="Solicitor" runat="server" TabIndex="3">
                </telerik:RadTab>
                <telerik:RadTab Text="Carhire" runat="server" TabIndex="4">
                </telerik:RadTab>
                <telerik:RadTab Text="Storage" runat="server" TabIndex="5">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
            <telerik:RadPageView ID="RadPageView1" runat="server" TabIndex="0">
                <br />
                Please tick the required checkbox.
                <br />
                <div >
                    <asp:CheckBox ID="CheckBox1" Text="Export only data" runat="server"></asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox2" Text="Ignore paging (exports all pages)" runat="server">
                    </asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox3" Text="Open exported data in new browser window" runat="server">
                    </asp:CheckBox>
                    <br />
                    <br />
                  <%--  <asp:Button ID="Button1"  Width="150px" Text="Export to Excel" OnClick="Button1_Click"
                        runat="server"></asp:Button>
                    <asp:Button ID="Button2"  Width="150px" Text="Export to Word" OnClick="Button2_Click"
                        runat="server"></asp:Button>--%>
                    <asp:Button ID="Button3"  Width="150px" Text="Export to CSV" OnClick="Button3_Click"
                        runat="server"></asp:Button>
                </div>
                <br />

                <script type="text/javascript">
                    function onRequestStart(sender, args) {
                        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                            args.set_enableAjax(false);
                        }
                    }
                </script>

          
                <telerik:RadGrid ID="RadGrid1" DataSourceID="SqlDataSource1" AllowSorting="True"
                    AllowPaging="True" runat="server" GridLines="None" Width="100%" OnItemCommand="RadGrid1_ItemCommand"
                    Skin="Windows7" Style="margin-bottom: 0px" PageSize="40">
                    <ExportSettings HideStructureColumns="true" />
                    <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                                UniqueName="FirstName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Surname" HeaderText="Surname" SortExpression="Surname"
                                UniqueName="Surname">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Phone" HeaderText="Phone" SortExpression="Phone"
                                UniqueName="Phone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile"
                                UniqueName="Mobile">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                                UniqueName="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Company" HeaderText="Company" SortExpression="Company"
                                UniqueName="Company">
                            </telerik:GridBoundColumn>
                           <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                   Send Email</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendEmail1.aspx?ID=<%# Eval("Email")%>">
                                                  <img alt="Send Email" src="Images/Icons/EmailIcon.png" title="Click here to send email." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>   
                        
                        <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                    Send Text</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendSMS.aspx?ID=<%# Eval("Mobile")%>">
                                                  <img alt="Add Response" src="Images/Icons/TextIcon.png" title="Click here to send text." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>       
                        </Columns>
                        <PagerStyle Mode="NumericPages" />
                        <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false"
                            ShowExportToCsvButton="true" />
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT FirstName, Surname, Phone, Mobile, Email, Company FROM Contact WHERE (ContactTypeID = '7')"
                    runat="server">
                </asp:SqlDataSource>
                
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView2" runat="server" TabIndex="1">
            
                 <br />
                Please tick the required checkbox.
                <br />
                <div class="module">
                    <asp:CheckBox ID="CheckBox4" Text="Export only data" runat="server"></asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox5" Text="Ignore paging (exports all pages)" runat="server">
                    </asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox6" Text="Open exported data in new browser window" runat="server">
                    </asp:CheckBox>
                    <br />
                    <br />
                  <%--  <asp:Button ID="Button4" CssClass="button" Width="150px" Text="Export to Excel" OnClick="Button1_Click1"
                        runat="server"></asp:Button>
                    <asp:Button ID="Button5" CssClass="button" Width="150px" Text="Export to Word" OnClick="Button2_Click1"
                        runat="server"></asp:Button>--%>
                    <asp:Button ID="Button6" CssClass="button" Width="150px" Text="Export to CSV" OnClick="Button3_Click1"
                        runat="server"></asp:Button>
                </div>
                <br />

                <script type="text/javascript">
                    function onRequestStart(sender, args) {
                        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                            args.set_enableAjax(false);
                        }
                    }
                </script>

      
                <telerik:RadGrid ID="RadGrid2" DataSourceID="SqlDataSource2" AllowSorting="True"
                    AllowPaging="True" runat="server" GridLines="None" Width="100%" OnItemCommand="RadGrid1_ItemCommand"
                    Skin="Windows7" Style="margin-bottom: 0px" PageSize="20">
                    <ExportSettings HideStructureColumns="true" />
                    <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                                UniqueName="FirstName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Surname" HeaderText="Surname" SortExpression="Surname"
                                UniqueName="Surname">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Phone" HeaderText="Phone" SortExpression="Phone"
                                UniqueName="Phone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile"
                                UniqueName="Mobile">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                                UniqueName="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Company" HeaderText="Company" SortExpression="Company"
                                UniqueName="Company">
                            </telerik:GridBoundColumn>
                            
                              
                         <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                   Send Email</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendEmail1.aspx?ID=<%# Eval("Email")%>">
                                                  <img alt="Send Email" src="Images/Icons/EmailIcon.png" title="Click here to send email." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>   
                        
                        <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                    Send Text</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendSMS.aspx?ID=<%# Eval("Mobile")%>">
                                                  <img alt="Add Response" src="Images/Icons/TextIcon.png" title="Click here to send text." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>      
                        </Columns>
                       <PagerStyle Mode="NumericPages" />
                        <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false"
                            ShowExportToCsvButton="true" />
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [FirstName], [Surname], [Phone], [Mobile], [Email], [Company] FROM [Contact] WHERE ([ContactTypeID] = @ContactTypeID)"
                    runat="server">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="ContactTypeID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView3" runat="server" TabIndex="2">
               <br />
                Please tick the required checkbox.
                <br />
                <div class="module">
                    <asp:CheckBox ID="CheckBox7" Text="Export only data" runat="server"></asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox8" Text="Ignore paging (exports all pages)" runat="server">
                    </asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox9" Text="Open exported data in new browser window" runat="server">
                    </asp:CheckBox>
                    <br />
                    <br />
                  <%--  <asp:Button ID="Button7" CssClass="button" Width="150px" Text="Export to Excel" OnClick="Button1_Click2"
                        runat="server"></asp:Button>
                    <asp:Button ID="Button8" CssClass="button" Width="150px" Text="Export to Word" OnClick="Button2_Click2"
                        runat="server"></asp:Button>--%>
                    <asp:Button ID="Button9" CssClass="button" Width="150px" Text="Export to CSV" OnClick="Button3_Click2"
                        runat="server"></asp:Button>
                </div>
                <br />

                <script type="text/javascript">
                    function onRequestStart(sender, args) {
                        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                            args.set_enableAjax(false);
                        }
                    }
                </script>

                <telerik:RadGrid ID="RadGrid3" DataSourceID="SqlDataSource3" AllowSorting="True"
                    AllowPaging="True" runat="server" GridLines="None" Width="100%" OnItemCommand="RadGrid1_ItemCommand"
                    Skin="Windows7" Style="margin-bottom: 0px" PageSize="20">
                    <ExportSettings HideStructureColumns="true" />
                    <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                                UniqueName="FirstName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Surname" HeaderText="Surname" SortExpression="Surname"
                                UniqueName="Surname">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Phone" HeaderText="Phone" SortExpression="Phone"
                                UniqueName="Phone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile"
                                UniqueName="Mobile">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                                UniqueName="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Company" HeaderText="Company" SortExpression="Company"
                                UniqueName="Company">
                            </telerik:GridBoundColumn>
                            
                              
                         <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                   Send Email</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendEmail1.aspx?ID=<%# Eval("Email")%>">
                                                  <img alt="Send Email" src="Images/Icons/EmailIcon.png" title="Click here to send email." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>   
                        
                        <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                    Send Text</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendSMS.aspx?ID=<%# Eval("Mobile")%>">
                                                  <img alt="Add Response" src="Images/Icons/TextIcon.png" title="Click here to send text." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>       
                        </Columns>
                  <PagerStyle Mode="NumericPages" />
                        <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false"
                            ShowExportToCsvButton="true" />
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [FirstName], [Surname], [Phone], [Mobile], [Email], [Company] FROM [Contact] WHERE ([ContactTypeID] = @ContactTypeID)"
                    runat="server">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="ContactTypeID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView7" runat="server" TabIndex="3">
            
                 <br />
                Please tick the required checkbox.
                <br />
                <div class="module">
                    <asp:CheckBox ID="CheckBox10" Text="Export only data" runat="server"></asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox11" Text="Ignore paging (exports all pages)" runat="server">
                    </asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox12" Text="Open exported data in new browser window" runat="server">
                    </asp:CheckBox>
                    <br />
                    <br />
                 <%--   <asp:Button ID="Button10" CssClass="button" Width="150px" Text="Export to Excel" OnClick="Button1_Click3"
                        runat="server"></asp:Button>
                    <asp:Button ID="Button11" CssClass="button" Width="150px" Text="Export to Word" OnClick="Button2_Click3"
                        runat="server"></asp:Button>--%>
                    <asp:Button ID="Button12" CssClass="button" Width="150px" Text="Export to CSV" OnClick="Button3_Click3"
                        runat="server"></asp:Button>
                </div>
                <br />

                <script type="text/javascript">
                    function onRequestStart(sender, args) {
                        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                            args.set_enableAjax(false);
                        }
                    }
                </script>

            
                <telerik:RadGrid ID="RadGrid4" DataSourceID="SqlDataSource4" AllowSorting="True"
                    AllowPaging="True" runat="server" GridLines="None" Width="100%" OnItemCommand="RadGrid1_ItemCommand"
                    Skin="Windows7" Style="margin-bottom: 0px" PageSize="20">
                    <ExportSettings HideStructureColumns="true" />
                    <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                                UniqueName="FirstName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Surname" HeaderText="Surname" SortExpression="Surname"
                                UniqueName="Surname">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Phone" HeaderText="Phone" SortExpression="Phone"
                                UniqueName="Phone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile"
                                UniqueName="Mobile">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                                UniqueName="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Company" HeaderText="Company" SortExpression="Company"
                                UniqueName="Company">
                            </telerik:GridBoundColumn>
                              
                         <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                   Send Email</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendEmail1.aspx?ID=<%# Eval("Email")%>">
                                                  <img alt="Send Email" src="Images/Icons/EmailIcon.png" title="Click here to send email." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>   
                        
                        <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                    Send Text</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendSMS.aspx?ID=<%# Eval("Mobile")%>">
                                                  <img alt="Add Response" src="Images/Icons/TextIcon.png" title="Click here to send text." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>    
                        </Columns><PagerStyle Mode="NumericPages" />
                        <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false"
                            ShowExportToCsvButton="true" />
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [FirstName], [Surname], [Phone], [Mobile], [Email], [Company] FROM [Contact] WHERE ([ContactTypeID] = @ContactTypeID)"
                    runat="server">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="ContactTypeID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </telerik:RadPageView>
            
            
            
            
            
            <telerik:RadPageView ID="RadPageView4" runat="server" TabIndex="4">
            
                 
                 <br />
                Please tick the required checkbox.
                <br />
                <div class="module">
                    <asp:CheckBox ID="CheckBox13" Text="Export only data" runat="server"></asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox14" Text="Ignore paging (exports all pages)" runat="server">
                    </asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox15" Text="Open exported data in new browser window" runat="server">
                    </asp:CheckBox>
                    <br />
                    <br />
          <%--          <asp:Button ID="Button13" CssClass="button" Width="150px" Text="Export to Excel" OnClick="Button1_Click4"
                        runat="server"></asp:Button>
                    <asp:Button ID="Button14" CssClass="button" Width="150px" Text="Export to Word" OnClick="Button2_Click4"
                        runat="server"></asp:Button>--%>
                    <asp:Button ID="Button15" CssClass="button" Width="150px" Text="Export to CSV" OnClick="Button3_Click4"
                        runat="server"></asp:Button>
                </div>
                <br />

                <script type="text/javascript">
                    function onRequestStart(sender, args) {
                        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                            args.set_enableAjax(false);
                        }
                    }
                </script>

            
                <telerik:RadGrid ID="RadGrid5" DataSourceID="SqlDataSource5" AllowSorting="True"
                    AllowPaging="True" runat="server" GridLines="None" Width="100%" OnItemCommand="RadGrid1_ItemCommand"
                    Skin="Windows7" Style="margin-bottom: 0px" PageSize="20">
                    <ExportSettings HideStructureColumns="true" />
                    <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                                UniqueName="FirstName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Surname" HeaderText="Surname" SortExpression="Surname"
                                UniqueName="Surname">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Phone" HeaderText="Phone" SortExpression="Phone"
                                UniqueName="Phone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile"
                                UniqueName="Mobile">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                                UniqueName="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Company" HeaderText="Company" SortExpression="Company"
                                UniqueName="Company">
                            </telerik:GridBoundColumn>
                              
                        <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                   Send Email</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendEmail1.aspx?ID=<%# Eval("Email")%>">
                                                  <img alt="Send Email" src="Images/Icons/EmailIcon.png" title="Click here to send email." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>   
                        
                        <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                    Send Text</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendSMS.aspx?ID=<%# Eval("Mobile")%>">
                                                  <img alt="Add Response" src="Images/Icons/TextIcon.png" title="Click here to send text." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>       
                        </Columns>
                       <PagerStyle Mode="NumericPages" />
                        <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false"
                            ShowExportToCsvButton="true" />
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource5" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [FirstName], [Surname], [Phone], [Mobile], [Email], [Company] FROM [Contact] WHERE ([ContactTypeID] = @ContactTypeID)"
                    runat="server">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="4" Name="ContactTypeID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView5" runat="server" TabIndex="5">
            
                 
                 <br />
                Please tick the required checkbox.
                <br />
                <div class="module">
                    <asp:CheckBox ID="CheckBox16" Text="Export only data" runat="server"></asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox17" Text="Ignore paging (exports all pages)" runat="server">
                    </asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox18" Text="Open exported data in new browser window" runat="server">
                    </asp:CheckBox>
                    <br />
                    <br />
                <%--    <asp:Button ID="Button16" CssClass="button" Width="150px" Text="Export to Excel" OnClick="Button1_Click5"
                        runat="server"></asp:Button>
                    <asp:Button ID="Button17" CssClass="button" Width="150px" Text="Export to Word" OnClick="Button2_Click5"
                        runat="server"></asp:Button>--%>
                    <asp:Button ID="Button18" CssClass="button" Width="150px" Text="Export to CSV" OnClick="Button3_Click5"
                        runat="server"></asp:Button>
                </div>
                <br />

                <script type="text/javascript">
                    function onRequestStart(sender, args) {
                        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                            args.set_enableAjax(false);
                        }
                    }
                </script>

            
                <telerik:RadGrid ID="RadGrid6" DataSourceID="SqlDataSource6" AllowSorting="True"
                    AllowPaging="True" runat="server" GridLines="None" Width="100%" OnItemCommand="RadGrid1_ItemCommand"
                    Skin="Windows7" Style="margin-bottom: 0px" PageSize="20">
                    <ExportSettings HideStructureColumns="true" />
                    <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                                UniqueName="FirstName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Surname" HeaderText="Surname" SortExpression="Surname"
                                UniqueName="Surname">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Phone" HeaderText="Phone" SortExpression="Phone"
                                UniqueName="Phone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile"
                                UniqueName="Mobile">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                                UniqueName="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Company" HeaderText="Company" SortExpression="Company"
                                UniqueName="Company">
                            </telerik:GridBoundColumn>
                              
                       <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                   Send Email</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendEmail1.aspx?ID=<%# Eval("Email")%>">
                                                  <img alt="Send Email" src="Images/Icons/EmailIcon.png" title="Click here to send email." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>   
                        
                        <telerik:GridTemplateColumn>
                                                <HeaderTemplate>
                                                    Send Text</HeaderTemplate>
                                                <ItemTemplate>
                                 <a href="SendSMS.aspx?ID=<%# Eval("Mobile")%>">
                                                  <img alt="Add Response" src="Images/Icons/TextIcon.png" title="Click here to send text." border="0" />
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemStyle Width="70" />
                                            </telerik:GridTemplateColumn>     
                        </Columns><PagerStyle Mode="NumericPages" />
                        <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false"
                            ShowExportToCsvButton="true" />
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource6" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [FirstName], [Surname], [Phone], [Mobile], [Email], [Company] FROM [Contact] WHERE ([ContactTypeID] = @ContactTypeID)"
                    runat="server">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="5" Name="ContactTypeID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </telerik:RadPageView>
          <%--  <telerik:RadPageView ID="RadPageView6" runat="server" TabIndex="6">
            
                 
                 <br />
                Please tick the required checkbox.
                <br />
                <div class="module">
                    <asp:CheckBox ID="CheckBox19" Text="Export only data" runat="server"></asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox20" Text="Ignore paging (exports all pages)" runat="server">
                    </asp:CheckBox>
                    <br />
                    <asp:CheckBox ID="CheckBox21" Text="Open exported data in new browser window" runat="server">
                    </asp:CheckBox>
                    <br />
                    <br />
                    <asp:Button ID="Button19" CssClass="button" Width="150px" Text="Export to Excel" OnClick="Button1_Click6"
                        runat="server"></asp:Button>
                    <asp:Button ID="Button20" CssClass="button" Width="150px" Text="Export to Word" OnClick="Button2_Click6"
                        runat="server"></asp:Button>
                    <asp:Button ID="Button21" CssClass="button" Width="150px" Text="Export to CSV" OnClick="Button3_Click6"
                        runat="server"></asp:Button>
                </div>
                <br />

                <script type="text/javascript">
                    function onRequestStart(sender, args) {
                        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                            args.set_enableAjax(false);
                        }
                    }
                </script>

            
                <telerik:RadGrid ID="RadGrid7" DataSourceID="SqlDataSource1" AllowSorting="True"
                    AllowPaging="True" runat="server" GridLines="None" Width="100%" OnItemCommand="RadGrid1_ItemCommand"
                    Skin="Windows7" Style="margin-bottom: 0px">
                    <ExportSettings HideStructureColumns="true" />
                    <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                                UniqueName="FirstName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Surname" HeaderText="Surname" SortExpression="Surname"
                                UniqueName="Surname">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Phone" HeaderText="Phone" SortExpression="Phone"
                                UniqueName="Phone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile"
                                UniqueName="Mobile">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                                UniqueName="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Company" HeaderText="Company" SortExpression="Company"
                                UniqueName="Company">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false"
                            ShowExportToCsvButton="true" />
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource7" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [FirstName], [Surname], [Phone], [Mobile], [Email], [Company] FROM [Contact] WHERE ([ContactTypeID] = @ContactTypeID)"
                    runat="server">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="6" Name="ContactTypeID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </telerik:RadPageView>--%>
        </telerik:RadMultiPage>
        
        <!-- overlayed element -->
    <div class="apple_overlay" id="overlay">
        <!-- the external content is loaded inside this tag -->
        <div class="contentWrap">
        </div>
    </div>

    <script>


        $(function() {

            // if the function argument is given to overlay,
            // it is assumed to be the onBeforeLoad event listener
            $("a[rel]").overlay({

                mask: '#000',
                effect: 'apple',

                onBeforeLoad: function() {

                    // grab wrapper element inside content
                    var wrap = this.getOverlay().find(".contentWrap");

                    // load the page specified in the trigger
                    wrap.load(this.getTrigger().attr("href"));
                }

            });
        });

    </script>
    </div>
</asp:Content>
