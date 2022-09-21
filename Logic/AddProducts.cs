using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopGaspar.Models;

namespace ShopGaspar.Logic
{
    public class AddProducts
    {
        public bool AddProduct(int stock, string ProductName, string ProductDesc, string ProductPrice, string ProductCategory, string ProductImagePath, int vendido, string proveedores)
        {
            var myProduct = new Product();
            myProduct.ProductName = ProductName;
            myProduct.Description = ProductDesc;
            myProduct.UnitPrice = Convert.ToDouble(ProductPrice);
            myProduct.ImagePath = ProductImagePath;
            myProduct.CategoryID = Convert.ToInt32(ProductCategory);
            myProduct.stock = Convert.ToInt32(stock);
            myProduct.vendido = Convert.ToInt32(vendido);
            myProduct.ProvID = Convert.ToInt32(proveedores);


            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.Products.Add(myProduct);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
    }
}