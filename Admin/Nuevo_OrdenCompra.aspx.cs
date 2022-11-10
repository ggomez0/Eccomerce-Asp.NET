using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace ShopGaspar.Admin
{
    public partial class Nuevo_OrdenCompra : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.databasecrud(connectionString, "SELECT ProductID as ID,ProductName as Producto,Description as " +
                  "Descripcion, CategoryID,Stock FROM Products", gvproductoslista);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string result = "select max(idcomp) from comprobantes";
                    SqlCommand showresult = new SqlCommand(result, conn);
                    conn.Open();
                    string nummov = showresult.ExecuteScalar().ToString();
                    txtordid.Text = nummov;
                    conn.Close();
                }

                this.databasecrud(connectionString, "SELECT cd.idcomprdet,p.ProductName,cd.cantidad,cd.precio,(precio*cantidad) as Total from comprobantesdets cd inner join products p on p.ProductID=cd.Product_ProductID " +
                       " where Comprobantes_idcomp=" + Convert.ToInt32(txtordid.Text), gvprodfact);
            }



        }

        protected void btnguardarfact_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "declare @importee int = (select sum(cantidad*precio) from comprobantesdets where Comprobantes_idcomp=@idped); update comprobantes set ProvID=@ProvID, importe=@importee, fechacomprobante=@fechaa where idcomp=@idped;";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@ProvID", ddlistprov.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@idped", Convert.ToInt32(txtordid.Text));
                sqlCmd.Parameters.AddWithValue("@fechaa", txtcalendar.Text);

                sqlCmd.ExecuteNonQuery();
            }
            Response.Redirect("~/Admin/ComprasAdmin.aspx");
        }

        public IQueryable GetProveedores()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.proveedores;
            return query;
        }

        protected void gvprodfact_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "delete from comprobantesdets where idcomprdet=@id);";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvprodfact.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvproductoslista.EditIndex = -1;
                    lblSuccessMessage.Text = "Agregado con exito";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
            Response.Redirect(Request.RawUrl);

        }

        protected void gvproductoslista_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "insert into comprobantesdets(cantidad,Product_ProductID,Comprobantes_idcomp,precio) values (@cantped,@product,@idpedido,@precio);";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@cantped", Convert.ToInt32((gvproductoslista.Rows[e.RowIndex].FindControl("txtcantfact") as TextBox).Text.Trim()));
                    sqlCmd.Parameters.AddWithValue("@precio", Convert.ToInt32((gvproductoslista.Rows[e.RowIndex].FindControl("txtpricefact") as TextBox).Text.Trim()));
                    sqlCmd.Parameters.AddWithValue("@idpedido", Convert.ToInt32((txtordid.Text).ToString()));
                    sqlCmd.Parameters.AddWithValue("@product", Convert.ToInt32(gvproductoslista.DataKeys[e.RowIndex].Value.ToString()));

                    sqlCmd.ExecuteNonQuery();
                    gvproductoslista.EditIndex = -1;
                    lblSuccessMessage.Text = "Agregado con exito";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
            Response.Redirect(Request.RawUrl);

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
