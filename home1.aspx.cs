using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
		protected void HidePanel(object sender, EventArgs e)
		{
			

		}

	
		protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
		{
			if (this.Panel1.Visible == false)
			{
				this.Panel1.Visible = true;

			}
			else
			{
				this.Panel1.Visible = false;

			}
		}

        protected void Button1_Click(object sender, EventArgs e)
        {
          
        }
    }
}
