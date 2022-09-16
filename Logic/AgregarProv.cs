using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class AgregarProv
    {
        public bool AddProv(string provname, string reprname, string telefono, string email, string comentario, string cuit)
        {
            var myProv = new proveedores();
            myProv.ProvName = provname;
            myProv.ReprProv = reprname;
            myProv.telefono = telefono;
            myProv.email = email;
            myProv.comentario = comentario;
            myProv.cuit = cuit;

          


            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.proveedores.Add(myProv);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
    }
}