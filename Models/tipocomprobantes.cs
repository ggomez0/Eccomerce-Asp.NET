using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class tipocomprobantes
    {
        [ScaffoldColumn(false), Key]
        public int idcomprobante { get; set; }

        [StringLength(10000), Display(Name = "Nombre")]
        public string nombre { get; set; }

        public virtual ICollection<comprobantes> Comprobantes { get; set; }
    }
}