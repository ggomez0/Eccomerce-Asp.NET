using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class pedrepo
    {
        [ScaffoldColumn(false), Key]
        public int idcomp { get; set; }

        [StringLength(10000), Display(Name = "Nombre")]
        public string Nombre { get; set; }

        public string stringn { get; set; }
        
        [StringLength(10000), Display(Name = "Descripcion")]
        public string descripcion { get; set; }

        public int? importe { get; set; }

        public string fechacomprobante { get; set; }
        public DateTime dateTime { get; set; }


        public int? idcomprobante { get; set;}

        public virtual ICollection<pedrepodet> Pedrepodets { get; set; }
    }
}