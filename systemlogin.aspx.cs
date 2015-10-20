using System;
using System.Collections.Generic;
using AjaxControlToolkit;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class systemlogin : System.Web.UI.Page
    {
      
            
		protected void Page_Load(object sender, EventArgs e)
		{


            if (Page.User.Identity.IsAuthenticated)
            {



                if (this.Page.User.IsInRole("Administrator") || this.Page.User.IsInRole("Staff") || this.Page.User.IsInRole("Claims Manager"))
                {

                    Response.Redirect("~/home1.aspx");
                }



                else if (this.Page.User.IsInRole("Branch") || this.Page.User.IsInRole("Agent"))
                {


               
                    Response.Redirect("~/UserClaimLists.aspx");

                }
                else if (this.Page.User.IsInRole("Guest"))
                {



                    Response.Redirect("~/userclaimlist1.aspx");

                }

                else {

                    Response.Redirect("~/UserClaimLists.aspx");
                
                }

            }
        }
       
       }
    }

