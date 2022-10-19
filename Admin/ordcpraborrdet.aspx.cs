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
    public partial class ordcpraborrdet : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string nID = Request.QueryString["id"];
                lblord.Text += nID;
                this.databasecrud(connectionString, "select idcomprdet as ID, p.ProductName as Producto, cantidad, precio from comprobantesdets cd inner join products p on cd.Product_ProductID=p.ProductID where Comprobantes_idcomp=" + nID , gvordcpraborrdet);
            }
        }


        void databasecrud(string conexion, string sqlcomando, GridView tablag)
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(conexion))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(sqlcomando, sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                tablag.DataSource = dtbl;
                tablag.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                tablag.DataSource = dtbl;
                tablag.DataBind();
                tablag.Rows[0].Cells.Clear();
                tablag.Rows[0].Cells.Add(new TableCell());
                tablag.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                tablag.Rows[0].Cells[0].Text = "No se encontraron registros..!";
                tablag.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            tablag.UseAccessibleHeader = true;
            tablag.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnordcprahecho_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ComprasAdmin.aspx");
        }

        protected void gvordcpraborrdet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection sqlCon1 = new SqlConnection(connectionString))
            {
                sqlCon1.Open();
                string query1 = "UPDATE comprobantesdets SET cantidad = @cantidad, precio=@precio  WHERE idcomprdet=@idcomp ";
                SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon1);
                sqlCmd1.Parameters.AddWithValue("@cantidad", (gvordcpraborrdet.Rows[e.RowIndex].FindControl("txtcant") as TextBox).Text.Trim());
                sqlCmd1.Parameters.AddWithValue("@precio", (gvordcpraborrdet.Rows[e.RowIndex].FindControl("txtimporte") as TextBox).Text.Trim());
                sqlCmd1.Parameters.AddWithValue("@idcomp", Convert.ToInt32(gvordcpraborrdet.DataKeys[e.RowIndex].Value.ToString()));               

                sqlCmd1.ExecuteNonQuery();
                sqlCon1.Close();
            }
        }
    }
}
