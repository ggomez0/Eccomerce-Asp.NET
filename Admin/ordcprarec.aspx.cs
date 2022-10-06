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
    public partial class ordcprarec : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.databasecrud(connectionString, "select * from comprobantes where idcomprobante=2 and descripcion='Recibido'",gvordcprarec);
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

     

        protected void btnvermasordcpraenv_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as Button).CommandArgument);
            Response.Redirect("~/Admin/ordcpraborrdet.aspx?id=" + id);
        }

        protected void gvordcprarec_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "insert into comprobantesdets(cantidad,Comprobantes_idcomp,Product_ProductID)" +
                    "(select cantidad, @comprobID, Product_ProductID from pedrepodets where " +
                    "ProvID = @provid and pedrepo_idcomp = @idcomp)";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@idpedidos", Convert.ToInt32(gvordcprarec.DataKeys[e.RowIndex].Value.ToString()));



                sqlCmd.ExecuteNonQuery();
                gvordcprarec.EditIndex = -1;
            }
        }
    }
}