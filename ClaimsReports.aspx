<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ClaimsReports.aspx.cs" Inherits="UC_LIVE.ClaimsReports" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="background-color:White; width:950px;">

      
<div style="margin-left:10px;">
 <div class="MainHeading" style="float: left; width: 600px;">Claim Reports</div>

    <div style="float: left; width: 435px; margin:10px; height:230px; background-color: #FFF">
        <telerik:RadChart ID="RadChart1" runat="server" AutoLayout="True" 
            AutoTextWrap="True" DataSourceID="ChartDataSource" DefaultType="Gantt" 
            Height="269px" Skin="BlueStripes" Width="446px">
            <Series>
                <telerik:ChartSeries DataLabelsColumn="ClaimType" DataYColumn="Column1" 
                    Name="ClaimType" Type="Gantt">
                        <appearance>
                            <fillstyle maincolor="222, 202, 152" FillType="ComplexGradient">
                                <FillSettings>
                                    <ComplexGradient>
                                        <telerik:GradientElement Color="222, 202, 152" />
                                        <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                                        <telerik:GradientElement Color="183, 154, 84" Position="1" />
                                    </ComplexGradient>
                                </FillSettings>
                            </fillstyle>
                            <TextAppearance TextProperties-Color="62, 117, 154">
                            </TextAppearance>
                            <Border Color="187, 149, 58" />
                        </appearance>
                    </telerik:ChartSeries>
            </Series>
            <PlotArea>
                <XAxis>
                    <Appearance Color="193, 214, 221" MajorTick-Color="154, 153, 129">
                        <MajorGridLines Color="221, 227, 221" Width="0" />
                        <TextAppearance TextProperties-Color="102, 103, 86">
                        </TextAppearance>
                    </Appearance>
                    <AxisLabel>
                        <TextBlock>
                            <Appearance TextProperties-Color="102, 103, 86">
                            </Appearance>
                        </TextBlock>
                    </AxisLabel>
                </XAxis>
                <YAxis>
                    <Appearance Color="193, 214, 221" MajorTick-Color="154, 153, 129" 
                        MinorTick-Color="193, 214, 221">
                        <MajorGridLines Color="221, 227, 221" />
                        <MinorGridLines Color="221, 227, 221" />
                        <TextAppearance TextProperties-Color="102, 103, 86">
                        </TextAppearance>
                    </Appearance>
                    <AxisLabel>
                        <TextBlock>
                            <Appearance TextProperties-Color="102, 103, 86">
                            </Appearance>
                        </TextBlock>
                    </AxisLabel>
                </YAxis>
                <Appearance Dimensions-Margins="18%, 21%, 12%, 8%">
                    <FillStyle MainColor="241, 253, 255" SecondColor="Transparent">
                    </FillStyle>
                    <Border Color="193, 214, 221" />
                </Appearance>
            </PlotArea>
            <Appearance>
                <FillStyle MainColor="225, 235, 238" FillType="Hatch" 
                    SecondColor="207, 223, 229">
                </FillStyle>
                <Border Color="131, 171, 184" />
            </Appearance>
            <ChartTitle>
                <Appearance Dimensions-Margins="3%, 10px, 14px, 5%">
                    <FillStyle MainColor="">
                    </FillStyle>
                </Appearance>
                <TextBlock Text="Claim Types">
                    <Appearance TextProperties-Color="81, 103, 114" 
                        TextProperties-Font="Verdana, 18pt">
                    </Appearance>
                </TextBlock>
            </ChartTitle>
            <Legend>
                <Appearance Dimensions-Margins="1px, 1%, 11%, 1px">
                    <ItemTextAppearance TextProperties-Color="81, 103, 114">
                    </ItemTextAppearance>
                    <FillStyle MainColor="241, 253, 255">
                    </FillStyle>
                    <Border Color="193, 214, 221" />
                </Appearance>
            </Legend>
        </telerik:RadChart>
        <asp:SqlDataSource ID="ChartDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ClaimTypes.ClaimType, Sum(Claim.ClaimId)
