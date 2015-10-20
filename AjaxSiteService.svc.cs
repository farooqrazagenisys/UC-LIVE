using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;

namespace UC_LIVE
{

    [ServiceContract(Namespace = "http://UCLive")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class AjaxSiteService
    {

        [OperationContract]
        public UC_LIVE.Classes.TaskEvent[] GetTaskCalendar()
        {
            if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return null;

            System.Web.Security.MembershipUser currentLoggedInUser = System.Web.Security.Membership.GetUser(System.Web.HttpContext.Current.User.Identity.Name);

            List<UC_LIVE.Classes.TaskEvent> events = new List<UC_LIVE.Classes.TaskEvent>();


            using (System.Data.SqlClient.SqlConnection sqlConnection = new System.Data.SqlClient.SqlConnection(Properties.Settings.Default.ConnectionString))
            using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Tasks --WHERE UserID = @UserID", sqlConnection))
            {

                sqlCommand.Connection.Open();

                //sqlCommand.Parameters.AddWithValue("UserID", currentLoggedInUser.ProviderUserKey);

                using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                    while (dataReader.Read())
                        events.Add(new UC_LIVE.Classes.TaskEvent(dataReader));

            }

            return events.ToArray();
        }

    }
}
