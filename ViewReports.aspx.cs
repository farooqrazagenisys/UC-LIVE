using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class ViewReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Report1 contactrecords = new Report1();
            //this.rptViewer.Report = contactrecords;

            if (Convert.ToString(Request.QueryString["ReportTitle"])=="ClaimTypes")
            {

                ClaimTypesReport1 ClaimTypesReport = new ClaimTypesReport1();
                this.rptViewer.Report = ClaimTypesReport;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "CarHireInvoice")
            {

                CarHire CarhireInovoiceReport = new CarHire();
                this.rptViewer.Report = CarhireInovoiceReport;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "PotentialClaims")
            {

                PotentialClaims PotentailClaims1 = new PotentialClaims();
                this.rptViewer.Report = PotentailClaims1;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "AcceptedClaims")
            {

                AcceptedClaimsReport AccepetedClaimsReport = new AcceptedClaimsReport();
                this.rptViewer.Report = AccepetedClaimsReport;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "RejectedClaims")
            {

                RejectedReport RejectReportinstance = new RejectedReport();
                this.rptViewer.Report = RejectReportinstance;
             }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "CompletedClaims")
            {

                CompletedReport CompletedReportInstance = new CompletedReport();
                this.rptViewer.Report = CompletedReportInstance;
            }


            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "ReplacementClaims")
            {

                ReplacementsReport ReplacementClaims = new ReplacementsReport();
                this.rptViewer.Report = ReplacementClaims;
            }


            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "HirePending")
            {

                HirePending1 PendingPayments1 = new HirePending1();
                this.rptViewer.Report = PendingPayments1;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "HirePaid")
            {

                HirePaid1 Hirepaid1 = new HirePaid1();
                this.rptViewer.Report = Hirepaid1;
            }


            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "HirePartial")
            {

                HirePartial1 PartiallyPaid1 = new HirePartial1();
               this.rptViewer.Report = PartiallyPaid1;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "StoragePending")
            {
                StoragePending StoragePending1 = new StoragePending();
                this.rptViewer.Report = StoragePending1;
            }


            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "StoragePaid")
            {
                StoragePaid StoragePaid1 = new StoragePaid();
                this.rptViewer.Report = StoragePaid1;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "StoragePartial")
            {
                StoragePartial StoragePartial1 = new StoragePartial();
                this.rptViewer.Report = StoragePartial1;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "PIClaims")
            {
                PIClaims1 PIClaims1 = new PIClaims1();
                this.rptViewer.Report = PIClaims1;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "PIRTAClaims")
            {
                PIRTAClaims PIRTAClaims = new PIRTAClaims();
                this.rptViewer.Report = PIRTAClaims;
            }

            if (Convert.ToString(Request.QueryString["ReportTitle"]) == "RTAClaims")
            {
                RTAClaims4 RTAClaims43 = new RTAClaims4();
                this.rptViewer.Report = RTAClaims43;
            }
         
        }
    }
}
