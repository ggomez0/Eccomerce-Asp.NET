using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class addcomprobante
    {
        public bool addcomprobantes(string nombre, string descripcion, int importe, int idc, string prov, string noom, string calendar)
        {
            var mylstcpra = new comprobantes();
            mylstcpra.Nombre = nombre;
            mylstcpra.descripcion = descripcion;
            mylstcpra.importe =importe;
            mylstcpra.dateTime = DateTime.Now;
            mylstcpra.ProvID = Convert.ToInt32(prov);
            mylstcpra.idcomprobante = idc;
            mylstcpra.stringn = noom;
            mylstcpra.fechacomprobante = calendar;

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