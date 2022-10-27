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
                    string nummov = showresult.ExecuteScalar().ToString();
                    txtidmov.Text = nummov;
                    conn.Close();
                }

                this.databasecrud(connectionString, "SELECT * from comprobantesdets where Comprobantes_idcomp=" + Convert.ToInt32(txtidmov.Text), gvprodmov);

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
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "insert into comprobantesdets(cantidad,Product_ProductID,Comprobantes_idcomp) values (@cantped,@product,@idpedido);";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@cantped", Convert.ToInt32((gvproductoslista.Rows[e.RowIndex].FindControl("txtcantpedido") as TextBox).Text.Trim()));
                    sqlCmd.Parameters.AddWithValue("@idpedido", Convert.ToInt32((txtidmov.Text).ToString()));
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







//protected void btndepexis_Click1(object sender, EventArgs e)
//{
//    if (rblistlist.Items[0].Selected)
//    {


//            using (SqlConnection sqlCon = new SqlConnection(connectionString))
//            {
//                sqlCon.Open();
//                string query = "IF EXISTS(SELECT* FROM prodendeps WHERE Depositos_DepID = @Depositos and (prodendeps.Product_ProductID in " +
//                    "(select ProductID from Products where ProductName = @Productos))) BEGIN UPDATE prodendeps " +
//                    "SET cantingreso = cantingreso + @cantingreso, Observaciones = @Observaciones WHERE Depositos_DepID = @Depositos and " +
//                    "(prodendeps.Product_ProductID in (select ProductID from Products where ProductName = @Productos)); END ELSE BEGIN insert into " +
//                    "prodendeps(Observaciones, cantingreso, Depositos_DepID, Product_ProductID) values(@Observaciones, @cantingreso, @Depositos, " +
//                    "(select ProductID from Products where ProductName = @Productos)); END";
//                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
//                sqlCmd.Parameters.AddWithValue("@Observaciones", txtobsdep.Text);
//                sqlCmd.Parameters.AddWithValue("@cantingreso", txtcantdep.Text);
//                sqlCmd.Parameters.AddWithValue("@Productos", txtacproddep.Text);
//                sqlCmd.Parameters.AddWithValue("@Depositos", ddlistdep.SelectedValue);
//                sqlCmd.ExecuteNonQuery();
//                sqlCon.Close();
//            }
//            using (SqlConnection sqlCon1 = new SqlConnection(connectionString))
//            {
//                sqlCon1.Open();
//                string query1 = "UPDATE Products SET stock = stock + @stock WHERE ProductID in (select ProductID from Products where ProductName = @Productos) ";
//                SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon1);
//                sqlCmd1.Parameters.AddWithValue("@stock", txtcantdep.Text);
//                sqlCmd1.Parameters.AddWithValue("@Productos", txtacproddep.Text);
//                sqlCmd1.ExecuteNonQuery();
//                sqlCon1.Close();
//            }

//            addhistorial addhistorial = new addhistorial();
//            bool addSucces = addhistorial.addhistorials("Ingreso", Convert.ToInt32(txtcantdep.Text), txtacproddep.Text, ddlistdep.SelectedValue);




//        string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
//        Response.Redirect(pageUrl + "?ProductAction=addprodendep");
//    }
//    if (rblistlist.Items[1].Selected)
//    {
//            using (SqlConnection sqlCon = new SqlConnection(connectionString))
//            {
//                sqlCon.Open();
//                string query = "IF EXISTS(SELECT* FROM prodendeps WHERE Depositos_DepID = @Depositos and (prodendeps.Product_ProductID in " +
//                    "(select ProductID from Products where ProductName = @Productos))) BEGIN UPDATE prodendeps " +
//                    "SET cantingreso = cantingreso + @cantingreso, Observaciones = @Observaciones WHERE Depositos_DepID = @Depositos and " +
//                    "(prodendeps.Product_ProductID in (select ProductID from Products where ProductName = @Productos)); END ELSE BEGIN insert into " +
//                    "prodendeps(Observaciones, cantingreso, Depositos_DepID, Product_ProductID) values(@Observaciones, @cantingreso, @Depositos, " +
//                    "(select ProductID from Products where ProductName = @Productos)); END";

//                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
//                sqlCmd.Parameters.AddWithValue("@Observaciones", txtobsdep.Text);
//                sqlCmd.Parameters.AddWithValue("@cantingreso", -Convert.ToInt32(txtcantdep.Text));
//                sqlCmd.Parameters.AddWithValue("@Productos", txtacproddep.Text);
//                sqlCmd.Parameters.AddWithValue("@Depositos", ddlistdep.SelectedValue);
//                sqlCmd.ExecuteNonQuery();
//            }

//            using (SqlConnection sqlCon1 = new SqlConnection(connectionString))
//            {
//                sqlCon1.Open();
//                string query1 = "UPDATE Products SET stock = stock - @stock WHERE ProductID in (select ProductID from Products where ProductName = @Productos) ";
//                SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon1);
//                sqlCmd1.Parameters.AddWithValue("@stock", txtcantdep.Text);
//                sqlCmd1.Parameters.AddWithValue("@Productos", txtacproddep.Text);
//                sqlCmd1.ExecuteNonQuery();
//            }

//            addhistorial addhistorial = new addhistorial();
//            bool addSucces3 = addhistorial.addhistorials("Egreso", Convert.ToInt32(txtcantdep.Text), txtacproddep.Text, ddlistdep.SelectedValue);

//        string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
//        Response.Redirect(pageUrl + "?ProductAction=addprodendep");

//    }
//}