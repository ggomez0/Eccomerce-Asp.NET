using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class historial
    {
        [ScaffoldColumn(false), Key]
        public int idhist { get; set; }

        public int? cant { get; set; }

        [StringLength(10000)]
        public string ingegr { get; set; }


        public DateTime dateTime { get; set; }

        public int? ProductID { get; set; }
        public virtual Product Product { get; set; }    

}
}