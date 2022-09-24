using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class addcomprobante
    {
        public bool addcomprobantes(string nombre, string descripcion, string importe, string idc, string prov)
        {
            var mylstcpra = new comprobantes();
            mylstcpra.Nombre = nombre;
            mylstcpra.descripcion = descripcion;
            mylstcpra.importe = Convert.ToInt32(importe);
            mylstcpra.dateTime = DateTime.Now;
            mylstcpra.ProvID = Convert.ToInt32(prov);
            mylstcpra.idcomprobante = Convert.ToInt32(idc);

            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.comprobantes.Add(mylstcpra);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
    }
}