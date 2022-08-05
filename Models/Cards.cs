using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopGaspar.Models
{
    public class Cards
    {
        [Key]
        [ScaffoldColumn(true)]
        public int IDCARD { get; set; }
        public string NameCard { get; set; }

        [CreditCard]
        public string CardNumber { get; set; }
        public string ExpDate { get; set; }

        public int CVV { get; set; }
       
    }
}