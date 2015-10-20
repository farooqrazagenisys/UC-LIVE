using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            multiTabs.ActiveViewIndex = Int32.Parse(e.Item.Value);
          
        }

        protected void showContents(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }

        protected void hideContents(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {

            multiTabs.ActiveViewIndex = 2;
           
      

        }

      
        
    }

}
