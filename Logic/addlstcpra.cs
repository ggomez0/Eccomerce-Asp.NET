using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class addlstcpra
    {
        public bool addlstcpraa(string descripcion)
        {
            var mylstcpra = new lstcompra();
            mylstcpra.descripcion = descripcion;
            mylstcpra.dateTime = DateTime.Now;


            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.lstcompras.Add(mylstcpra);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
    }
}