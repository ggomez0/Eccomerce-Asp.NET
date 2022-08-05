using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.ComponentModel;

namespace ShopGaspar.Models
{
    public class Order
    {
        [ScaffoldColumn (true)]
        public int OrderId { get; set; }

        public System.DateTime? OrderDate { get; set; }

        public string Username { get; set; }

        [Required(ErrorMessage = "Nombre requerido")]
        [DisplayName("Nombre")]
        [StringLength(160)]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Apellido requerido")]
        [DisplayName("Apellido")]
        [StringLength(160)]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Direccion requerida")]
        [StringLength(70)]
        public string Address { get; set; }

        [Required(ErrorMessage = "Ciudad requerida")]
        [StringLength(40)]
        public string City { get; set; }

        [Required(ErrorMessage = "Provincia requerida")]
        [StringLength(40)]
        public string State { get; set; }

        [Required(ErrorMessage = "Codigo Postal requerido")]
        [DisplayName("Postal Code")]
        [StringLength(10)]
        public string PostalCode { get; set; }

        [Required(ErrorMessage = "Pais requerido")]
        [StringLength(40)]
        public string Country { get; set; }

        [StringLength(24)]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Email requerido")]
        [DisplayName("Email Address")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}",
            ErrorMessage = "Email is is not valid.")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [ScaffoldColumn(false)]
        public decimal Total { get; set; }

        //[ScaffoldColumn(true)]
        //public string PaymentTransactionId { get; set; }

        //[ScaffoldColumn(false)]
        //public bool HasBeenShipped { get; set; }

        //public List<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}