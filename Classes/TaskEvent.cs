using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;

namespace UC_LIVE.Classes
{
    [Serializable()]
    [DataContract()]
    public class TaskEvent
    {

        public TaskEvent()
        { }

        public TaskEvent(System.Data.IDataReader dataReader)
            : this()
        {

            this.ID = Convert.ToInt32(dataReader["TaskId"]);

            if (!Convert.IsDBNull(dataReader["TaskTitle"]))
                this.Title = Convert.ToString(dataReader["TaskTitle"]);

            if (!Convert.IsDBNull(dataReader["TaskDescription"]))
                this.Description = Convert.ToString(dataReader["TaskDescription"]);

            if (!Convert.IsDBNull(dataReader["DateDue"]))
                this.DateDue = Convert.ToDateTime(dataReader["DateDue"]).ToString("yyyy-MM-dd");

        }

        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public string Title { get; set; }
        [DataMember]
        public string Description { get; set; }
        [DataMember]
        public string DateDue { get; set; }

    }
}
