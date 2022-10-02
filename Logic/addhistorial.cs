using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class addhistorial
    {
        public bool addhistorials(string ingegr, int importe, string prod, string dep)
        {
            var mylstcpra = new historial();
            mylstcpra.ingegr = ingegr;
            mylstcpra.cant = importe;
            mylstcpra.dateTime = DateTime.Now;
            mylstcpra.ProductName = prod;
            mylstcpra.DepID = Convert.ToInt32(dep);

            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.historials.Add(mylstcpra);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
    }
}