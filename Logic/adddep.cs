using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class adddep
    {
        public bool adddeposito(string depname, string desc, string fileupload, string depubicacion)
        {
            var depositos = new depositos();
            depositos.DepName = depname;
            depositos.Description = desc;
            depositos.ImagePath = fileupload;
            depositos.ubicacion = depubicacion;


            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.depositos.Add(depositos);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }

    }
}