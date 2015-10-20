namespace UC_LIVE
{
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;

    partial class RTAClaims4
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RTAClaims4));
            Telerik.Reporting.Drawing.StyleRule styleRule1 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule2 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule3 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule4 = new Telerik.Reporting.Drawing.StyleRule();
            this.RTAClaims = new Telerik.Reporting.SqlDataSource();
            this.labelsGroupHeader = new Telerik.Reporting.GroupHeaderSection();
            this.labelsGroupFooter = new Telerik.Reporting.GroupFooterSection();
            this.labelsGroup = new Telerik.Reporting.Group();
            this.pageFooter = new Telerik.Reporting.PageFooterSection();
            this.currentTimeTextBox = new Telerik.Reporting.TextBox();
            this.pageInfoTextBox = new Telerik.Reporting.TextBox();
            this.detail = new Telerik.Reporting.DetailSection();
            this.pageHeader = new Telerik.Reporting.PageHeaderSection();
            this.phoneCaptionTextBox = new Telerik.Reporting.TextBox();
            this.surnameCaptionTextBox = new Telerik.Reporting.TextBox();
            this.firstNameCaptionTextBox = new Telerik.Reporting.TextBox();
            this.statusCaptionTextBox = new Telerik.Reporting.TextBox();
            this.accidentDateCaptionTextBox = new Telerik.Reporting.TextBox();
            this.claimTitleCaptionTextBox = new Telerik.Reporting.TextBox();
            this.claimRefCaptionTextBox = new Telerik.Reporting.TextBox();
            this.titleTextBox = new Telerik.Reporting.TextBox();
            this.phoneDataTextBox = new Telerik.Reporting.TextBox();
            this.surnameDataTextBox = new Telerik.Reporting.TextBox();
            this.firstNameDataTextBox = new Telerik.Reporting.TextBox();
            this.statusDataTextBox = new Telerik.Reporting.TextBox();
            this.accidentDateDataTextBox = new Telerik.Reporting.TextBox();
            this.claimTitleDataTextBox = new Telerik.Reporting.TextBox();
            this.claimRefDataTextBox = new Telerik.Reporting.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // RTAClaims
            // 
            this.RTAClaims.ConnectionString = "UC_LIVE.Properties.Settings.ConnectionString";
            this.RTAClaims.Name = "RTAClaims";
            this.RTAClaims.SelectCommand = resources.GetString("RTAClaims.SelectCommand");
            // 
            // labelsGroupHeader
            // 
            this.labelsGroupHeader.Height = new Telerik.Reporting.Drawing.Unit(0.71437495946884155, Telerik.Reporting.Drawing.UnitType.Cm);
            this.labelsGroupHeader.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.phoneCaptionTextBox,
            this.surnameCaptionTextBox,
            this.firstNameCaptionTextBox,
            this.statusCaptionTextBox,
            this.accidentDateCaptionTextBox,
            this.claimTitleCaptionTextBox,
            this.claimRefCaptionTextBox});
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
            // detail
            // 
            this.detail.Height = new Telerik.Reporting.Drawing.Unit(0.71437495946884155, Telerik.Reporting.Drawing.UnitType.Cm);
            this.detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.phoneDataTextBox,
            this.surnameDataTextBox,
            this.firstNameDataTextBox,
            this.statusDataTextBox,
            this.accidentDateDataTextBox,
            this.claimTitleDataTextBox,
            this.claimRefDataTextBox});
            this.detail.Name = "detail";
            // 
            // pageHeader
            // 
            this.pageHeader.Height = new Telerik.Reporting.Drawing.Unit(1.2000000476837158, Telerik.Reporting.Drawing.UnitType.Cm);
            this.pageHeader.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.titleTextBox});
            this.pageHeader.Name = "pageHeader";
            // 
            // phoneCaptionTextBox
            // 
            this.phoneCaptionTextBox.CanGrow = true;
            this.phoneCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(13.282916069030762, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.phoneCaptionTextBox.Name = "phoneCaptionTextBox";
            this.phoneCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.0998010635375977, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.phoneCaptionTextBox.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(9, Telerik.Reporting.Drawing.UnitType.Point);
            this.phoneCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
            this.phoneCaptionTextBox.StyleName = "Caption";
            this.phoneCaptionTextBox.Value = "Phone:";
            // 
            // surnameCaptionTextBox
            // 
            this.surnameCaptionTextBox.CanGrow = true;
            this.surnameCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(11.272083282470703, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.surnameCaptionTextBox.Name = "surnameCaptionTextBox";
            this.surnameCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.022538423538208, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.surnameCaptionTextBox.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(9, Telerik.Reporting.Drawing.UnitType.Point);
            this.surnameCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
            this.surnameCaptionTextBox.StyleName = "Caption";
            this.surnameCaptionTextBox.Value = "Surname:";
            // 
            // firstNameCaptionTextBox
            // 
            this.firstNameCaptionTextBox.CanGrow = true;
            this.firstNameCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(9.23479175567627, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.firstNameCaptionTextBox.Name = "firstNameCaptionTextBox";
            this.firstNameCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.0587360858917236, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.firstNameCaptionTextBox.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(9, Telerik.Reporting.Drawing.UnitType.Point);
            this.firstNameCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
            this.firstNameCaptionTextBox.StyleName = "Caption";
            this.firstNameCaptionTextBox.Value = "FirstName:";
            // 
            // statusCaptionTextBox
            // 
            this.statusCaptionTextBox.CanGrow = true;
            this.statusCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(6.87999963760376, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.statusCaptionTextBox.Name = "statusCaptionTextBox";
            this.statusCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.3406634330749512, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.statusCaptionTextBox.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(9, Telerik.Reporting.Drawing.UnitType.Point);
            this.statusCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
            this.statusCaptionTextBox.StyleName = "Caption";
            this.statusCaptionTextBox.Value = "Status:";
            // 
            // accidentDateCaptionTextBox
            // 
            this.accidentDateCaptionTextBox.CanGrow = true;
            this.accidentDateCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(4.3135414123535156, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.accidentDateCaptionTextBox.Name = "accidentDateCaptionTextBox";
            this.accidentDateCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.5668833255767822, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.accidentDateCaptionTextBox.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(9, Telerik.Reporting.Drawing.UnitType.Point);
            this.accidentDateCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
            this.accidentDateCaptionTextBox.StyleName = "Caption";
            this.accidentDateCaptionTextBox.Value = "Accident Date:";
            // 
            // claimTitleCaptionTextBox
            // 
            this.claimTitleCaptionTextBox.CanGrow = true;
            this.claimTitleCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(1.7999999523162842, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimTitleCaptionTextBox.Name = "claimTitleCaptionTextBox";
            this.claimTitleCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.5327162742614746, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimTitleCaptionTextBox.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(9, Telerik.Reporting.Drawing.UnitType.Point);
            this.claimTitleCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
            this.claimTitleCaptionTextBox.StyleName = "Caption";
            this.claimTitleCaptionTextBox.Value = "ClaimTitle:";
            // 
            // claimRefCaptionTextBox
            // 
            this.claimRefCaptionTextBox.CanGrow = true;
            this.claimRefCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(0.00083328242180868983, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimRefCaptionTextBox.Name = "claimRefCaptionTextBox";
            this.claimRefCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.7470831871032715, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimRefCaptionTextBox.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(9, Telerik.Reporting.Drawing.UnitType.Point);
            this.claimRefCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
            this.claimRefCaptionTextBox.StyleName = "Caption";
            this.claimRefCaptionTextBox.Value = "ClaimRef:";
            // 
            // titleTextBox
            // 
            this.titleTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.00010002215276472271, Telerik.Reporting.Drawing.UnitType.Cm));
            this.titleTextBox.Name = "titleTextBox";
            this.titleTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(15.814167022705078, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(1.085625171661377, Telerik.Reporting.Drawing.UnitType.Cm));
            this.titleTextBox.StyleName = "Title";
            this.titleTextBox.Value = "RTA Claims";
            // 
            // phoneDataTextBox
            // 
            this.phoneDataTextBox.CanGrow = true;
            this.phoneDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(13.282916069030762, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.phoneDataTextBox.Name = "phoneDataTextBox";
            this.phoneDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.0998010635375977, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.phoneDataTextBox.StyleName = "Data";
            this.phoneDataTextBox.Value = "=Fields.Phone";
            // 
            // surnameDataTextBox
            // 
            this.surnameDataTextBox.CanGrow = true;
            this.surnameDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(11.272083282470703, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.surnameDataTextBox.Name = "surnameDataTextBox";
            this.surnameDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.022538423538208, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.surnameDataTextBox.StyleName = "Data";
            this.surnameDataTextBox.Value = "=Fields.Surname";
            // 
            // firstNameDataTextBox
            // 
            this.firstNameDataTextBox.CanGrow = true;
            this.firstNameDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(9.23479175567627, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.firstNameDataTextBox.Name = "firstNameDataTextBox";
            this.firstNameDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.0587360858917236, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.firstNameDataTextBox.StyleName = "Data";
            this.firstNameDataTextBox.Value = "=Fields.FirstName";
            // 
            // statusDataTextBox
            // 
            this.statusDataTextBox.CanGrow = true;
            this.statusDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(6.87999963760376, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.statusDataTextBox.Name = "statusDataTextBox";
            this.statusDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.3406634330749512, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.statusDataTextBox.StyleName = "Data";
            this.statusDataTextBox.Value = "=Fields.Status";
            // 
            // accidentDateDataTextBox
            // 
            this.accidentDateDataTextBox.CanGrow = true;
            this.accidentDateDataTextBox.Format = "{0:d}";
            this.accidentDateDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(4.3135414123535156, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.accidentDateDataTextBox.Name = "accidentDateDataTextBox";
            this.accidentDateDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.5668833255767822, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.accidentDateDataTextBox.StyleName = "Data";
            this.accidentDateDataTextBox.Value = "=Fields.AccidentDate";
            // 
            // claimTitleDataTextBox
            // 
            this.claimTitleDataTextBox.CanGrow = true;
            this.claimTitleDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(1.7999999523162842, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimTitleDataTextBox.Name = "claimTitleDataTextBox";
            this.claimTitleDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.5327162742614746, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimTitleDataTextBox.StyleName = "Data";
            this.claimTitleDataTextBox.Value = "=Fields.ClaimTitle";
            // 
            // claimRefDataTextBox
            // 
            this.claimRefDataTextBox.CanGrow = true;
            this.claimRefDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(0.00083328242180868983, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.00010012308484874666, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimRefDataTextBox.Name = "claimRefDataTextBox";
            this.claimRefDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(1.7470831871032715, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.60000002384185791, Telerik.Reporting.Drawing.UnitType.Cm));
            this.claimRefDataTextBox.StyleName = "Data";
            this.claimRefDataTextBox.Value = "=Fields.ClaimRef";
            // 
            // RTAClaims4
            // 
            this.DataSource = this.RTAClaims;
            this.Groups.AddRange(new Telerik.Reporting.Group[] {
            this.labelsGroup});
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.labelsGroupHeader,
            this.labelsGroupFooter,
            this.pageHeader,
            this.pageFooter,
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
            styleRule1.Style.BackgroundColor = System.Drawing.Color.Empty;
            styleRule1.Style.Color = System.Drawing.Color.FromArgb(((int)(((byte)(28)))), ((int)(((byte)(58)))), ((int)(((byte)(112)))));
            styleRule1.Style.Font.Name = "Tahoma";
            styleRule1.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(18, Telerik.Reporting.Drawing.UnitType.Point);
            styleRule2.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Caption")});
            styleRule2.Style.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(28)))), ((int)(((byte)(58)))), ((int)(((byte)(112)))));
            styleRule2.Style.Color = System.Drawing.Color.White;
            styleRule2.Style.Font.Bold = true;
            styleRule2.Style.Font.Italic = false;
            styleRule2.Style.Font.Name = "Tahoma";
            styleRule2.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(11, Telerik.Reporting.Drawing.UnitType.Point);
            styleRule2.Style.Font.Strikeout = false;
            styleRule2.Style.Font.Underline = false;
            styleRule2.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule3.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Data")});
            styleRule3.Style.Color = System.Drawing.Color.Black;
            styleRule3.Style.Font.Name = "Tahoma";
            styleRule3.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(10, Telerik.Reporting.Drawing.UnitType.Point);
            styleRule3.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule4.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("PageInfo")});
            styleRule4.Style.Color = System.Drawing.Color.Black;
            styleRule4.Style.Font.Name = "Tahoma";
            styleRule4.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(8, Telerik.Reporting.Drawing.UnitType.Point);
            styleRule4.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.StyleSheet.AddRange(new Telerik.Reporting.Drawing.StyleRule[] {
            styleRule1,
            styleRule2,
            styleRule3,
            styleRule4});
            this.Width = new Telerik.Reporting.Drawing.Unit(17.5, Telerik.Reporting.Drawing.UnitType.Cm);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private SqlDataSource RTAClaims;
        private GroupHeaderSection labelsGroupHeader;
        private GroupFooterSection labelsGroupFooter;
        private Group labelsGroup;
        private PageFooterSection pageFooter;
        private Telerik.Reporting.TextBox currentTimeTextBox;
        private Telerik.Reporting.TextBox pageInfoTextBox;
        private DetailSection detail;
        private PageHeaderSection pageHeader;
        private Telerik.Reporting.TextBox phoneCaptionTextBox;
        private Telerik.Reporting.TextBox surnameCaptionTextBox;
        private Telerik.Reporting.TextBox firstNameCaptionTextBox;
        private Telerik.Reporting.TextBox statusCaptionTextBox;
        private Telerik.Reporting.TextBox accidentDateCaptionTextBox;
        private Telerik.Reporting.TextBox claimTitleCaptionTextBox;
        private Telerik.Reporting.TextBox claimRefCaptionTextBox;
        private Telerik.Reporting.TextBox titleTextBox;
        private Telerik.Reporting.TextBox phoneDataTextBox;
        private Telerik.Reporting.TextBox surnameDataTextBox;
        private Telerik.Reporting.TextBox firstNameDataTextBox;
        private Telerik.Reporting.TextBox statusDataTextBox;
        private Telerik.Reporting.TextBox accidentDateDataTextBox;
        private Telerik.Reporting.TextBox claimTitleDataTextBox;
        private Telerik.Reporting.TextBox claimRefDataTextBox;
    }
}