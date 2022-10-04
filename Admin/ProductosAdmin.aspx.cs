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
    public partial class ProductosAdmin : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.databasecrud(connectionString, "SELECT * FROM Products", gridproductos);

            }
        }

        public IQueryable GetCategories()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.Categories;
            return query;
        }

        public IQueryable GetProveedores()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.proveedores;
            return query;
        }


        protected void gridproductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO Products (ProductName,Description,ImagePath,UnitPrice,CategoryID,stock) VALUES (@ProductName,@Description,@ImagePath,@UnitPrice,@CategoryID,@stock)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@ProductName", (gridproductos.FooterRow.FindControl("txtProductNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Description", (gridproductos.FooterRow.FindControl("txtDescriptionFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@ImagePath", (gridproductos.FooterRow.FindControl("txtImagePathFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@UnitPrice", (gridproductos.FooterRow.FindControl("txtUnitPriceFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@CategoryID", (gridproductos.FooterRow.FindControl("ddlprodupf") as DropDownList).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@stock", (gridproductos.FooterRow.FindControl("txtstockFooter") as TextBox).Text.Trim());

                        sqlCmd.ExecuteNonQuery();
                        this.databasecrud(connectionString, "SELECT * FROM Products", gridproductos);
                        lblSuccessMessage.Text = "Nuevo Producto Agregado";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gridproductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridproductos.EditIndex = e.NewEditIndex;
            this.databasecrud(connectionString, "SELECT * FROM Products", gridproductos);

        }

        protected void gridproductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridproductos.EditIndex = -1;
            this.databasecrud(connectionString, "SELECT * FROM Products", gridproductos);

        }

        protected void gridproductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE Products SET ProductName=@ProductName,Description=@Description,ImagePath=@ImagePath,UnitPrice=@UnitPrice,CategoryID=@CategoryID WHERE ProductID = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductName", (gridproductos.Rows[e.RowIndex].FindControl("txtProductName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Description", (gridproductos.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ImagePath", (gridproductos.Rows[e.RowIndex].FindControl("txtImagePath") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UnitPrice", (gridproductos.Rows[e.RowIndex].FindControl("txtUnitPrice") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@CategoryID", (gridproductos.Rows[e.RowIndex].FindControl("txtctid") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gridproductos.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gridproductos.EditIndex = -1;
                    this.databasecrud(connectionString, "SELECT * FROM Products", gridproductos);
                    lblSuccessMessage.Text = "Producto actualizado con exito";
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

        protected void gridproductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Products WHERE ProductID = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gridproductos.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    this.databasecrud(connectionString, "SELECT * FROM Products", gridproductos);

                    lblSuccessMessage.Text = "Producto eliminado con exito";
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

        protected void Editbtnprod_Click1(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "UPDATE Products SET ProductName=@ProductName,Description=@Description,ImagePath=@ImagePath,UnitPrice=@UnitPrice,CategoryID=@CategoryID WHERE ProductID = @ProductID";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@ProductName", (gridproductos.Rows[e.RowIndex].FindControl("txtProductName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Description", (gridproductos.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@ImagePath", (gridproductos.Rows[e.RowIndex].FindControl("txtImagePath") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@UnitPrice", (gridproductos.Rows[e.RowIndex].FindControl("txtUnitPrice") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@CategoryID", (gridproductos.Rows[e.RowIndex].FindControl("txtctid") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gridproductos.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                gridproductos.EditIndex = -1;
                this.databasecrud(connectionString, "SELECT * FROM Products", gridproductos);

                lblSuccessMessage.Text = "Producto actualizado con exito";
                lblErrorMessage.Text = "";
            }
        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {

            Boolean fileOK = false;
            String path = Server.MapPath("~/Images/");

            if (imgprodadd.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(imgprodadd.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };

                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
            }

            if (fileOK)
            {
                try
                {
                    imgprodadd.PostedFile.SaveAs(path + "Thumbs/" + imgprodadd.FileName);
                }
                catch (Exception ex)
                {
                    lblconfirmardep.Text = ex.Message;
                }

                // Add product data to DB.
                AddProducts products = new AddProducts();
                bool addSuccess = products.AddProduct(0, AddProductName.Text, AddProductDescription.Text,
                    AddProductPrice.Text, DropDownAddCategory.SelectedValue, imgprodadd.FileName, 0);

                if (addSuccess)
                {
                    // Reload the page.
                    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect(pageUrl + "?ProductAction=add");
                }
                else
                {
                    LabelAddStatus.Text = "No se pudo agregar el producto";
                }
            }
            else
            {
                LabelAddStatus.Text = "No se acepta el formato";
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
                tablag.Rows[0].Cells[0].Text = "No se encontraron categorias..!";
                tablag.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            tablag.UseAccessibleHeader = true;
            tablag.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}