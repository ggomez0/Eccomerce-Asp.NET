using ShopGaspar.Models;
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
    public partial class factdet : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string nID = Request.QueryString["id1"];
                string nID1 = Request.QueryString["id2"];
                lblord.Text += nID;
                this.databasecrud(connectionString, "SELECT ProductName,cantidad, UnitPrice, c.CategoryName, l.idcomprdet, (cantidad*UnitPrice) as Total" +
                    " FROM comprobantesdets l inner join Products p on l.Product_ProductID=p.ProductID inner join Categories c " +
                    "on c.CategoryID=p.CategoryID where Comprobantes_idcomp =" + nID, gvlstcompradet);

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
                tablag.Rows[0].Cells[0].Text = "No se encontraron registros!";
                tablag.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            tablag.UseAccessibleHeader = true;
            tablag.HeaderRow.TableSection = TableRowSection.TableHeader;
            
        }

        protected void gvproductoslista_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        }   
          

        protected void gvlstcompradet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM comprobantesdets WHERE idcomprdet = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvlstcompradet.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    this.databasecrud(connectionString, "SELECT * FROM comprobantesdets", gvlstcompradet);

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