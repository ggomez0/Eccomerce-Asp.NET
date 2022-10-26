using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace ShopGaspar.Admin
{
    public partial class Nuevo_Movimiento : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.databasecrud(connectionString, "SELECT ProductID as ID,ProductName as Producto,Description as " +
                   "Descripcion,UnitPrice as Precio,CategoryID,Stock FROM Products", gvproductoslista);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string result = "select max(idcomp) from comprobantes";
                    SqlCommand showresult = new SqlCommand(result, conn);

                    conn.Open();
                    txtidmov.Text = showresult.ExecuteScalar().ToString();
                    conn.Close();
                }
            }
        }

        public IQueryable GetDepositos()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.depositos;
            return query;
        }

        protected void gvproductoslista_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //try
            //{
            //    using (SqlConnection sqlCon = new SqlConnection(connectionString))
            //    {
            //        sqlCon.Open();
            //        string query = "insert into pedrepodets(cantidad,ProvID,Product_ProductID,pedrepo_idcomp) values (@cantped,@provid,@product,@idpedido);";
            //        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            //        sqlCmd.Parameters.AddWithValue("@cantped", (gvproductoslista.Rows[e.RowIndex].FindControl("txtcantpedido") as TextBox).Text.Trim());
            //        sqlCmd.Parameters.AddWithValue("@provid", (gvproductoslista.Rows[e.RowIndex].FindControl("ddlistprovprod") as DropDownList).Text.Trim());
            //        sqlCmd.Parameters.AddWithValue("@idpedido", lblinvisible.Text);
            //        sqlCmd.Parameters.AddWithValue("@product", Convert.ToInt32(gvproductoslista.DataKeys[e.RowIndex].Value.ToString()));

            //        sqlCmd.ExecuteNonQuery();
            //        gvproductoslista.EditIndex = -1;
            //        lblSuccessMessage.Text = "Agregado con exito";
            //        lblErrorMessage.Text = "";
            //    }
            //}
            //catch (Exception ex)
            //{
            //    lblSuccessMessage.Text = "";
            //    lblErrorMessage.Text = ex.Message;
            //}
            //Response.Redirect(Request.RawUrl);

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
                tablag.Rows[0].Cells[0].Text = "No se encontraron registros!";
                tablag.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            tablag.UseAccessibleHeader = true;
            tablag.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}