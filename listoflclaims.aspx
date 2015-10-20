<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="listoflclaims.aspx.cs" Inherits="UC_LIVE.listoflclaims" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="background-color:white; width:950px;">
      <div class="MainHeading">View Reports</div>
    <div style="margin-left:50px; margin-bottom:20px; float:left;">
    <telerik:RadChart ID="RadChart1" runat="server" Height="243px" 
    Width="373px" DataSourceID="ChartDataSource" DefaultType="StackedBar" 
    Skin="BlueStripes">
        <Series>
            <telerik:ChartSeries Name="Series 2" Type="StackedBar">
                <Appearance>
                    <FillStyle FillType="ComplexGradient" MainColor="222, 202, 152">
                        <FillSettings>
                            <ComplexGradient>
                                <telerik:GradientElement Color="222, 202, 152" />
                                <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                                <telerik:GradientElement Color="183, 154, 84" Position="1" />
                            </ComplexGradient>
                        </FillSettings>
                    </FillStyle>
                    <TextAppearance TextProperties-Color="62, 117, 154">
                    </TextAppearance>
                    <Border Color="187, 149, 58" />
                </Appearance>
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
            <FillStyle FillType="Hatch" MainColor="225, 235, 238" 
                SecondColor="207, 223, 229">
            </FillStyle>
            <Border Color="131, 171, 184" />
        </Appearance>
        <ChartTitle>
            <Appearance Dimensions-Margins="3%, 10px, 14px, 5%">
                <FillStyle MainColor="">
                </FillStyle>
            </Appearance>
            <TextBlock Text="Number of Claims">
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
    <asp:SqlDataSource ID="ChartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimId] FROM [Claim]"></asp:SqlDataSource>
</div>
  <div style="margin-left:18px;margin-bottom:20px; float:left;">
    <telerik:RadChart ID="RadChart2" runat="server" Height="243px" 
    Width="373px" DataSourceID="ChartDataSource" DefaultType="Pie" 
    Skin="BlueStripes">
        <Series>
            <telerik:ChartSeries Name="Series 2" Type="Pie">
                <Appearance>
                    <FillStyle FillType="ComplexGradient" MainColor="222, 202, 152">
                        <FillSettings>
                            <ComplexGradient>
                                <telerik:GradientElement Color="222, 202, 152" />
                                <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                                <telerik:GradientElement Color="183, 154, 84" Position="1" />
                            </ComplexGradient>
                        </FillSettings>
                    </FillStyle>
                    <TextAppearance TextProperties-Color="62, 117, 154">
                    </TextAppearance>
                    <Border Color="187, 149, 58" />
                </Appearance>
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
            <FillStyle FillType="Hatch" MainColor="225, 235, 238" 
                SecondColor="207, 223, 229">
            </FillStyle>
            <Border Color="131, 171, 184" />
        </Appearance>
        <ChartTitle>
            <Appearance Dimensions-Margins="3%, 10px, 14px, 5%">
                <FillStyle MainColor="">
                </FillStyle>
            </Appearance>
            <TextBlock Text="Number of Claims">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimId] FROM [Claim]"></asp:SqlDataSource>
