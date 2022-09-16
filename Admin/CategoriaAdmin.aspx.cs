using ShopGaspar.Logic;
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
    public partial class CategoriaAdmin : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.databasecrud(connectionString, "SELECT CategoryID, CategoryName from Categories", gvcattab);

            }

        }

        protected void AddCat_Click(object sender, EventArgs e)
        {
            AddCategories categorias = new AddCategories();
            bool addSucces = categorias.AddCategory(AddCategoria.Text);

            if (addSucces)
            {
                // Reload the page.
                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect(pageUrl + "?ProductAction=addcat");
            }
            else
            {
                lbladdcatstatus.Text = "No se pudo agregar la categoria a la base de datos";
            }
        }

        protected void gvcattab_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvcattab.EditIndex = e.NewEditIndex;
            this.databasecrud(connectionString, "SELECT CategoryID, CategoryName from Categories", gvcattab);
        }

        protected void gvcattab_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvcattab.EditIndex = -1;
            this.databasecrud(connectionString, "SELECT CategoryID, CategoryName from Categories", gvcattab);
        }

        protected void gvcattab_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE Categories SET CategoryName=@ProductName WHERE CategoryID = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductName", (gvcattab.Rows[e.RowIndex].FindControl("txtCategoryNameedit") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvcattab.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvcattab.EditIndex = -1;
                    this.databasecrud(connectionString, "SELECT CategoryID, CategoryName from Categories", gvcattab);
                    lblSuccessMessage.Text = "Categoria actualizado con exito";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
            Response.Redirect("~/Admin/CategoriaAdmin.aspx");

        }

        protected void gvcattab_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Categories WHERE CategoryID = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvcattab.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    this.databasecrud(connectionString, "SELECT CategoryID, CategoryName from Categories", gvcattab);
                    lblSuccessMessage.Text = "Categoria eliminado con exito";
                    lblErrorMessage.Text = "";

                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;

            }
            Response.Redirect("~/Admin/CategoriaAdmin.aspx");

        }

        protected void gvcattab_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }

        protected void btndetcat_Click(object sender, ImageClickEventArgs e)
        {
            int id4 = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/detprodcat.aspx?id4=" + id4);
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
                tablag.Rows[0].Cells[0].Text = "No se encontraron categorias..!";
                tablag.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            tablag.UseAccessibleHeader = true;
            tablag.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

    }
}