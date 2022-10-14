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
    public partial class ordcprabor : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.databasecrud(connectionString, "select * from comprobantes where idcomprobante=2 and descripcion='Borrador' order by idcomp desc",gvordcprarec);
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
                tablag.Rows[0].Cells[0].Text = "No se encontraron registros..!";
                tablag.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            tablag.UseAccessibleHeader = true;
            tablag.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

     

        protected void btnvermasordcpraenv_Click(object sender, EventArgs e)
        {
        }

        protected void gvordcprarec_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //using (SqlConnection sqlCon = new SqlConnection(connectionString))
            //{
            //    sqlCon.Open();
            //    string query = "insert into comprobantesdets(cantidad,Comprobantes_idcomp,Product_ProductID)" +
            //        "(select cantidad, @idcomp, Product_ProductID from pedrepodets where " +
            //        "ProvID = @provid)";
            //    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            //    sqlCmd.Parameters.AddWithValue("@idcomp", Convert.ToInt32(gvordcprarec.DataKeys[e.RowIndex].Values[0].ToString()));
            //    sqlCmd.Parameters.AddWithValue("@provid", Convert.ToInt32(gvordcprarec.DataKeys[e.RowIndex].Values[1].ToString()));

            //    sqlCmd.ExecuteNonQuery();
            //    gvordcprarec.EditIndex = -1;
            //}

            Response.Redirect("~/Admin/ordcpraborrdet.aspx?id=" + Convert.ToInt32(gvordcprarec.DataKeys[e.RowIndex].Values[0].ToString()));





        }

    

        public IQueryable Getpedidosrepo()
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable query = _db.pedrepos;
            return query;
        }

        protected void btnlstpasaraord_Click1(object sender, EventArgs e)
        {
          
            try
            {
                
                using (SqlConnection sqlCon11 = new SqlConnection(connectionString))
                {
                    sqlCon11.Open();
                    string query5 = "declare @maxprov int = (select max(ProvID) from pedrepodets where pedrepo_idcomp=@idcomp); declare @current int = 1; while (@current <= @maxprov) begin insert comprobantes(ProvID, stringn, idcomprobante, dateTime, descripcion)(select distinct ProvID, @idcomp, 2, GETDATE(), 'Borrador' from pedrepodets where ProvID = @current and pedrepo_idcomp = @idcomp); insert into comprobantesdets(cantidad, Comprobantes_idcomp, Product_ProductID)(select cantidad, (select max(idcomp) from comprobantes), Product_ProductID from pedrepodets where ProvID = @current and pedrepo_idcomp = @idcomp); set @current = @current + 1; end; ";
                    SqlCommand sqlCmd12 = new SqlCommand(query5, sqlCon11);
                    sqlCmd12.Parameters.AddWithValue("@idcomp", ddlistpedidos.SelectedValue);

                    sqlCmd12.ExecuteNonQuery();


                }
                Response.Redirect(Request.RawUrl);
            }

            catch (Exception ex)
            {
                lblerror.Text = string.Format("Error al ingresar el beneficio ! Detalle: {0}", ex.Message);
            }
        }
    }
}