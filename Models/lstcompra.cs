using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class lstcompra
    {
        [ScaffoldColumn(false), Key]
        public int lstcpraid { get; set; }

        [StringLength(10000), Display(Name = "Descripcion")]
        public string descripcion { get; set; }

        public int? importe { get; set; }

       public DateTime dateTime { get; set; }


        public virtual proveedores Proveedores { get; set; }

        public virtual ICollection<lstcompradetalles> Lstcompradetalles { get; set; }

    }
}