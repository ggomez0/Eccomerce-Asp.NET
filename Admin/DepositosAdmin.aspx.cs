using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using ShopGaspar.Logic;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;

namespace ShopGaspar.Admin
{
    public partial class DepositosAdmin : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.databasecrud(connectionString, "SELECT * FROM depositos", gvdep);
                

            }
        }

        protected void btnagregardep_Click(object sender, EventArgs e)
        {

            Boolean fileOK1 = false;
            String path1 = Server.MapPath("~/Images/");

            if (FileUpload1.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };

                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK1 = true;
                    }
                }
            }

            if (fileOK1)
            {
                try
                {
                    FileUpload1.PostedFile.SaveAs(path1 + "Thumbs/" + FileUpload1.FileName);
                }
                catch (Exception ex)
                {
                    lblconfirmardep.Text = ex.Message;
                }

                // Add product data to DB.
                adddep adddep = new adddep();
                bool addSuccess = adddep.adddeposito(txtnomdep.Text, txtdescdep.Text, FileUpload1.FileName, txtubidep.Text);

                if (addSuccess)
                {
                    // Reload the page.
                    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect(pageUrl + "?ProductAction=adddep");
                }
                else
                {
                    lblconfirmardep.Text = "No se pudo agregar el deposito";
                }
            }
            else
            {
                lblconfirmardep.Text = "No se acepta el formato";
            }

        }

        protected void depdet_Click(object sender, ImageClickEventArgs e)
        {
            int id = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/prodendep.aspx?id=" + id);
        }

        protected void gvdep_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvdep.EditIndex = e.NewEditIndex;
            this.databasecrud(connectionString, "SELECT * FROM depositos", gvdep);
        }

        protected void gvdep_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvdep.EditIndex = -1;
            this.databasecrud(connectionString, "SELECT * FROM depositos", gvdep);
        }

        protected void gvdep_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE depositos SET DepName=@ProductName,Description=@Description,ImagePath=@ImagePath,ubicacion=@ubicacion WHERE DepID = @DepID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductName", (gvdep.Rows[e.RowIndex].FindControl("txtdepnameedit") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Description", (gvdep.Rows[e.RowIndex].FindControl("txtdesceditdep") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ImagePath", (gvdep.Rows[e.RowIndex].FindControl("txtImagePathdep") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ubicacion", (gvdep.Rows[e.RowIndex].FindControl("txtubieditdep") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@DepID", Convert.ToInt32(gvdep.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvdep.EditIndex = -1;
                    this.databasecrud(connectionString, "SELECT * FROM depositos", gvdep);
                    lblSuccessMessage.Text = "Deposito actualizado con exito";
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
                tablag.Rows[0].Cells[0].Text = "No se encontraron categorias..!";
                tablag.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            tablag.UseAccessibleHeader = true;
            tablag.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void gvdep_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM depositos WHERE DepID = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvdep.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    this.databasecrud(connectionString, "SELECT * FROM depositos", gvdep);
                    lblSuccessMessage.Text = "Deposito eliminado con exito";
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

        public IQueryable GetDepositos()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.depositos;
            return query;
        }

        protected void gvdep_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void btnhistorial_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/historial.aspx");
        }
    }
}