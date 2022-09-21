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
    public partial class proddeprov : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string nID = Request.QueryString["id"];
                lblord.Text += nID;
                mostrarorder(nID);
            }
        }

        private void mostrarorder(string ido)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopGaspar"].ToString());
            SqlCommand cmd = new SqlCommand();
            DataTable dataTable = new DataTable();
            SqlDataAdapter sqlDA; cnn.Open();
            cmd.CommandText = "select prod.ProductName as 'Producto' from proveedores p innerjoin Products prod on p.Product_ProductID= where ProvID = 2";
            cmd.Parameters.AddWithValue("@idorder", ido);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cnn;
            sqlDA = new SqlDataAdapter(cmd);
            sqlDA.Fill(dataTable);
            gvprodprov.DataSource = dataTable;
            gvprodprov.DataBind();
            cnn.Close();
            gvprodprov.UseAccessibleHeader = true;
            gvprodprov.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}