using ShopGaspar.Logic;
using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopGaspar.Admin
{
    public partial class lstcompradet : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string nID = Request.QueryString["id"];
                lblinvisible.Text = nID;
                this.databasecrud(connectionString, "SELECT ProductID as ID,ProductName as Producto,Description as " +
                    "Descripcion,UnitPrice as Precio,CategoryID,Stock FROM Products", gvproductoslista);


                this.databasecrud(connectionString, "SELECT IDCOMPRDET as ID, pr.ProductName as Producto, cantidad, ProvName as Proveedor" +
                    " from pedrepodets p inner join products pr on p.Product_ProductID=pr.ProductID" +
                    " inner join proveedores prov on prov.ProvID=p.ProvID where pedrepo_idcomp =" + nID, gvlstcompradet);
             

            }
        }

        
        public IQueryable<pedrepo> GetPedido([QueryString("id")] int? pedidoid)
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable<pedrepo> query = _db.pedrepos;
            if (pedidoid.HasValue && pedidoid > 0)
            {
                query = query.Where(p => p.idcomp == pedidoid);
            }
            else
            {
                query = null;
            }
            return query;
        }

        public IQueryable GetProveedores()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.proveedores;
            return query;
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

        protected void gvproductoslista_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try                    
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "insert into pedrepodets(cantidad,ProvID,Product_ProductID,pedrepo_idcomp) values (@cantped,@provid,@product,@idpedido);";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);   
                    sqlCmd.Parameters.AddWithValue("@cantped", (gvproductoslista.Rows[e.RowIndex].FindControl("txtcantpedido") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@provid", (gvproductoslista.Rows[e.RowIndex].FindControl("ddlistprovprod") as DropDownList).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@idpedido", lblinvisible.Text);
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


        protected void gvlstcompradet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM pedrepodets WHERE idcomprdet = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvlstcompradet.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    this.databasecrud(connectionString, "SELECT * FROM pedrepodets", gvlstcompradet);

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