using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class addlstcpra
    {
        public bool addlstcpraa(string productname, string descripcion, int provid, int importe, int catid, int cantidad)
        {
            var mylstcpra = new lstcompra();
            mylstcpra.Product.ProductName = productname;
            mylstcpra.descripcion = descripcion;
            mylstcpra.Proveedores.ProvID = provid;
            mylstcpra.cantidad = cantidad;
            mylstcpra.importe = importe;
            mylstcpra.Product.CategoryID = catid;


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