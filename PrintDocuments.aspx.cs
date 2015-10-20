using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class PrintDocuments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);




            if (Request.QueryString["ClaimType"] == "1")
            {
              
                
                RTAForm.Enabled = false;
                AccidentClaimForm.Enabled = false;
                PaymentRequest.Enabled = false;
                CarHireForm.Enabled = false;
                UsedDates.Enabled = false;
               

            }





            LossOfUsedDates.Attributes["src"] = "UsefulDates.aspx?ClaimID=" + ClaimID;
            NewCarHireForm.Attributes["src"] = "NewCarhireForm.aspx?ClaimID=" + ClaimID;
            PaymentRequestLetter.Attributes["src"] = "PaymentRequestLetter.aspx?ClaimID=" + ClaimID;
            PersonInjuryForm.Attributes["src"] = "PersonalInjuryForm.aspx?ClaimID=" + ClaimID;
            ClaimAdviceForm.Attributes["src"] = "ClaimAdviceForm.aspx?ClaimID=" + ClaimID;
            RTAFrom.Attributes["src"] = "RTAForm.aspx?ClaimID=" + ClaimID;
            ClaimDetails.Attributes["href"] = "AddClaim.aspx?ClaimID=" + ClaimID;
        }
    }
}
