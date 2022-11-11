using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopGaspar.Admin
{
    public partial class detprodcat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string nID = Request.QueryString["id4"];
                lblcatprod.Text += nID;
                mostrarorder(nID);
            }
        }

        private void mostrarorder(string ido)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopGaspar"].ToString());
            SqlCommand cmd = new SqlCommand();
            DataTable dataTable = new DataTable();
            SqlDataAdapter sqlDA; cnn.Open();
            cmd.CommandText = "select ProductID as #,ProductName as Producto, Description as Descripcion, Unitprice as Precio from Products where CategoryID = @catid";
            cmd.Parameters.AddWithValue("@catid", ido);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cnn;
            sqlDA = new SqlDataAdapter(cmd);
            sqlDA.Fill(dataTable);
            gvdetprodcat.DataSource = dataTable;
            gvdetprodcat.DataBind();
            cnn.Close();
            gvdetprodcat.UseAccessibleHeader = true;
            gvdetprodcat.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}
        