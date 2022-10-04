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
    public partial class proddeprov : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string nID = Request.QueryString["id"];
                lblord.Text += nID;
                //mostrarorder(nID);
            }
        }

        private void mostrarorder(string ido)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopGaspar"].ToString());
            SqlCommand cmd = new SqlCommand();
            DataTable dataTable = new DataTable();
            SqlDataAdapter sqlDA; cnn.Open();
            cmd.CommandText = "select ProductID,ProductName,UnitPrice from Products p inner join proveedores pr on p.ProvID=pr.ProvID where p.ProvID=@idorder";
            cmd.Parameters.AddWithValue("@idorder", ido);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cnn;
            sqlDA = new SqlDataAdapter(cmd);
            sqlDA.Fill(dataTable);
            gvprodprov.DataSource = dataTable;
            gvprodprov.DataBind();
            cnn.Close();
            gvprodprov.UseAccessibleHeader = true;
            gvprodprov.HeaderRow.TableSection = TableRowSection.TableHeader;
        }


        protected void gvprodprov_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvprodprov_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvprodprov_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
              

        }

        protected void gvprodprov_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           

        }

        protected void gvprodprov_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //try
            //{
            //    if (e.CommandName.Equals("pasar"))
            //    {
            //        using (SqlConnection sqlCon = new SqlConnection(connectionString))
            //        {
            //            sqlCon.Open();
            //            string query = "INSERT INTO Products (ProductName,Description,ImagePath,UnitPrice,CategoryID,stock) VALUES (@ProductName,@Description,@ImagePath,@UnitPrice,@CategoryID,@stock)";
            //            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            //            sqlCmd.Parameters.AddWithValue("@ProductName", (gridproductos.FooterRow.FindControl("txtProductNameFooter") as TextBox).Text.Trim());
            //            sqlCmd.Parameters.AddWithValue("@Description", (gridproductos.FooterRow.FindControl("txtDescriptionFooter") as TextBox).Text.Trim());
            //            sqlCmd.Parameters.AddWithValue("@ImagePath", (gridproductos.FooterRow.FindControl("txtImagePathFooter") as TextBox).Text.Trim());
            //            sqlCmd.Parameters.AddWithValue("@UnitPrice", (gridproductos.FooterRow.FindControl("txtUnitPriceFooter") as TextBox).Text.Trim());
            //            sqlCmd.Parameters.AddWithValue("@CategoryID", (gridproductos.FooterRow.FindControl("ddlprodupf") as DropDownList).Text.Trim());
            //            sqlCmd.Parameters.AddWithValue("@stock", (gridproductos.FooterRow.FindControl("txtstockFooter") as TextBox).Text.Trim());

            //            sqlCmd.ExecuteNonQuery();
            //            //this.databasecrud(connectionString, "SELECT * FROM Products", gridproductos);
                     
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    //lblSuccessMessage.Text = "";
            //    //lblErrorMessage.Text = ex.Message;
            //}
        }
    }

}