</div>
 <div style="margin-left:50px; margin-bottom:20px; float:left;">
    <telerik:RadChart ID="RadChart3" runat="server" Height="243px" 
    Width="373px" DataSourceID="ChartDataSource" DefaultType="Gantt" 
    Skin="DeepRed">
        <Series>
            <telerik:ChartSeries Name="Series 2" Type="Gantt">
                <Appearance>
                    <FillStyle FillType="ComplexGradient" MainColor="213, 247, 255">
                        <FillSettings>
                            <ComplexGradient>
                                <telerik:GradientElement Color="213, 247, 255" />
                                <telerik:GradientElement Color="193, 239, 252" Position="0.5" />
                                <telerik:GradientElement Color="157, 217, 238" Position="1" />
                            </ComplexGradient>
                        </FillSettings>
                    </FillStyle>
                    <TextAppearance TextProperties-Color="White">
                    </TextAppearance>
                </Appearance>
            </telerik:ChartSeries>
        </Series>
        <PlotArea>
            <XAxis>
                <Appearance Color="76, 255, 255, 255" MajorTick-Color="179, 255, 255, 255">
                    <MajorGridLines Color="179, 255, 255, 255" Width="0" />
                    <TextAppearance TextProperties-Color="White">
                    </TextAppearance>
                </Appearance>
                <AxisLabel>
                    <Appearance Dimensions-Paddings="1px, 1px, 10%, 1px">
                    </Appearance>
                    <TextBlock>
                        <Appearance TextProperties-Color="254, 178, 112">
                        </Appearance>
                    </TextBlock>
                </AxisLabel>
            </XAxis>
            <YAxis>
                <Appearance Color="76, 255, 255, 255" MajorTick-Color="179, 255, 255, 255" 
                    MinorTick-Color="179, 255, 255, 255">
                    <MajorGridLines Color="179, 255, 255, 255" />
                    <MinorGridLines Color="179, 255, 255, 255" Width="0" />
                    <TextAppearance TextProperties-Color="White">
                    </TextAppearance>
                </Appearance>
                <AxisLabel>
                    <TextBlock>
                        <Appearance TextProperties-Color="220, 158, 119">
                        </Appearance>
                    </TextBlock>
                </AxisLabel>
            </YAxis>
            <Appearance Dimensions-Margins="19%, 90px, 12%, 9%">
                <FillStyle MainColor="50, 255, 255, 255" SecondColor="Transparent">
                </FillStyle>
                <Border Color="76, 255, 255, 255" />
            </Appearance>
        </PlotArea>
        <Appearance>
            <FillStyle FillType="ComplexGradient">
                <FillSettings>
                    <ComplexGradient>
                        <telerik:GradientElement Color="179, 37, 26" />
                        <telerik:GradientElement Color="253, 153, 66" Position="0.5" />
                        <telerik:GradientElement Color="179, 37, 26" Position="1" />
                    </ComplexGradient>
                </FillSettings>
            </FillStyle>
            <Border Color="141, 50, 0" Width="5" />
        </Appearance>
        <ChartTitle>
            <Appearance Dimensions-Margins="4%, 10px, 14px, 6%">
                <FillStyle MainColor="">
                </FillStyle>
            </Appearance>
            <TextBlock Text="Number of Claims">
                <Appearance TextProperties-Color="White" 
                    TextProperties-Font="Verdana, 14pt">
                </Appearance>
            </TextBlock>
        </ChartTitle>
        <Legend>
            <Appearance Dimensions-Margins="1px, 2%, 12%, 1px">
                <ItemTextAppearance TextProperties-Color="White">
                </ItemTextAppearance>
                <FillStyle MainColor="37, 255, 255, 255">
                </FillStyle>
                <Border Color="76, 255, 255, 255" />
            </Appearance>
            <TextBlock>
                <Appearance Position-AlignedPosition="Top" TextProperties-Color="220, 158, 119">
                </Appearance>
            </TextBlock>
        </Legend>
    </telerik:RadChart>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimId] FROM [Claim]"></asp:SqlDataSource>
