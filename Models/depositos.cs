using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class depositos
    {
        [ScaffoldColumn(false), Key]
        public int DepID { get; set; }

        [Required, StringLength(100), Display(Name = "Nombre")]
        public string DepName { get; set; }

        [StringLength(10000), Display(Name = "Descripcion deposito"), DataType(DataType.MultilineText)]
        public string Description { get; set; }

        public string ImagePath { get; set; }

        public string ubicacion { get; set; }

        public virtual ICollection<prodendep> Prodendeps { get; set; }
    }
}