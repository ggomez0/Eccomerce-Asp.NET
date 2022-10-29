using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace ShopGaspar.Admin
{
    public partial class Nuevo_pago : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.databasecrud(connectionString, "SELECT idcomp as ID, descripcion as #Factura, stringn as Sucursal, p.ProvName, nombre as Tipo, fechacomprobante as Fecha, importe" +
                    " FROM comprobantes c inner join proveedores p on p.ProvID=c.ProvID where idcomprobante=3", gvfacturas);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string result = "select max(idcomp) from comprobantes";
                    SqlCommand showresult = new SqlCommand(result, conn);
                    conn.Open();
                    string nummov = showresult.ExecuteScalar().ToString();
                    txtidpago.Text = nummov;
                    conn.Close();
                }

                this.databasecrud(connectionString, "select idcomp as ID,  stringn as NFactura, descripcion as Sucursal, Nombre as Tipo, importe, p.ProvName as Proveedor, fechacomprobante as Fecha  from comprobantesdets cd" +
                    " inner join comprobantes c on cd.factid=c.idcomp inner join proveedores p on c.ProvID=p.ProvID where Comprobantes_idcomp=" + Convert.ToInt32((txtidpago.Text).ToString()), gvfactpago);
            }

        }

        public IQueryable GetProveedores()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.proveedores;
            return query;
        }



        protected void btnguardarpago_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                   
                    string query = "declare @importee int = (select sum(cc.importe) from comprobantes c " +
                        "inner join comprobantesdets cd on cd.Comprobantes_idcomp=c.idcomp inner join comprobantes cc" +
                        " on cc.idcomp=cd.factid where c.idcomp = @idped);" +
                        " update comprobantes set stringn='Pagado', descripcion=@forma, importe=@importee, " +
                        "fechacomprobante=@fechacomprobante, ProvID=@ProvID, idcomprobante=4 where idcomp=@idped;";

                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@forma", ddlisttrans.SelectedValue);
                    sqlCmd.Parameters.AddWithValue("@fechacomprobante", txtcalendarpago.Text);
                    sqlCmd.Parameters.AddWithValue("@ProvID", Convert.ToInt32(ddlistpr.SelectedValue));
                    sqlCmd.Parameters.AddWithValue("@idped", Convert.ToInt32(txtidpago.Text));

                    sqlCmd.ExecuteNonQuery();
                    lblSuccessMessage.Text = "Agregado con exito";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
            Response.Redirect("~/Admin/ComprasAdmin.aspx");

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

        protected void gvfactpago_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "delete from comprobantesdets where idcomprdet=@id);";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvfactpago.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
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

        protected void gvfacturas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "insert into comprobantesdets(Product_ProductID,Comprobantes_idcomp,factid,cantidad) values (1,@idped,@factid,0);";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@idped", Convert.ToInt32((txtidpago.Text).ToString()));
                    sqlCmd.Parameters.AddWithValue("@factid", Convert.ToInt32(gvfacturas.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
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
    }
}