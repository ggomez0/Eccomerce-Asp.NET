using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ShopGaspar.Models
{
    public class Category
    {
        [ScaffoldColumn(false)]
        public int CategoryID { get; set; }

        [Required, StringLength(100), Display(Name = "Nombre")]
        public string CategoryName { get; set; }

        [Display(Name = "Descripcion Producto")]
        public string Description { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}