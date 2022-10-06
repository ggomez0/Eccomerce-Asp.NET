using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class addrepoes
    {
        public bool addrepooes(string nombre, string descripcion, int importe, string noom, string calendar)
        {
            var mylstcpra = new pedrepo();
                mylstcpra.Nombre = nombre;
                mylstcpra.descripcion = descripcion;
                mylstcpra.importe =importe;
                mylstcpra.dateTime = DateTime.Now;
                mylstcpra.stringn = noom;
                mylstcpra.fechacomprobante = calendar;

            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.pedrepos.Add(mylstcpra);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
    }
}