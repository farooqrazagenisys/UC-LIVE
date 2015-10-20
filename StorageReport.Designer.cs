namespace UC_LIVE
{
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;

    partial class StorageReport
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(StorageReport));
            Telerik.Reporting.Drawing.StyleRule styleRule1 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule2 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule3 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule4 = new Telerik.Reporting.Drawing.StyleRule();
            this.StroageInvoice = new Telerik.Reporting.SqlDataSource();
            this.labelsGroupHeader = new Telerik.Reporting.GroupHeaderSection();
            this.labelsGroupFooter = new Telerik.Reporting.GroupFooterSection();
            this.labelsGroup = new Telerik.Reporting.Group();
            this.pageHeader = new Telerik.Reporting.PageHeaderSection();
            this.reportNameTextBox = new Telerik.Reporting.TextBox();
            this.pageFooter = new Telerik.Reporting.PageFooterSection();
            this.currentTimeTextBox = new Telerik.Reporting.TextBox();
            this.pageInfoTextBox = new Telerik.Reporting.TextBox();
            this.reportHeader = new Telerik.Reporting.ReportHeaderSection();
            this.titleTextBox = new Telerik.Reporting.TextBox();
            this.invoiceIDCaptionTextBox = new Telerik.Reporting.TextBox();
            this.invoiceIDDataTextBox = new Telerik.Reporting.TextBox();
            this.invoiceDateCaptionTextBox = new Telerik.Reporting.TextBox();
            this.invoiceDateDataTextBox = new Telerik.Reporting.TextBox();
            this.claimIDCaptionTextBox = new Telerik.Reporting.TextBox();
            this.claimIDDataTextBox = new Telerik.Reporting.TextBox();
            this.totalAmountCaptionTextBox = new Telerik.Reporting.TextBox();
            this.totalAmountDataTextBox = new Telerik.Reporting.TextBox();
            this.totalVATCaptionTextBox = new Telerik.Reporting.TextBox();
            this.totalVATDataTextBox = new Telerik.Reporting.TextBox();
            this.grandTotalCaptionTextBox = new Telerik.Reporting.TextBox();
            this.grandTotalDataTextBox = new Telerik.Reporting.TextBox();
            this.amountDueCaptionTextBox = new Telerik.Reporting.TextBox();
            this.amountDueDataTextBox = new Telerik.Reporting.TextBox();
            this.detail = new Telerik.Reporting.DetailSection();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // StroageInvoice
            // 
            this.StroageInvoice.ConnectionString = "UC_LIVE.Properties.Settings.ConnectionString";
            this.StroageInvoice.Name = "StroageInvoice";
            this.StroageInvoice.SelectCommand = resources.GetString("StroageInvoice.SelectCommand");
            // 
            // labelsGroupHeader
            // 
            this.labelsGroupHeader.Height = new Telerik.Reporting.Drawing.Unit(0.71437495946884155, Telerik.Reporting.Drawing.UnitType.Cm);
            this.labelsGroupHeader.Name = "labelsGroupHeader";
            this.labelsGroupHeader.PrintOnEveryPage = true;
            // 
            // labelsGroupFooter
            // 
            this.labelsGroupFooter.Height = new Telerik.Reporting.Drawing.Unit(0.71437495946884155, Telerik.Reporting.Drawing.UnitType.Cm);
            this.labelsGroupFooter.Name = "labelsGroupFooter";
            this.labelsGroupFooter.Style.Visible = false;
            // 
            // labelsGroup
            // 
            this.labelsGroup.GroupFooter = this.labelsGroupFooter;
            this.labelsGroup.GroupHeader = this.labelsGroupHeader;
            this.labelsGroup.Name = "labelsGroup";
            // 
            // pageHeader
            // 
            this.pageHeader.Height = new Telerik.Reporting.Drawing.Unit(0.71437495946884155, Telerik.Reporting.Drawing.UnitType.Cm);
            this.pageHeader.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.reportNameTextBox});
            this.pageHeader.Name = "pageHeader";
            // 
            // reportNameTextBox
            // 
            this.reportNameTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(0.052916664630174637, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.052916664630174637, Telerik.Reporting.Drawing.UnitType.Cm));
            this.reportNameTextBox.Name = "reportNameTextBox";
            this.reportNameTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(15.708333015441895, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.reportNameTextBox.StyleName = "PageInfo";
            this.reportNameTextBox.Value = "StorageReport";
            // 
            // pageFooter
            // 
            this.pageFooter.Height = new Telerik.Reporting.Drawing.Unit(0.71437495946884155, Telerik.Reporting.Drawing.UnitType.Cm);
            this.pageFooter.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.currentTimeTextBox,
            this.pageInfoTextBox});
            this.pageFooter.Name = "pageFooter";
            // 
            // currentTimeTextBox
            // 
            this.currentTimeTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(0.052916664630174637, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.052916664630174637, Telerik.Reporting.Drawing.UnitType.Cm));
            this.currentTimeTextBox.Name = "currentTimeTextBox";
            this.currentTimeTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(7.8277082443237305, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.currentTimeTextBox.StyleName = "PageInfo";
            this.currentTimeTextBox.Value = "=NOW()";
            // 
            // pageInfoTextBox
            // 
            this.pageInfoTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(7.9335417747497559, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.052916664630174637, Telerik.Reporting.Drawing.UnitType.Cm));
            this.pageInfoTextBox.Name = "pageInfoTextBox";
            this.pageInfoTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(7.8277082443237305, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.pageInfoTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.pageInfoTextBox.StyleName = "PageInfo";
            this.pageInfoTextBox.Value = "=PageNumber";
            // 
            // reportHeader
            // 
            this.reportHeader.Height = new Telerik.Reporting.Drawing.Unit(2.7058331966400146, Telerik.Reporting.Drawing.UnitType.Cm);
            this.reportHeader.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.titleTextBox,
            this.invoiceIDCaptionTextBox,
            this.invoiceIDDataTextBox,
            this.invoiceDateCaptionTextBox,
            this.invoiceDateDataTextBox,
            this.claimIDCaptionTextBox,
            this.claimIDDataTextBox,
            this.totalAmountCaptionTextBox,
            this.totalAmountDataTextBox,
            this.totalVATCaptionTextBox,
            this.totalVATDataTextBox,
            this.grandTotalCaptionTextBox,
            this.grandTotalDataTextBox,
            this.amountDueCaptionTextBox,
            this.amountDueDataTextBox});
            this.reportHeader.Name = "reportHeader";
            // 
            // titleTextBox
            // 
            this.titleTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.titleTextBox.Name = "titleTextBox";
            this.titleTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(15.814167022705078, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2, Telerik.Reporting.Drawing.UnitType.Cm));
            this.titleTextBox.StyleName = "Title";
            this.titleTextBox.Value = "Storage Report";
            // 
            // invoiceIDCaptionTextBox
            // 
            this.invoiceIDCaptionTextBox.CanGrow = true;
            this.invoiceIDCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(0.052916664630174637, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.invoiceIDCaptionTextBox.Name = "invoiceIDCaptionTextBox";
            this.invoiceIDCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.invoiceIDCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.invoiceIDCaptionTextBox.StyleName = "Caption";
            this.invoiceIDCaptionTextBox.Value = "InvoiceID:";
            // 
            // invoiceIDDataTextBox
            // 
            this.invoiceIDDataTextBox.CanGrow = true;
            this.invoiceIDDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(1.178720235824585, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.invoiceIDDataTextBox.Name = "invoiceIDDataTextBox";
            this.invoiceIDDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.invoiceIDDataTextBox.StyleName = "Data";
            this.invoiceIDDataTextBox.Value = "=Fields.InvoiceID";
            // 
            // invoiceDateCaptionTextBox
            // 
            this.invoiceDateCaptionTextBox.CanGrow = true;
            this.invoiceDateCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(2.3045237064361572, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.invoiceDateCaptionTextBox.Name = "invoiceDateCaptionTextBox";
            this.invoiceDateCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.invoiceDateCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.invoiceDateCaptionTextBox.StyleName = "Caption";
            this.invoiceDateCaptionTextBox.Value = "InvoiceDate:";
            // 
            // invoiceDateDataTextBox
            // 
            this.invoiceDateDataTextBox.CanGrow = true;
            this.invoiceDateDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(3.4303274154663086, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.invoiceDateDataTextBox.Name = "invoiceDateDataTextBox";
            this.invoiceDateDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.invoiceDateDataTextBox.StyleName = "Data";
            this.invoiceDateDataTextBox.Value = "=Fields.InvoiceDate";
            // 
            // claimIDCaptionTextBox
            // 
            this.claimIDCaptionTextBox.CanGrow = true;
            this.claimIDCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(4.5561308860778809, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimIDCaptionTextBox.Name = "claimIDCaptionTextBox";
            this.claimIDCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimIDCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.claimIDCaptionTextBox.StyleName = "Caption";
            this.claimIDCaptionTextBox.Value = "ClaimID:";
            // 
            // claimIDDataTextBox
            // 
            this.claimIDDataTextBox.CanGrow = true;
            this.claimIDDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(5.6819343566894531, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimIDDataTextBox.Name = "claimIDDataTextBox";
            this.claimIDDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimIDDataTextBox.StyleName = "Data";
            this.claimIDDataTextBox.Value = "=Fields.ClaimID";
            // 
            // totalAmountCaptionTextBox
            // 
            this.totalAmountCaptionTextBox.CanGrow = true;
            this.totalAmountCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(6.8077378273010254, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.totalAmountCaptionTextBox.Name = "totalAmountCaptionTextBox";
            this.totalAmountCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.totalAmountCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.totalAmountCaptionTextBox.StyleName = "Caption";
            this.totalAmountCaptionTextBox.Value = "TotalAmount:";
            // 
            // totalAmountDataTextBox
            // 
            this.totalAmountDataTextBox.CanGrow = true;
            this.totalAmountDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(7.9335412979125977, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.totalAmountDataTextBox.Name = "totalAmountDataTextBox";
            this.totalAmountDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.totalAmountDataTextBox.StyleName = "Data";
            this.totalAmountDataTextBox.Value = "=Fields.TotalAmount";
            // 
            // totalVATCaptionTextBox
            // 
            this.totalVATCaptionTextBox.CanGrow = true;
            this.totalVATCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(9.0593442916870117, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.totalVATCaptionTextBox.Name = "totalVATCaptionTextBox";
            this.totalVATCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.totalVATCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.totalVATCaptionTextBox.StyleName = "Caption";
            this.totalVATCaptionTextBox.Value = "TotalVAT:";
            // 
            // totalVATDataTextBox
            // 
            this.totalVATDataTextBox.CanGrow = true;
            this.totalVATDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(10.185148239135742, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.totalVATDataTextBox.Name = "totalVATDataTextBox";
            this.totalVATDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.totalVATDataTextBox.StyleName = "Data";
            this.totalVATDataTextBox.Value = "=Fields.TotalVAT";
            // 
            // grandTotalCaptionTextBox
            // 
            this.grandTotalCaptionTextBox.CanGrow = true;
            this.grandTotalCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(11.310951232910156, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.grandTotalCaptionTextBox.Name = "grandTotalCaptionTextBox";
            this.grandTotalCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.grandTotalCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.grandTotalCaptionTextBox.StyleName = "Caption";
            this.grandTotalCaptionTextBox.Value = "GrandTotal:";
            // 
            // grandTotalDataTextBox
            // 
            this.grandTotalDataTextBox.CanGrow = true;
            this.grandTotalDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(12.43675422668457, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.grandTotalDataTextBox.Name = "grandTotalDataTextBox";
            this.grandTotalDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.grandTotalDataTextBox.StyleName = "Data";
            this.grandTotalDataTextBox.Value = "=Fields.GrandTotal";
            // 
            // amountDueCaptionTextBox
            // 
            this.amountDueCaptionTextBox.CanGrow = true;
            this.amountDueCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(13.5625581741333, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.amountDueCaptionTextBox.Name = "amountDueCaptionTextBox";
            this.amountDueCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.amountDueCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.amountDueCaptionTextBox.StyleName = "Caption";
            this.amountDueCaptionTextBox.Value = "AmountDue:";
            // 
            // amountDueDataTextBox
            // 
            this.amountDueDataTextBox.CanGrow = true;
            this.amountDueDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(14.688362121582031, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(2.0529167652130127, Telerik.Reporting.Drawing.UnitType.Cm));
            this.amountDueDataTextBox.Name = "amountDueDataTextBox";
            this.amountDueDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.0728869438171387, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.amountDueDataTextBox.StyleName = "Data";
            this.amountDueDataTextBox.Value = "=Fields.AmountDue";
            // 
            // detail
            // 
            this.detail.Height = new Telerik.Reporting.Drawing.Unit(0.71437495946884155, Telerik.Reporting.Drawing.UnitType.Cm);
            this.detail.Name = "detail";
            // 
            // StorageReport
            // 
            this.DataSource = this.StroageInvoice;
            this.Groups.AddRange(new Telerik.Reporting.Group[] {
            this.labelsGroup});
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.labelsGroupHeader,
            this.labelsGroupFooter,
            this.pageHeader,
            this.pageFooter,
            this.reportHeader,
            this.detail});
            this.PageSettings.Landscape = false;
            this.PageSettings.Margins.Bottom = new Telerik.Reporting.Drawing.Unit(2.5399999618530273, Telerik.Reporting.Drawing.UnitType.Cm);
            this.PageSettings.Margins.Left = new Telerik.Reporting.Drawing.Unit(2.5399999618530273, Telerik.Reporting.Drawing.UnitType.Cm);
            this.PageSettings.Margins.Right = new Telerik.Reporting.Drawing.Unit(2.5399999618530273, Telerik.Reporting.Drawing.UnitType.Cm);
            this.PageSettings.Margins.Top = new Telerik.Reporting.Drawing.Unit(2.5399999618530273, Telerik.Reporting.Drawing.UnitType.Cm);
            this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
            this.Style.BackgroundColor = System.Drawing.Color.White;
            styleRule1.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Title")});
            styleRule1.Style.Color = System.Drawing.Color.Black;
            styleRule1.Style.Font.Bold = true;
            styleRule1.Style.Font.Italic = false;
            styleRule1.Style.Font.Name = "Tahoma";
            styleRule1.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(20, Telerik.Reporting.Drawing.UnitType.Point);
            styleRule1.Style.Font.Strikeout = false;
            styleRule1.Style.Font.Underline = false;
            styleRule2.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Caption")});
            styleRule2.Style.Color = System.Drawing.Color.Black;
            styleRule2.Style.Font.Name = "Tahoma";
            styleRule2.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(11, Telerik.Reporting.Drawing.UnitType.Point);
            styleRule2.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule3.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Data")});
            styleRule3.Style.Font.Name = "Tahoma";
            styleRule3.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(11, Telerik.Reporting.Drawing.UnitType.Point);
            styleRule3.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule4.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("PageInfo")});
            styleRule4.Style.Font.Name = "Tahoma";
            styleRule4.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(11, Telerik.Reporting.Drawing.UnitType.Point);
            styleRule4.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.StyleSheet.AddRange(new Telerik.Reporting.Drawing.StyleRule[] {
            styleRule1,
            styleRule2,
            styleRule3,
            styleRule4});
            this.Width = new Telerik.Reporting.Drawing.Unit(15.814167022705078, Telerik.Reporting.Drawing.UnitType.Cm);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private SqlDataSource StroageInvoice;
        private GroupHeaderSection labelsGroupHeader;
        private GroupFooterSection labelsGroupFooter;
        private Group labelsGroup;
        private PageHeaderSection pageHeader;
        private Telerik.Reporting.TextBox reportNameTextBox;
        private PageFooterSection pageFooter;
        private Telerik.Reporting.TextBox currentTimeTextBox;
        private Telerik.Reporting.TextBox pageInfoTextBox;
        private ReportHeaderSection reportHeader;
        private Telerik.Reporting.TextBox titleTextBox;
        private Telerik.Reporting.TextBox invoiceIDCaptionTextBox;
        private Telerik.Reporting.TextBox invoiceIDDataTextBox;
        private Telerik.Reporting.TextBox invoiceDateCaptionTextBox;
        private Telerik.Reporting.TextBox invoiceDateDataTextBox;
        private Telerik.Reporting.TextBox claimIDCaptionTextBox;
        private Telerik.Reporting.TextBox claimIDDataTextBox;
        private Telerik.Reporting.TextBox totalAmountCaptionTextBox;
        private Telerik.Reporting.TextBox totalAmountDataTextBox;
        private Telerik.Reporting.TextBox totalVATCaptionTextBox;
        private Telerik.Reporting.TextBox totalVATDataTextBox;
        private Telerik.Reporting.TextBox grandTotalCaptionTextBox;
        private Telerik.Reporting.TextBox grandTotalDataTextBox;
        private Telerik.Reporting.TextBox amountDueCaptionTextBox;
        private Telerik.Reporting.TextBox amountDueDataTextBox;
        private DetailSection detail;
    }
}