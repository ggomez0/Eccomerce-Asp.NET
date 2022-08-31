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
    public partial class AdminPage : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.SearchCustomers("defaultconnection", "select * from aspnetusers", tablausers);
                this.SearchCustomers("ShopGaspar", "SELECT * from Orders", tablatrans);
                this.SearchCustomers("ShopGaspar", "SELECT ProductName, stock, vendido from Products", gvstat);
                this.SearchCustomers("ShopGaspar", "SELECT * from depositos", gvdep);
                this.SearchCustomers("ShopGaspar", "SELECT * from Products", gvprodtab);
                this.SearchCustomers("ShopGaspar", "SELECT * from Categories", gvcattab);




            }

            string productAction = Request.QueryString["ProductAction"];
            if (productAction == "add")
            {
                LabelAddStatus.Text = "Producto agregado!";
            }

            if (productAction == "addcat")
            {
                lbladdcatstatus.Text = "Categoria agregada!";
            }

            if (productAction == "remcat")
            {
                lblsuccat.Text = "Categoria Removida!";
            }

            if (productAction == "adddep")
            {
                lblconfirmardep.Text = "Deposito Agregado!";
            }
            if (productAction == "addprodendep")
            {
                lblprodendep.Text = "Existencia actualizada!";
            }
        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            String path = Server.MapPath("~/Images/");

            if (ProductImage.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(ProductImage.FileName).ToLower();
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
                    ProductImage.PostedFile.SaveAs(path + "Thumbs/" + ProductImage.FileName);
                }
                catch (Exception ex)
                {
                    LabelAddStatus.Text = ex.Message;
                }

                // Add product data to DB.
                AddProducts products = new AddProducts();
                bool addSuccess = products.AddProduct(0, AddProductName.Text, AddProductDescription.Text,
                    AddProductPrice.Text, DropDownAddCategory.SelectedValue, ProductImage.FileName,0);

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

        public IQueryable GetCategories()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.Categories;
            return query;
        }

        public IQueryable GetDepositos()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.depositos;
            return query;
        }

        public IQueryable GetProducts()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.Products;
            return query;
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

        protected void btnremcat_Click(object sender, EventArgs e)
        {
            using (var _db = new ShopGaspar.Models.ProductContext())
            {
                var myItem1 = (from c in _db.Categories where c.CategoryName == txtContactsSearch.Text select c).FirstOrDefault();
                if (myItem1 != null)
                {
                    _db.Categories.Remove(myItem1);
                    _db.SaveChanges();

                    // Reload the page.
                    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect(pageUrl + "?ProductAction=remcat");
                }
                else
                {
                    lblsuccat.Text = "No se localizo la categoria";
                }
            }
        }
       

        private void SearchCustomers(string conexion, string comando, GridView tabla)
        {
            string constr = ConfigurationManager.ConnectionStrings[conexion].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(comando, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        tabla.DataSource = dt;
                        tabla.DataBind();
                    }
                }
            }
            //Required for jQuery DataTables to work.
            tabla.UseAccessibleHeader = true;
            tabla.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        

        //void PopulateGridview()
        //{
        //    DataTable dtbl = new DataTable();
        //    using (SqlConnection sqlCon = new SqlConnection(connectionString))
        //    {
        //        sqlCon.Open();
        //        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Products", sqlCon);
        //        sqlDa.Fill(dtbl);
        //    }
        //    if (dtbl.Rows.Count > 0)
        //    {
        //        gridproductos.DataSource = dtbl;
        //        gridproductos.DataBind();
        //    }
        //    else
        //    {
        //        dtbl.Rows.Add(dtbl.NewRow());
        //        gridproductos.DataSource = dtbl;
        //        gridproductos.DataBind();
        //        gridproductos.Rows[0].Cells.Clear();
        //        gridproductos.Rows[0].Cells.Add(new TableCell());
        //        gridproductos.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
        //        gridproductos.Rows[0].Cells[0].Text = "No se encontraron productos..!";
        //        gridproductos.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        //    }
        //    gridproductos.UseAccessibleHeader = true;
        //    gridproductos.HeaderRow.TableSection = TableRowSection.TableHeader;
        //}

        //protected void gridproductos_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    try
        //    {
        //        if (e.CommandName.Equals("AddNew"))
        //        {
        //            using (SqlConnection sqlCon = new SqlConnection(connectionString))
        //            {
        //                sqlCon.Open();
        //                string query = "INSERT INTO Products (ProductName,Description,ImagePath,UnitPrice,CategoryID,stock) VALUES (@ProductName,@Description,@ImagePath,@UnitPrice,@CategoryID,@stock)";
        //                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
        //                sqlCmd.Parameters.AddWithValue("@ProductName", (gridproductos.FooterRow.FindControl("txtProductNameFooter") as TextBox).Text.Trim());
        //                sqlCmd.Parameters.AddWithValue("@Description", (gridproductos.FooterRow.FindControl("txtDescriptionFooter") as TextBox).Text.Trim());
        //                sqlCmd.Parameters.AddWithValue("@ImagePath", (gridproductos.FooterRow.FindControl("txtImagePathFooter") as TextBox).Text.Trim());
        //                sqlCmd.Parameters.AddWithValue("@UnitPrice", (gridproductos.FooterRow.FindControl("txtUnitPriceFooter") as TextBox).Text.Trim());
        //                sqlCmd.Parameters.AddWithValue("@CategoryID", (gridproductos.FooterRow.FindControl("ddlprodupf") as DropDownList).Text.Trim());
        //                sqlCmd.Parameters.AddWithValue("@stock", (gridproductos.FooterRow.FindControl("txtstockFooter") as TextBox).Text.Trim());

        //                sqlCmd.ExecuteNonQuery();
        //                PopulateGridview();
        //                lblSuccessMessage.Text = "Nuevo Producto Agregado";
        //                lblErrorMessage.Text = "";
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblSuccessMessage.Text = "";
        //        lblErrorMessage.Text = ex.Message;
        //    }
        //}

        //protected void gridproductos_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    gridproductos.EditIndex = e.NewEditIndex;
        //    PopulateGridview();
        //}

        //protected void gridproductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    gridproductos.EditIndex = -1;
        //    PopulateGridview();
        //}

        //protected void gridproductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    try
        //    {
        //        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        //        {
        //            sqlCon.Open();
        //            string query = "UPDATE Products SET ProductName=@ProductName,Description=@Description,ImagePath=@ImagePath,UnitPrice=@UnitPrice,CategoryID=@CategoryID WHERE ProductID = @ProductID";
        //            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
        //            sqlCmd.Parameters.AddWithValue("@ProductName", (gridproductos.Rows[e.RowIndex].FindControl("txtProductName") as TextBox).Text.Trim());
        //            sqlCmd.Parameters.AddWithValue("@Description", (gridproductos.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text.Trim());
        //            sqlCmd.Parameters.AddWithValue("@ImagePath", (gridproductos.Rows[e.RowIndex].FindControl("txtImagePath") as TextBox).Text.Trim());
        //            sqlCmd.Parameters.AddWithValue("@UnitPrice", (gridproductos.Rows[e.RowIndex].FindControl("txtUnitPrice") as TextBox).Text.Trim());
        //            sqlCmd.Parameters.AddWithValue("@CategoryID", (gridproductos.Rows[e.RowIndex].FindControl("txtctid") as TextBox).Text.Trim());
        //            sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gridproductos.DataKeys[e.RowIndex].Value.ToString()));
        //            sqlCmd.ExecuteNonQuery();
        //            gridproductos.EditIndex = -1;
        //            PopulateGridview();
        //            lblSuccessMessage.Text = "Producto actualizado con exito";
        //            lblErrorMessage.Text = "";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblSuccessMessage.Text = "";
        //        lblErrorMessage.Text = ex.Message;
        //    }
        //}

        //protected void gridproductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    try
        //    {
        //        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        //        {
        //            sqlCon.Open();
        //            string query = "DELETE FROM Products WHERE ProductID = @ProductID";
        //            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
        //            sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gridproductos.DataKeys[e.RowIndex].Value.ToString()));
        //            sqlCmd.ExecuteNonQuery();
        //            PopulateGridview();
        //            lblSuccessMessage.Text = "Producto eliminado con exito";
        //            lblErrorMessage.Text = "";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblSuccessMessage.Text = "";
        //        lblErrorMessage.Text = ex.Message;
        //    }
        //}

        protected void imgord_Click(object sender, ImageClickEventArgs e)
        {
            string id1 = (sender as ImageButton).CommandArgument;
            Response.Redirect("~/Admin/gvordenesusuarios.aspx?id1=" + id1);

        }

        protected void imgordenes_Click(object sender, ImageClickEventArgs e)
        {
            int id2 = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/detallesordenes.aspx?id2=" + id2);

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
            int id3 = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/prodendep.aspx?id3=" + id3);
        }   

        protected void btndepexis_Click1(object sender, EventArgs e)
        {
            if (rblistlist.Items[0].Selected)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "IF EXISTS(SELECT* FROM prodendeps WHERE Depositos_DepID = @Depositos and (prodendeps.Product_ProductID in " +
                        "(select ProductID from Products where ProductName = @Productos))) BEGIN UPDATE prodendeps " +
                        "SET cantingreso = cantingreso + @cantingreso, Observaciones = @Observaciones WHERE Depositos_DepID = @Depositos and " +
                        "(prodendeps.Product_ProductID in (select ProductID from Products where ProductName = @Productos)); END ELSE BEGIN insert into " +
                        "prodendeps(Observaciones, cantingreso, Depositos_DepID, Product_ProductID) values(@Observaciones, @cantingreso, @Depositos, " +
                        "(select ProductID from Products where ProductName = @Productos)); END";
                   SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Observaciones", txtobsdep.Text);
                    sqlCmd.Parameters.AddWithValue("@cantingreso", txtcantdep.Text);
                    sqlCmd.Parameters.AddWithValue("@Productos", txtacproddep.Text);
                    sqlCmd.Parameters.AddWithValue("@Depositos", ddlistdep.SelectedIndex+1);
                    sqlCmd.ExecuteNonQuery();
                }
                using (SqlConnection sqlCon1 = new SqlConnection(connectionString))
                {
                    sqlCon1.Open();
                    string query1 = "UPDATE Products SET stock = stock + @stock WHERE ProductID in (select ProductID from Products where ProductName = @Productos) ";
                    SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon1);
                    sqlCmd1.Parameters.AddWithValue("@stock", txtcantdep.Text);
                    sqlCmd1.Parameters.AddWithValue("@Productos", txtacproddep.Text);
                    sqlCmd1.ExecuteNonQuery();
                }

                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect(pageUrl + "?ProductAction=addprodendep");
            }
            if (rblistlist.Items[1].Selected)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "IF EXISTS(SELECT* FROM prodendeps WHERE Depositos_DepID = @Depositos and (prodendeps.Product_ProductID in " +
                        "(select ProductID from Products where ProductName = @Productos))) BEGIN UPDATE prodendeps " +
                        "SET cantingreso = cantingreso + @cantingreso, Observaciones = @Observaciones WHERE Depositos_DepID = @Depositos and " +
                        "(prodendeps.Product_ProductID in (select ProductID from Products where ProductName = @Productos)); END ELSE BEGIN insert into " +
                        "prodendeps(Observaciones, cantingreso, Depositos_DepID, Product_ProductID) values(@Observaciones, @cantingreso, @Depositos, " +
                        "(select ProductID from Products where ProductName = @Productos)); END";

                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Observaciones", txtobsdep.Text);
                    sqlCmd.Parameters.AddWithValue("@cantingreso", - Convert.ToInt32(txtcantdep.Text));
                    sqlCmd.Parameters.AddWithValue("@Productos", txtacproddep.Text);
                    sqlCmd.Parameters.AddWithValue("@Depositos", ddlistdep.SelectedIndex + 1);
                    sqlCmd.ExecuteNonQuery();
                }

                using (SqlConnection sqlCon1 = new SqlConnection(connectionString))
                {
                    sqlCon1.Open();
                    string query1 = "UPDATE Products SET stock = stock - @stock WHERE ProductID in (select ProductID from Products where ProductName = @Productos) ";
                    SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon1);
                    sqlCmd1.Parameters.AddWithValue("@stock", txtcantdep.Text);
                    sqlCmd1.Parameters.AddWithValue("@Productos", txtacproddep.Text);
                    sqlCmd1.ExecuteNonQuery();
                }

                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect(pageUrl + "?ProductAction=addprodendep");
                
            }
        }
    }
}