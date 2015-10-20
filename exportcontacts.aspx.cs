using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class exportcontacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void Button1_Click(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid1.MasterTableView.ExportToExcel();
        }

        protected void Button2_Click(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid1.MasterTableView.ExportToWord();
        }

        protected void Button3_Click(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid1.MasterTableView.ExportToCSV();
        }


/// <summary>
/// ////////////////////////////////////////////////
/// 
        /// 
        protected void Button1_Click1(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid2.MasterTableView.ExportToExcel();
        }

        protected void Button2_Click1(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid2.MasterTableView.ExportToWord();
        }

        protected void Button3_Click1(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid2.MasterTableView.ExportToCSV();
        }
/// </summary>
/// <param name="sender"></param>
/// <param name="e"></param>



        /// <summary>
        /// ////////////////////////////////////////////////
        /// 
        /// 
        protected void Button1_Click2(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid3.MasterTableView.ExportToExcel();
        }

        protected void Button2_Click2(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid3.MasterTableView.ExportToWord();
        }

        protected void Button3_Click2(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid3.MasterTableView.ExportToCSV();
        }
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>



        /// <summary>
        /// ////////////////////////////////////////////////
        /// 





        /// <summary>
        /// ////////////////////////////////////////////////
        /// 
        /// 
        protected void Button1_Click3(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid4.MasterTableView.ExportToExcel();
        }

        protected void Button2_Click3(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid4.MasterTableView.ExportToWord();
        }

        protected void Button3_Click3(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid4.MasterTableView.ExportToCSV();
        }
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>


        /// <summary>
        /// ////////////////////////////////////////////////
        /// 
        /// 
        protected void Button1_Click4(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid5.MasterTableView.ExportToExcel();
        }

        protected void Button2_Click4(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid5.MasterTableView.ExportToWord();
        }

        protected void Button3_Click4(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid5.MasterTableView.ExportToCSV();
        }
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>


             /// <summary>
        /// ////////////////////////////////////////////////
        /// 

        /// <summary>
        /// ////////////////////////////////////////////////
        /// 
        /// 
        protected void Button1_Click5(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid6.MasterTableView.ExportToExcel();
        }

        protected void Button2_Click5(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid6.MasterTableView.ExportToWord();
        }

        protected void Button3_Click5(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid6.MasterTableView.ExportToCSV();
        }
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>


        /// <summary>
        /// ////////////////////////////////////////////////
        
        /// <summary>
        /// ////////////////////////////////////////////////
        /// 
        /// 
        protected void Button1_Click6(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid6.MasterTableView.ExportToExcel();
        }

        protected void Button2_Click6(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid6.MasterTableView.ExportToWord();
        }

        protected void Button3_Click6(object sender, System.EventArgs e)
        {
            ConfigureExport();
            RadGrid6.MasterTableView.ExportToCSV();
        }
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>


        /// <summary>
        /// ////////////////////////////////////////////////
        
        










        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName ||
                e.CommandName == Telerik.Web.UI.RadGrid.ExportToWordCommandName ||
                e.CommandName == Telerik.Web.UI.RadGrid.ExportToCsvCommandName)
            {
                ConfigureExport();
            }
        }

        public void ConfigureExport()
        {
            RadGrid1.ExportSettings.ExportOnlyData = CheckBox1.Checked;
            RadGrid1.ExportSettings.IgnorePaging = CheckBox2.Checked;
            RadGrid1.ExportSettings.OpenInNewWindow = CheckBox3.Checked;
          
            RadGrid2.ExportSettings.ExportOnlyData = CheckBox4.Checked;
            RadGrid2.ExportSettings.IgnorePaging = CheckBox5.Checked;
            RadGrid2.ExportSettings.OpenInNewWindow = CheckBox6.Checked;
            
            RadGrid3.ExportSettings.ExportOnlyData = CheckBox7.Checked;
            RadGrid3.ExportSettings.IgnorePaging = CheckBox8.Checked;
            RadGrid3.ExportSettings.OpenInNewWindow = CheckBox9.Checked;
            
            RadGrid4.ExportSettings.ExportOnlyData = CheckBox10.Checked;
            RadGrid4.ExportSettings.IgnorePaging = CheckBox11.Checked;
            RadGrid4.ExportSettings.OpenInNewWindow = CheckBox12.Checked;
            
            RadGrid5.ExportSettings.ExportOnlyData = CheckBox13.Checked;
            RadGrid5.ExportSettings.IgnorePaging = CheckBox14.Checked;
            RadGrid5.ExportSettings.OpenInNewWindow = CheckBox15.Checked;
            
            RadGrid6.ExportSettings.ExportOnlyData = CheckBox16.Checked;
            RadGrid6.ExportSettings.IgnorePaging = CheckBox16.Checked;
            RadGrid6.ExportSettings.OpenInNewWindow = CheckBox18.Checked;
            
       
        }
    }
}
