using System.Data.Entity;
namespace ShopGaspar.Models
{
    public class ProductContext : DbContext
    {
        public ProductContext() : base("ShopGaspar")
        {
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<CartItem> ShoppingCartItems { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }

        public DbSet<Cards> Card { get; set; }

    }
}