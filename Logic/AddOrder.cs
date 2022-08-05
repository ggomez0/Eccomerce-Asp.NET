using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopGaspar.Models;

namespace ShopGaspar.Logic
{
    public class AddOrder
    {

        public bool AddOrders(DateTime orderdate,string nombre, string apellido, string direccion, string telefono, string email, string usernombre)
        {
            var myOrder = new Order();
            myOrder.OrderDate = orderdate;
            myOrder.Username = usernombre;
            myOrder.FirstName = nombre;
            myOrder.LastName = apellido;
            myOrder.Address = direccion;
            myOrder.City = "San Lorenzo";
            myOrder.State = "Salta";
            myOrder.PostalCode = "4401";
            myOrder.Country = "Argentina";
            myOrder.Phone = telefono;
            myOrder.Email = email;
            

            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.Orders.Add(myOrder);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }

    }
}