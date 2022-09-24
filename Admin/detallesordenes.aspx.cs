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
    public partial class detallesordenes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string nID = Request.QueryString["id2"];
                lblord.Text += nID;
                mostrarorder(nID);
            }
        }

        private void mostrarorder(string ido)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopGaspar"].ToString());
            SqlCommand cmd = new SqlCommand();
            DataTable dataTable = new DataTable();
            SqlDataAdapter sqlDA; 
            cnn.Open();
            cmd.CommandText = "select OrderDetailId as 'ID', Username as 'Usuario',ProductName as 'Producto', Quantity as 'Cantidad'," +
                " UnitPrice as 'Precio Unit.', totalprod as 'Total' from OrderDetails od inner join Orders o on od.OrderId=o.OrderId where od.OrderId = @idorder";
            cmd.Parameters.AddWithValue("@idorder", ido);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cnn;
            sqlDA = new SqlDataAdapter(cmd);
            sqlDA.Fill(dataTable);
            gvdetallesordenes.DataSource = dataTable;
            gvdetallesordenes.DataBind();
            cnn.Close();
            gvdetallesordenes.UseAccessibleHeader = true;
            gvdetallesordenes.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void imgordenes_Click(object sender, ImageClickEventArgs e)
        {
            int id = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/detallesordenes.aspx?id=" + id);

        }
    }
}
