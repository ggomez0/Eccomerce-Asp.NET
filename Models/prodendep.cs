using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class prodendep
    {
        [ScaffoldColumn(false), Key]
        public int IngID { get; set; }

        [StringLength(10000), Display(Name = "observaciones"), DataType(DataType.MultilineText)]
        public string Observaciones { get; set; }

        public int cantingreso { get; set; }

        public virtual Product Product { get; set; }

        public virtual depositos Depositos { get; set; }
    }
}