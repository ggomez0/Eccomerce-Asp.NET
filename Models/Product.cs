using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ShopGaspar.Models
{
    public class Product
    {
        [ScaffoldColumn(false)]
        public int ProductID { get; set; }

        [Required, StringLength(100), Display(Name = "Nombre")]
        public string ProductName { get; set; }

        [StringLength(10000), Display(Name = "Descripcion producto"), DataType(DataType.MultilineText)]
        public string Description { get; set; }

        public string ImagePath { get; set; }

        [Required, Display(Name = "Precio")]
        public double? UnitPrice { get; set; }

        public int? CategoryID { get; set; }

        public int? stock { get; set; }
        public int? vendido { get; set; }        

        public virtual Category Category { get; set; }

        public virtual depositos Depositos { get; set; }

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<prodendep> Prodendeps { get; set; }
        public virtual ICollection<comprobantesdet> Comprobantesdet { get; set; }


    }
}