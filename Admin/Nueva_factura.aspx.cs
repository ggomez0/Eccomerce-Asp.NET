using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace ShopGaspar.Admin
{
    public partial class Nueva_factura : System.Web.UI.Page
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
                    txtidfact.Text = nummov;
                    conn.Close();
                }

                this.databasecrud(connectionString, "SELECT * from comprobantesdets cd inner join products p on p.ProductID=cd.Product_ProductID" +
                    " where Comprobantes_idcomp=" + Convert.ToInt32(txtidfact.Text), gvprodfact);

            }



        }

        protected void btnguardarfact_Click(object sender, EventArgs e)
        {

        }

        protected void gvprodfact_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvproductoslista_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

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


        //protected void btnanfact_Click(object sender, EventArgs e)
        //{
        //    addcomprobante addfactura = new addcomprobante();
        //    bool addSuccess = addfactura.addcomprobantes(txttipo.Text, txtsucursal.Text, 0, 3, ddlistfact.SelectedValue, txtnumfact.Text, txtcalendar.Text);

        //    if (addSuccess)
        //    {

        //        foreach (GridViewRow row in gvproductosfact.Rows)
        //        {


        //            if (((CheckBox)row.FindControl("checkboxprodfact")).Checked)
        //            {
        //                using (SqlConnection sqlCon = new SqlConnection(connectionString))
        //                {
        //                    sqlCon.Open();
        //                    string query = " declare @lstcompra int = (select max(idcomp) from comprobantes); insert into comprobantesdets(cantidad,Product_ProductID,Comprobantes_idcomp) values (@cantidad,@product,@lstcompra);";
        //                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
        //                    sqlCmd.Parameters.AddWithValue("@cantidad", ((TextBox)row.FindControl("txtcantlstfact")).Text);
        //                    sqlCmd.Parameters.AddWithValue("@product", ((Label)row.FindControl("lblidprod")).Text);

        //                    sqlCmd.ExecuteNonQuery();
        //                }
        //            }

        //            using (SqlConnection sqlCon = new SqlConnection(connectionString))
        //            {
        //                sqlCon.Open();
        //                string query = "declare @lstcompra int = (select max(idcomp) from comprobantes); declare @importee int = (select sum(cantidad*p.UnitPrice) from comprobantesdets c inner join products p on p.ProductID=c.Product_ProductID where Comprobantes_idcomp=@lstcompra); update comprobantes set importe=@importee where idcomp=@lstcompra;";
        //                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
        //                sqlCmd.ExecuteNonQuery();
        //                gvproductosfact.EditIndex = -1;
        //                lblSuccessMessage.Text = "Agregado con exito";
        //                lblErrorMessage.Text = "";
        //            }
        //        }
        //    }




        //    // Reload the page.
        //    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
        //    Response.Redirect(pageUrl + "?ProductAction=addfact");
        //}

    }
}