FROM Claim, ClaimTypes where Claim.ClaimTypeID=ClaimTypes.ClaimTypeID

GROUP BY ClaimType"></asp:SqlDataSource>
    </div>




    <div style="float: left; width: 435px; margin:10px; height:230px; background-color: #FFF">
        <telerik:RadChart ID="RadChart2" runat="server" AutoLayout="True" 
            AutoTextWrap="True" datasourceid="ChartDataSource0" DefaultType="Line" 
            Height="269px" Skin="BlueStripes" Width="446px">
            <Series>
                <telerik:ChartSeries DataLabelsColumn="ClaimType" DataYColumn="Column1" 
                    Name="ClaimType" Type="Line">
                        <appearance>
                            <fillstyle maincolor="222, 202, 152" FillType="ComplexGradient">
                                <FillSettings>
                                    <ComplexGradient>
                                        <telerik:GradientElement Color="222, 202, 152" />
                                        <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                                        <telerik:GradientElement Color="183, 154, 84" Position="1" />
                                    </ComplexGradient>
                                </FillSettings>
                            </fillstyle>
                            <TextAppearance TextProperties-Color="62, 117, 154">
                            </TextAppearance>
                            <border color="187, 149, 58" />
                        </appearance>
                    </telerik:ChartSeries>
            </Series>
            <PlotArea>
                <XAxis>
                    <Appearance Color="193, 214, 221" MajorTick-Color="154, 153, 129">
                        <MajorGridLines Color="221, 227, 221" Width="0" />
                        <TextAppearance TextProperties-Color="102, 103, 86">
                        </TextAppearance>
                    </Appearance>
                    <AxisLabel>
                        <TextBlock>
                            <Appearance TextProperties-Color="102, 103, 86">
                            </Appearance>
                        </TextBlock>
                    </AxisLabel>
                </XAxis>
                <YAxis>
                    <Appearance Color="193, 214, 221" MajorTick-Color="154, 153, 129" 
                        MinorTick-Color="193, 214, 221">
                        <MajorGridLines Color="221, 227, 221" />
                        <MinorGridLines Color="221, 227, 221" />
                        <TextAppearance TextProperties-Color="102, 103, 86">
                        </TextAppearance>
                    </Appearance>
                    <AxisLabel>
                        <TextBlock>
                            <Appearance TextProperties-Color="102, 103, 86">
                            </Appearance>
                        </TextBlock>
                    </AxisLabel>
                </YAxis>
                <Appearance Dimensions-Margins="18%, 21%, 12%, 8%">
                    <FillStyle MainColor="241, 253, 255" SecondColor="Transparent">
                    </FillStyle>
                    <Border Color="193, 214, 221" />
                </Appearance>
            </PlotArea>
            <Appearance>
                <FillStyle MainColor="225, 235, 238" FillType="Hatch" 
                    SecondColor="207, 223, 229">
                </FillStyle>
                <Border Color="131, 171, 184" />
            </Appearance>
            <ChartTitle>
                <Appearance Dimensions-Margins="3%, 10px, 14px, 5%">
                    <FillStyle MainColor="">
                    </FillStyle>
                </Appearance>
                <TextBlock Text="Claim Types">
                    <Appearance TextProperties-Color="81, 103, 114" 
                        TextProperties-Font="Verdana, 18pt">
                    </Appearance>
                </TextBlock>
            </ChartTitle>
            <Legend>
                <Appearance Dimensions-Margins="1px, 1%, 11%, 1px">
                    <ItemTextAppearance TextProperties-Color="81, 103, 114">
                    </ItemTextAppearance>
                    <FillStyle MainColor="241, 253, 255">
                    </FillStyle>
                    <Border Color="193, 214, 221" />
                </Appearance>
            </Legend>
        </telerik:RadChart>
        <asp:SqlDataSource ID="ChartDataSource0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ClaimTypes.ClaimType, Sum(Claim.ClaimId)
