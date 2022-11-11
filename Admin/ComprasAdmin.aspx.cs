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
using System.IO;
using System.Text;
using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using System.Web.ModelBinding;

namespace ShopGaspar.Admin
{
    public partial class ComprasAdmin : System.Web.UI.Page
    {
        private ProductContext _db = new ProductContext();
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.databasecrud(connectionString, "SELECT * FROM proveedores", gvproveedores);
                this.databasecrud(connectionString, "SELECT * FROM comprobantes c inner join proveedores p on p.ProvID=c.ProvID where idcomprobante=2", gvlstcpra);
                this.databasecrud(connectionString, "SELECT * FROM comprobantes c inner join proveedores p on c.ProvID=p.ProvID where idcomprobante=3", gvfact);                
                this.databasecrud(connectionString, "SELECT * FROM comprobantes c inner join proveedores p on p.ProvID=c.ProvID where idcomprobante=4", gvfactpag);

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

        protected void gvproveedores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvproveedores.EditIndex = e.NewEditIndex;
            this.databasecrud(connectionString, "SELECT * FROM proveedores ", gvproveedores);
        }

        protected void gvproveedores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvproveedores.EditIndex = -1;
            this.databasecrud(connectionString, "SELECT * FROM proveedores", gvproveedores);
        }

        protected void gvproveedores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE proveedores SET ProvName=@ProvName,ReprProv=@ReprProv,cuit=@cuit,email=@email,telefono=@telefono,comentario=@comentario WHERE ProvID = @provid";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProvName", (gvproveedores.Rows[e.RowIndex].FindControl("txtnomprovedit") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ReprProv", (gvproveedores.Rows[e.RowIndex].FindControl("txtreprprovedit") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@cuit", (gvproveedores.Rows[e.RowIndex].FindControl("txtcuitprovedit") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@email", (gvproveedores.Rows[e.RowIndex].FindControl("txtemailprovedit") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@telefono", (gvproveedores.Rows[e.RowIndex].FindControl("txttelprovedit") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@comentario", (gvproveedores.Rows[e.RowIndex].FindControl("txtcomprovedit") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@provid", Convert.ToInt32(gvproveedores.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvproveedores.EditIndex = -1;
                    this.databasecrud(connectionString, "SELECT * FROM proveedores", gvproveedores);
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

        protected void gvproveedores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM proveedores WHERE ProvID = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvproveedores.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    this.databasecrud(connectionString, "SELECT * FROM proveedores", gvproveedores);
                    lblSuccessMessage.Text = "Proveedor eliminado con exito";
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

        protected void gvproveedores_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnagregarprov_Click(object sender, EventArgs e)
        {
            AgregarProv addprov = new AgregarProv();
            bool addSuccess = addprov.AddProv(txtnomprov.Text, txtreprprov.Text, txttelprov.Text, txtemailprov.Text, txtcomprov.Text, txtcuitprov.Text);

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


        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        protected void gvlstcpra_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvlstcpra.EditIndex = e.NewEditIndex;
            this.databasecrud(connectionString, "SELECT * FROM lstcpra ", gvlstcpra);
        }

        protected void gvlstcpra_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvlstcpra.EditIndex = -1;
            this.databasecrud(connectionString, "SELECT * FROM lstcpra", gvlstcpra);
        }

        protected void gvlstcpra_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        }

        protected void gvlstcpra_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "delete from comprobantesdets where Comprobantes_idcomp=@ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvlstcpra.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    lblSuccessMessage.Text = "Pedido eliminado con exito";
                    lblErrorMessage.Text = "";

                }
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM comprobantes WHERE idcomp = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvlstcpra.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    lblSuccessMessage.Text = "Pedido eliminado con exito";
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

       

        protected void gvlstcpra_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                   
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
            Response.Redirect(Request.RawUrl);
        }

        public IQueryable GetProveedores()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.proveedores;
            return query;
        }



      


        protected void addlstbtn_Click(object sender, EventArgs e)
        {
            addrepoes addlstcpra = new addrepoes();
            bool addSuccess = addlstcpra.addrepooes("Lista",null,0,null, null);


            if (addSuccess)
            {
                // Reload the page.
                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect(pageUrl + "?ProductAction=Agregado");
            }
            else
            {
                lblconfirmardep.Text = "No se pudo agregar la lista";
            }
        }

        protected void btnlstdet_Click(object sender, ImageClickEventArgs e)
        {
            int id = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/Detalles_OrdCpra.aspx?id=" + id);
        }

        protected void gvordcpra_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvordcpra_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM comprobantes WHERE idcomp = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvfact.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    lblSuccessMessage.Text = "Orden de compra eliminada con exito";
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

        protected void btnorddet_Click(object sender, ImageClickEventArgs e)
        {
            int id = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/ordcpradet.aspx?id=" + id);
        }

        protected void gvfact_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvfact_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvfact_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM comprobantes WHERE idcomp = @ProductID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(gvfact.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    lblSuccessMessage.Text = "Factura eliminado con exito";
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


        
        
    

        protected void btnlstdet1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btnSelect = (sender as ImageButton);
            string[] id1 = btnSelect.CommandArgument.Split(',');

            Response.Redirect("~/Admin/factdet.aspx?id1=" + id1[0] + "&id2=" + id1[1]);
        }



        protected void btnordcprarec_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ordcprarec");
        }

        protected void btnordcpraenv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ordcpraenv");

        }
   

        protected void btnordcprabor_Click(object sender, EventArgs e)
        {
             Response.Redirect("~/Admin/ordcprabor");
        }

        protected void pagarbtnno_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);

        }
      

        protected void btnverfactpago_Click2(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            int id = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Admin/pagodetalles.aspx?id=" + id);
        }

        protected void Button8factopen_Click(object sender, EventArgs e)
        {
            addcomprobante addfact = new addcomprobante();
            bool addSuccess = addfact.addcomprobantes(null, null, 0, 3, null, null, null);


            if (addSuccess)
            {
                Response.Redirect("~/Admin/Nueva_factura.aspx");

            }


        }

        protected void btnpagofact_Click(object sender, EventArgs e)
        {
            addcomprobante addpago = new addcomprobante();
            bool addSuccess = addpago.addcomprobantes(null, null, 0, 4, null, null, null);


            if (addSuccess)
            {
                Response.Redirect("~/Admin/Nuevo_pago.aspx");
            }
        }

        protected void addordcpra_Click(object sender, EventArgs e)
        {
            addcomprobante addpago = new addcomprobante();
            bool addSuccess = addpago.addcomprobantes(null, null, 0, 2, null, null, null);


            if (addSuccess)
            {
                Response.Redirect("~/Admin/Nuevo_OrdenCompra.aspx");
            }
        }
    }
}