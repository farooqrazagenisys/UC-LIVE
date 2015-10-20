using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class SolicitorClaims : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchContacts1_Click1(object sender, EventArgs e)
        {
            this.GridView3.DataBind();
        }

        

    }
}