FROM Claim, ClaimTypes where Claim.ClaimTypeID=ClaimTypes.ClaimTypeID

GROUP BY ClaimType"></asp:SqlDataSource>
    </div>
 <div style="clear:both; margin-top:30px;"></div>

       <div style="float: left; width: 435px; margin:10px; height:230px; background-color: #FFF">
        <telerik:RadChart ID="RadChart3" runat="server" AutoLayout="True" 
            AutoTextWrap="True" DataSourceID="ChartDataSource" DefaultType="Bubble" 
            Height="269px" Skin="BlueStripes" Width="446px">
            <Series>
                <telerik:ChartSeries DataLabelsColumn="ClaimType" DataYColumn="Column1" 
                    Name="ClaimType" Type="Bubble">
                        <appearance>
                            <fillstyle maincolor="222, 202, 152" FillType="ComplexGradient">
                                <FillSettings>
                                    <ComplexGradient>
                                        <telerik:GradientElement Color="222, 202, 152" />
                                        <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                                        <telerik:GradientElement Color="183, 154, 84" Position="1" />
                                    </ComplexGradient>
                                </FillSettings>
                            </fillstyle>
                            <TextAppearance TextProperties-Color="62, 117, 154">
                            </TextAppearance>
                            <Border Color="187, 149, 58" />
                        </appearance>
                    </telerik:ChartSeries>
            </Series>
            <PlotArea>
                <XAxis>
                    <Appearance Color="193, 214, 221" MajorTick-Color="154, 153, 129">
                        <MajorGridLines Color="221, 227, 221" Width="0" />
                        <TextAppearance TextProperties-Color="102, 103, 86">
                        </TextAppearance>
                    </Appearance>
                    <AxisLabel>
                        <TextBlock>
                            <Appearance TextProperties-Color="102, 103, 86">
                            </Appearance>
                        </TextBlock>
                    </AxisLabel>
                </XAxis>
                <YAxis>
                    <Appearance Color="193, 214, 221" MajorTick-Color="154, 153, 129" 
                        MinorTick-Color="193, 214, 221">
                        <MajorGridLines Color="221, 227, 221" />
                        <MinorGridLines Color="221, 227, 221" />
                        <TextAppearance TextProperties-Color="102, 103, 86">
                        </TextAppearance>
                    </Appearance>
                    <AxisLabel>
                        <TextBlock>
                            <Appearance TextProperties-Color="102, 103, 86">
                            </Appearance>
                        </TextBlock>
                    </AxisLabel>
                </YAxis>
                <Appearance Dimensions-Margins="18%, 21%, 12%, 8%">
                    <FillStyle MainColor="241, 253, 255" SecondColor="Transparent">
                    </FillStyle>
                    <Border Color="193, 214, 221" />
                </Appearance>
            </PlotArea>
            <Appearance>
                <FillStyle MainColor="225, 235, 238" FillType="Hatch" 
                    SecondColor="207, 223, 229">
                </FillStyle>
                <Border Color="131, 171, 184" />
            </Appearance>
            <ChartTitle>
                <Appearance Dimensions-Margins="3%, 10px, 14px, 5%">
                    <FillStyle MainColor="">
                    </FillStyle>
                </Appearance>
                <TextBlock Text="Claim Types">
                    <Appearance TextProperties-Color="81, 103, 114" 
                        TextProperties-Font="Verdana, 18pt">
                    </Appearance>
                </TextBlock>
            </ChartTitle>
            <Legend>
                <Appearance Dimensions-Margins="1px, 1%, 11%, 1px">
                    <ItemTextAppearance TextProperties-Color="81, 103, 114">
                    </ItemTextAppearance>
                    <FillStyle MainColor="241, 253, 255">
                    </FillStyle>
                    <Border Color="193, 214, 221" />
                </Appearance>
            </Legend>
        </telerik:RadChart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ClaimTypes.ClaimType, Sum(Claim.ClaimId)
FROM Claim, ClaimTypes where Claim.ClaimTypeID=ClaimTypes.ClaimTypeID