</div>
  <div style="margin-left:18px; margin-bottom:20px; float:left;">
    <telerik:RadChart ID="RadChart4" runat="server" Height="243px" 
    Width="373px" DataSourceID="ChartDataSource" DefaultType="Line" 
    Skin="BlueStripes">
        <Series>
            <telerik:ChartSeries Name="Series 2" Type="Line">
                <Appearance>
                    <FillStyle FillType="ComplexGradient" MainColor="222, 202, 152">
                        <FillSettings>
                            <ComplexGradient>
                                <telerik:GradientElement Color="222, 202, 152" />
                                <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                                <telerik:GradientElement Color="183, 154, 84" Position="1" />
                            </ComplexGradient>
                        </FillSettings>
                    </FillStyle>
                    <TextAppearance TextProperties-Color="62, 117, 154">
                    </TextAppearance>
                    <Border Color="187, 149, 58" />
                </Appearance>
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
            <FillStyle FillType="Hatch" MainColor="225, 235, 238" 
                SecondColor="207, 223, 229">
            </FillStyle>
            <Border Color="131, 171, 184" />
        </Appearance>
        <ChartTitle>
            <Appearance Dimensions-Margins="3%, 10px, 14px, 5%">
                <FillStyle MainColor="">
                </FillStyle>
            </Appearance>
            <TextBlock Text="Number of Claims">
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimId] FROM [Claim]"></asp:SqlDataSource>
</div>
 <div style="margin-left:50px; float:left;">
    <telerik:RadChart ID="RadChart5" runat="server" Height="243px" 
    Width="373px" DataSourceID="ChartDataSource" DefaultType="Area" 
    Skin="BlueStripes">
        <Series>
            <telerik:ChartSeries Name="Series 2" Type="Area">
                <Appearance>
                    <FillStyle FillType="ComplexGradient" MainColor="222, 202, 152">
                        <FillSettings>
                            <ComplexGradient>
                                <telerik:GradientElement Color="222, 202, 152" />
                                <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                                <telerik:GradientElement Color="183, 154, 84" Position="1" />
                            </ComplexGradient>
                        </FillSettings>
                    </FillStyle>
                    <TextAppearance TextProperties-Color="62, 117, 154">
                    </TextAppearance>
                    <Border Color="187, 149, 58" />
                </Appearance>
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
            <FillStyle FillType="Hatch" MainColor="225, 235, 238" 
                SecondColor="207, 223, 229">
            </FillStyle>
            <Border Color="131, 171, 184" />
        </Appearance>
        <ChartTitle>
            <Appearance Dimensions-Margins="3%, 10px, 14px, 5%">
                <FillStyle MainColor="">
                </FillStyle>
            </Appearance>
            <TextBlock Text="Number of Claims">
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
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimId] FROM [Claim]"></asp:SqlDataSource>
</div>
  <div style="margin-left:18px; float:left;">
    <telerik:RadChart ID="RadChart6" runat="server" Height="243px" 
    Width="373px" DataSourceID="ChartDataSource" 
    Skin="LightBlue">
        <Series>
            <telerik:ChartSeries Name="Series 2">
                <Appearance>
                    <FillStyle FillType="ComplexGradient" MainColor="243, 206, 119">
                        <FillSettings>
                            <ComplexGradient>
                                <telerik:GradientElement Color="243, 206, 119" />
                                <telerik:GradientElement Color="236, 190, 82" Position="0.5" />
                                <telerik:GradientElement Color="210, 157, 44" Position="1" />
                            </ComplexGradient>
                        </FillSettings>
                    </FillStyle>
                    <TextAppearance TextProperties-Color="112, 93, 56">
                    </TextAppearance>
                    <Border Color="223, 170, 40" />
                </Appearance>
            </telerik:ChartSeries>
        </Series>
        <PlotArea>
            <XAxis>
                <Appearance Color="153, 187, 208" MajorTick-Color="153, 187, 208">
                    <MajorGridLines Color="153, 187, 208" Width="0" />
                    <TextAppearance TextProperties-Color="72, 124, 160">
                    </TextAppearance>
                </Appearance>
                <AxisLabel>
                    <TextBlock>
                        <Appearance TextProperties-Color="72, 124, 160">
                        </Appearance>
                    </TextBlock>
                </AxisLabel>
            </XAxis>
            <YAxis>
                <Appearance Color="153, 187, 208" MajorTick-Color="153, 187, 208" 
                    MinorTick-Color="153, 187, 208">
                    <MajorGridLines Color="153, 187, 208" />
                    <MinorGridLines Color="153, 187, 208" />
                    <TextAppearance TextProperties-Color="72, 124, 160">
                    </TextAppearance>
                </Appearance>
                <AxisLabel>
                    <TextBlock>
                        <Appearance TextProperties-Color="72, 124, 160">
                        </Appearance>
                    </TextBlock>
                </AxisLabel>
            </YAxis>
            <Appearance Dimensions-Margins="18%, 23%, 12%, 10%">
                <FillStyle MainColor="255, 255, 238" SecondColor="Transparent">
                </FillStyle>
                <Border Color="153, 187, 208" />
            </Appearance>
        </PlotArea>
        <Appearance>
            <FillStyle MainColor="240, 252, 255">
            </FillStyle>
            <Border Color="182, 224, 249" />
        </Appearance>
        <ChartTitle>
            <Appearance>
                <FillStyle MainColor="">
                </FillStyle>
            </Appearance>
            <TextBlock Text="Number of Claims">
                <Appearance TextProperties-Color="8, 103, 166">
                </Appearance>
            </TextBlock>
        </ChartTitle>
        <Legend>
            <Appearance Corners="Round, Round, Round, Round, 6">
                <ItemTextAppearance TextProperties-Color="62, 117, 154">
                </ItemTextAppearance>
                <Border Color="208, 237, 255" />
            </Appearance>
        </Legend>
    </telerik:RadChart>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ClaimId] FROM [Claim]"></asp:SqlDataSource>
</div>
</div>
</asp:Content>
