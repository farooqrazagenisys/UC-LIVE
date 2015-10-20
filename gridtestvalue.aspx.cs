using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class gridtestvalue : System.Web.UI.Page
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
        }
    }
}
