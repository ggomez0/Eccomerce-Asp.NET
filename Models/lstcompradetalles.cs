using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class lstcompradetalles
    {
        [ScaffoldColumn(false), Key]
        public int lstcpradetid { get; set; }

        public int cantidad { get; set; }

        public virtual Product Product { get; set; }

        public virtual lstcompra Lstcompra { get; set; }


    }
}