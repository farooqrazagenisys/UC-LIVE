using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class SearchClaims : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
             


        protected void SearchClaimsAction_Click(object sender, EventArgs e)
        {
            this.GridView1.DataBind();
        }

    }
}
