using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class comprobantesdet
    {
        [ScaffoldColumn(false), Key]
        public int idcomprdet { get; set; }

        public int cantidad { get; set; }
        public int? precio { get; set; }
        public int? factid { get; set; }

        public virtual Product Product { get; set; }

        public virtual comprobantes Comprobantes { get; set; }
    }
}