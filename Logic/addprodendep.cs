using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class addprodendep
    {
        public bool addprodendepo(string prodname, string observaciones, int cantingreso, int depid)
        {
            var prodendep = new prodendep();
            prodendep.Product.ProductID = 1;
            prodendep.Observaciones = observaciones;
            prodendep.cantingreso = Convert.ToInt32(cantingreso);
            prodendep.Depositos.DepID = depid;

            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.prodendeps.Add(prodendep);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
    }
}