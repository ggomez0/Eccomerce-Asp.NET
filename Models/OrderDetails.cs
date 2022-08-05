using System.ComponentModel.DataAnnotations;

namespace ShopGaspar.Models
{
    public class OrderDetail
    {
        [ScaffoldColumn (true)]
        public int OrderDetailId { get; set; }

        public int OrderId { get; set; }

        public int ProductId { get; set; }
        public string ProductName{ get; set; }        

        public int Quantity { get; set; }

        public double UnitPrice { get; set; }
        public double totalprod { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }
    }
}