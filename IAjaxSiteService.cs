using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace UC_LIVE
{
    // NOTE: If you change the interface name "IAjaxSiteService" here, you must also update the reference to "IAjaxSiteService" in Web.config.
    [ServiceContract]
    public interface IAjaxSiteService
    {
        [OperationContract]
        void DoWork();
    }
}
