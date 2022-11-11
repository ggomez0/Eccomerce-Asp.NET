using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class proveedores
    {
        [ScaffoldColumn(false), Key]
        public int ProvID { get; set; }

        [Required, StringLength(100), Display(Name = "Nombre")]
        public string ProvName { get; set; }

        [StringLength(10000), Display(Name = "Representante proveedores")]
        public string ReprProv { get; set; }

        public string telefono { get; set; }
        public string email { get; set; }
        public string comentario { get; set; }

       public string cuit { get; set; }

        public virtual ICollection<pedrepodet> Pedrepodets{ get; set; }



    }
}
