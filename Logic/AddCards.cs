using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGaspar.Logic
{
    public class AddCards
    {

        public bool AddCard(string Cardsnumber, int cvv, string expdate, string nombrecard)
        {
            var myCard = new Cards();
            myCard.CardNumber = Cardsnumber;
            myCard.CVV = cvv;
            myCard.ExpDate = expdate;
            myCard.NameCard = nombrecard;

            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.Card.Add(myCard);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }

    }
}