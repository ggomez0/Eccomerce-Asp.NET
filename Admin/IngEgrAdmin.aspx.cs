using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using ShopGaspar.Logic;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;

namespace ShopGaspar.Admin
{
    public partial class IngEgrAdmin : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btndepexis_Click1(object sender, EventArgs e)
        {
            if (rblistlist.Items[0].Selected)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "IF EXISTS(SELECT* FROM prodendeps WHERE Depositos_DepID = @Depositos and (prodendeps.Product_ProductID in " +
                        "(select ProductID from Products where ProductName = @Productos))) BEGIN UPDATE prodendeps " +
                        "SET cantingreso = cantingreso + @cantingreso, Observaciones = @Observaciones WHERE Depositos_DepID = @Depositos and " +
                        "(prodendeps.Product_ProductID in (select ProductID from Products where ProductName = @Productos)); END ELSE BEGIN insert into " +
                        "prodendeps(Observaciones, cantingreso, Depositos_DepID, Product_ProductID) values(@Observaciones, @cantingreso, @Depositos, " +
                        "(select ProductID from Products where ProductName = @Productos)); END";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Observaciones", txtobsdep.Text);
                    sqlCmd.Parameters.AddWithValue("@cantingreso", txtcantdep.Text);
                    sqlCmd.Parameters.AddWithValue("@Productos", txtacproddep.Text);
                    sqlCmd.Parameters.AddWithValue("@Depositos", ddlistdep.SelectedIndex + 1);
                    sqlCmd.ExecuteNonQuery();
                }
                using (SqlConnection sqlCon1 = new SqlConnection(connectionString))
                {
                    sqlCon1.Open();
                    string query1 = "UPDATE Products SET stock = stock + @stock WHERE ProductID in (select ProductID from Products where ProductName = @Productos) ";
                    SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon1);
                    sqlCmd1.Parameters.AddWithValue("@stock", txtcantdep.Text);
                    sqlCmd1.Parameters.AddWithValue("@Productos", txtacproddep.Text);
                    sqlCmd1.ExecuteNonQuery();
                }

                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect(pageUrl + "?ProductAction=addprodendep");
            }
            if (rblistlist.Items[1].Selected)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "IF EXISTS(SELECT* FROM prodendeps WHERE Depositos_DepID = @Depositos and (prodendeps.Product_ProductID in " +
                        "(select ProductID from Products where ProductName = @Productos))) BEGIN UPDATE prodendeps " +
                        "SET cantingreso = cantingreso + @cantingreso, Observaciones = @Observaciones WHERE Depositos_DepID = @Depositos and " +
                        "(prodendeps.Product_ProductID in (select ProductID from Products where ProductName = @Productos)); END ELSE BEGIN insert into " +
                        "prodendeps(Observaciones, cantingreso, Depositos_DepID, Product_ProductID) values(@Observaciones, @cantingreso, @Depositos, " +
                        "(select ProductID from Products where ProductName = @Productos)); END";

                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Observaciones", txtobsdep.Text);
                    sqlCmd.Parameters.AddWithValue("@cantingreso", -Convert.ToInt32(txtcantdep.Text));
                    sqlCmd.Parameters.AddWithValue("@Productos", txtacproddep.Text);
                    sqlCmd.Parameters.AddWithValue("@Depositos", ddlistdep.SelectedIndex + 1);
                    sqlCmd.ExecuteNonQuery();
                }

                using (SqlConnection sqlCon1 = new SqlConnection(connectionString))
                {
                    sqlCon1.Open();
                    string query1 = "UPDATE Products SET stock = stock - @stock WHERE ProductID in (select ProductID from Products where ProductName = @Productos) ";
                    SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon1);
                    sqlCmd1.Parameters.AddWithValue("@stock", txtcantdep.Text);
                    sqlCmd1.Parameters.AddWithValue("@Productos", txtacproddep.Text);
                    sqlCmd1.ExecuteNonQuery();
                }

                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect(pageUrl + "?ProductAction=addprodendep");

            }
        }
    }
}