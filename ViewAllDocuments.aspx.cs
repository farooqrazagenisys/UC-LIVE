using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class ViewAllDocuments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);

            LossOfUsedDates.Attributes["src"] = "UsefulDates.aspx?ClaimID=" + ClaimID;
            NewCarHireForm.Attributes["src"] = "NewCarhireForm.aspx?ClaimID=" + ClaimID;
            PaymentRequestLetter.Attributes["src"] = "PaymentRequestLetter.aspx?ClaimID=" + ClaimID;
            PersonInjuryForm.Attributes["src"] = "PersonalInjuryForm.aspx?ClaimID=" + ClaimID;
            ClaimAdviceForm.Attributes["src"] = "ClaimAdviceForm.aspx?ClaimID=" + ClaimID;
            RTAFrom.Attributes["src"] = "RTAForm.aspx?ClaimID=" + ClaimID;



                //src="UsefulDates.aspx?ClaimID=64630"
        }
    }
}
