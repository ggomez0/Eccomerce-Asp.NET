using System;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Linq;
using ShopGaspar.Logic;

namespace ShopGaspar.Admin
{
    public partial class PagoComprobantes : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.databasecrud(connectionString, "SELECT * FROM comprobantes where idcomprobante=3", gvpagofact);
            this.databasecrud(connectionString, "SELECT * FROM comprobantes c inner join proveedores p on p.ProvID=c.ProvID where idcomprobante=4", gvfactpag);


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

        public IQueryable GetProveedores()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.proveedores;
            return query;
        }

        protected void btnagregarfact_Click(object sender, EventArgs e)
        {
            addcomprobante addpagofact = new addcomprobante();
            bool addSuccess = addpagofact.addcomprobantes(null,ddlisttrans.SelectedValue,0,4, ddlistpr.SelectedValue, "Pagado",txtcalendarpago.Text);


            if (addSuccess)
            {
                foreach (GridViewRow row in gvpagofact.Rows)
                {

                    try
                    {
                        if (((CheckBox)row.FindControl("cboxpagado")).Checked)
                        {

                            using (SqlConnection sqlCon = new SqlConnection(connectionString))
                            {
                                sqlCon.Open();
                                string query = "declare @lstcompra int = (select max(idcomp) from comprobantes); insert into comprobantesdets(cantidad,Product_ProductID,Comprobantes_idcomp,factid) values (0,1,@lstcompra,14);";
                                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                                lblSuccessMessage.Text = "Agregado con exito";
                                sqlCmd.ExecuteNonQuery();
                            }
                        }

                        using (SqlConnection sqlCon = new SqlConnection(connectionString))
                        {
                            sqlCon.Open();
                            string query = "declare @lstcompra int = (select max(idcomp) from comprobantes); " +
                                "declare @importee int = (select sum(precio) from comprobantesdets where Comprobantes_idcomp=@lstcompra); " +
                                "update comprobantes set importe=@importee where idcomp=@lstcompra;";
                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                            sqlCmd.ExecuteNonQuery();
                            gvpagofact.EditIndex = -1;

                            lblErrorMessage.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblSuccessMessage.Text = "";
                        lblErrorMessage.Text = ex.Message;
                    }
                }


            }
            else
            {
                lblErrorMessage.Text = "No se pudo agregar la factura ";
            }
        }

     

        

        protected void btnverfactpago_Click2(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            int id = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/pagodetalles.aspx?id=" + id);
        }
    }
    }