GROUP BY ClaimType"></asp:SqlDataSource>
    </div>





    <div style="float: left; width: 435px; margin:10px; height:230px; background-color: #FFF">
        <telerik:RadChart ID="RadChart4" runat="server" AutoLayout="True" 
            AutoTextWrap="True" datasourceid="ChartDataSource0" DefaultType="Area" 
            Height="269px" Skin="BlueStripes" Width="446px">
            <Series>
                <telerik:ChartSeries DataLabelsColumn="ClaimType" DataYColumn="Column1" 
                    Name="ClaimType" Type="Area">
                        <appearance>
                            <fillstyle maincolor="222, 202, 152" FillType="ComplexGradient">
                                <FillSettings>
                                    <ComplexGradient>
                                        <telerik:GradientElement Color="222, 202, 152" />
                                        <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                                        <telerik:GradientElement Color="183, 154, 84" Position="1" />
                                    </ComplexGradient>
                                </FillSettings>
                            </fillstyle>
                            <TextAppearance TextProperties-Color="62, 117, 154">
                            </TextAppearance>
                            <border color="187, 149, 58" />
                        </appearance>
                    </telerik:ChartSeries>
            </Series>
            <PlotArea>
                <XAxis>
                    <Appearance Color="193, 214, 221" MajorTick-Color="154, 153, 129">
                        <MajorGridLines Color="221, 227, 221" Width="0" />
                        <TextAppearance TextProperties-Color="102, 103, 86">
                        </TextAppearance>
                    </Appearance>
                    <AxisLabel>
                        <TextBlock>
                            <Appearance TextProperties-Color="102, 103, 86">
                            </Appearance>
                        </TextBlock>
                    </AxisLabel>
                </XAxis>
                <YAxis>
                    <Appearance Color="193, 214, 221" MajorTick-Color="154, 153, 129" 
                        MinorTick-Color="193, 214, 221">
                        <MajorGridLines Color="221, 227, 221" />
                        <MinorGridLines Color="221, 227, 221" />
                        <TextAppearance TextProperties-Color="102, 103, 86">
                        </TextAppearance>
                    </Appearance>
                    <AxisLabel>
                        <TextBlock>
                            <Appearance TextProperties-Color="102, 103, 86">
                            </Appearance>
                        </TextBlock>
                    </AxisLabel>
                </YAxis>
                <Appearance Dimensions-Margins="18%, 21%, 12%, 8%">
                    <FillStyle MainColor="241, 253, 255" SecondColor="Transparent">
                    </FillStyle>
                    <Border Color="193, 214, 221" />
                </Appearance>
            </PlotArea>
            <Appearance>
                <FillStyle MainColor="225, 235, 238" FillType="Hatch" 
                    SecondColor="207, 223, 229">
                </FillStyle>
                <Border Color="131, 171, 184" />
            </Appearance>
            <ChartTitle>
                <Appearance Dimensions-Margins="3%, 10px, 14px, 5%">
                    <FillStyle MainColor="">
                    </FillStyle>
                </Appearance>
                <TextBlock Text="Claim Types">
                    <Appearance TextProperties-Color="81, 103, 114" 
                        TextProperties-Font="Verdana, 18pt">
                    </Appearance>
                </TextBlock>
            </ChartTitle>
            <Legend>
                <Appearance Dimensions-Margins="1px, 1%, 11%, 1px">
                    <ItemTextAppearance TextProperties-Color="81, 103, 114">
                    </ItemTextAppearance>
                    <FillStyle MainColor="241, 253, 255">
                    </FillStyle>
                    <Border Color="193, 214, 221" />
                </Appearance>
            </Legend>
        </telerik:RadChart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ClaimTypes.ClaimType, Sum(Claim.ClaimId)
FROM Claim, ClaimTypes where Claim.ClaimTypeID=ClaimTypes.ClaimTypeID

GROUP BY ClaimType"></asp:SqlDataSource>
    </div>

</div>
</div>

</asp:Content>
