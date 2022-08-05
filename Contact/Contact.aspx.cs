using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopGaspar
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void Unnamed_Click(object sender, EventArgs e)
        {            
            MailMessage mensaje = new MailMessage();
            mensaje.From = new MailAddress("gaspargomez2000@outlook.com", txtemail.Text);
            mensaje.To.Add("gaspargomez2000@outlook.com");
            mensaje.Subject = txtNombre.Text + " " + txtApe.Text;           
            mensaje.Body = txtmessage.Text;
            mensaje.IsBodyHtml = false;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.office365.com";
            System.Net.NetworkCredential credenciales = new System.Net.NetworkCredential();

            credenciales.UserName = "gaspargomez2000@outlook.com";
            credenciales.Password = "your password";

            smtp.UseDefaultCredentials = true;
            smtp.Credentials = credenciales;
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Send(mensaje);

            lblConfirmacion.Text = "Enviado correctamente";
            txtNombre.Text = "";
            txtApe.Text = "";
            txtemail.Text = "";
            txtmessage.Text = "";
        }
    }
}