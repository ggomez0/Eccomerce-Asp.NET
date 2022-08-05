using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class AddCategories
    {
        public bool AddCategory(string CategoryName)
        {
            var myCategory = new Category();
            myCategory.CategoryName = CategoryName;
           

            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.Categories.Add(myCategory);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
    }
}