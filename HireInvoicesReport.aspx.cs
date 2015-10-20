using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class HireInvoicesReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //  LossOfUsedDates.Attributes["src"] = "UsefulDates.aspx?ClaimID=" + ClaimID;


            PendingInvoicesReport.Attributes["src"] = "ViewReports.aspx?ReportTitle='HirePending'";
            PaidInvoicesReport.Attributes["src"] = "ViewReports.aspx?ReportTitle='HirePaid'";
            PartiallyPaid.Attributes["src"] = "ViewReports.aspx?ReportTitle='HirePartial'";
           
        }
    }
}
