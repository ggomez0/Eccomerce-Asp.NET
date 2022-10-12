using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopGaspar.Logic;
using ShopGaspar.Models;

namespace ShopGaspar.Checkout
{

    public partial class PagoCard : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            lblTotalca.Text = Request.QueryString["total"];
            using (ShopGaspar.Logic.ShoppingCartActions usersShoppingCart = new ShopGaspar.Logic.ShoppingCartActions())
            {
                List<CartItem> myOrderList = usersShoppingCart.GetCartItems();

                // Add OrderDetail information to the DB for each product purchased.

                OrderItemList.DataSource = myOrderList;
                OrderItemList.DataBind();
            }
        }

        protected void cardbtn_Click(object sender, EventArgs e)
        {
            AddCards cards = new AddCards();
            AddOrder order = new AddOrder();
            bool addSuccess1 = order.AddOrders(DateTime.Now, firstName.Text, lastName.Text, address.Text, phone.Text, email.Text, User.Identity.Name);
            bool addSuccess = cards.AddCard(ccnumber.Text, Convert.ToInt32(cccvv.Text), ccexpiration.Text, ccname.Text);
            int max = _db.Orders.Max(p => p.OrderId);
            //this.sendemail(email.Text);
            //this.sendemail1();

            using (ShopGaspar.Logic.ShoppingCartActions usersShoppingCart = new ShopGaspar.Logic.ShoppingCartActions())
            {
                List<CartItem> myOrderList = usersShoppingCart.GetCartItems();

                // Add OrderDetail information to the DB for each product purchased.
                for (int i = 0; i < myOrderList.Count; i++)
                {
                    AddOrderDetails orderDetails = new AddOrderDetails();
                    orderDetails.AddOrdersDetails(max, myOrderList[i].ProductId, myOrderList[i].Product.ProductName, myOrderList[i].Quantity, Convert.ToDouble(myOrderList[i].Product.UnitPrice));
                    updateprod(myOrderList[i].Quantity, myOrderList[i].ProductId);


                }
                    Response.Redirect("~/Checkout/CheckoutComplete.aspx?id=" + max);
                
            }
            if (addSuccess & addSuccess1)
            {

                // Reload the page.
                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                


            }
            else
            {
                lblcard.Text = "El pago ha sido cancelado!";
            }
        }


        //private void sendemail(string txt1)
        //{
        //    int max = _db.Orders.Max(p => p.OrderId);
        //    MailMessage mensaje = new MailMessage();
        //    mensaje.From = new MailAddress("gaspargomez2000@outlook.com", "EL PUENTE");
        //    mensaje.To.Add(txt1);
        //    mensaje.Subject = string.Format("Gracias por la compra - Orden #{0}", max);

        //    mensaje.IsBodyHtml = false;
        //    mensaje.Body = ("Hola, has realizado la compra en EL PUENTE con exito. Ingresando a este link https://localhost:44351/Account/ordersusers con tu cuenta veras todas tus ordenes realizadas y sus detalles..");

        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.office365.com";
        //    System.Net.NetworkCredential credenciales = new System.Net.NetworkCredential();

        //    credenciales.UserName = "gaspargomez2000@outlook.com";
        //    credenciales.Password = "your password";

        //    smtp.UseDefaultCredentials = true;
        //    smtp.Credentials = credenciales;
        //    smtp.Port = 587;
        //    smtp.EnableSsl = true;
        //    smtp.Send(mensaje);
        //}

        //private void sendemail1()
        //{
        //    int max = _db.Orders.Max(p => p.OrderId);
        //    MailMessage mensaje = new MailMessage();
        //    mensaje.From = new MailAddress("gaspargomez2000@outlook.com", "EL PUENTE");
        //    mensaje.To.Add("gaspargomez2000@outlook.com");
        //    mensaje.Subject = string.Format("Venta Realizada - Orden #{0}", max);

        //    mensaje.IsBodyHtml = false;
        //    mensaje.Body = ("Hola, has realizado una venta en EL PUENTE con exito. Ingresar a tu cuenta para poder visualizar los detalles de la orden");

        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.office365.com";
        //    System.Net.NetworkCredential credenciales = new System.Net.NetworkCredential();

        //    credenciales.UserName = "gaspargomez2000@outlook.com";
        //    credenciales.Password = "your password";

        //    smtp.UseDefaultCredentials = true;
        //    smtp.Credentials = credenciales;
        //    smtp.Port = 587;
        //    smtp.EnableSsl = true;
        //    smtp.Send(mensaje);
        //}

        private void updateprod(int qty, int id)
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "UPDATE Products SET stock = stock - @txtqty, vendido = vendido + @txtqty  WHERE [ProductID] = @id";
                cmd.Parameters.AddWithValue("@txtQty", qty);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Connection = sqlCon;
                sqlCon.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}


