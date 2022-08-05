using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopGaspar.Models;

namespace ShopGaspar.Checkout
{
    public partial class CheckoutComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ordencompra.Text = Request.QueryString["id"];
            if (!IsPostBack)
            {             
               
                    // Clear shopping cart.
                    using (ShopGaspar.Logic.ShoppingCartActions usersShoppingCart =
                        new ShopGaspar.Logic.ShoppingCartActions())
                    {
                        usersShoppingCart.EmptyCart();
                    }                
                }
        }
        
        protected void Continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}