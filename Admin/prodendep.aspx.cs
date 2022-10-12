using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopGaspar.Models;

namespace ShopGaspar.Admin
{
    public partial class prodendep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string nID = Request.QueryString["id"];
                mostrarorder(nID);
            }
        }

        public IQueryable<depositos> GetDeposito([QueryString("id")] int? pedidoid)
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable<depositos> query = _db.depositos;
            if (pedidoid.HasValue && pedidoid > 0)
            {
                query = query.Where(p => p.DepID== pedidoid);
            }
            else
            {
                query = null;
            }
            return query;
        }

        private void mostrarorder(string ido)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopGaspar"].ToString());
            SqlCommand cmd = new SqlCommand();
            DataTable dataTable = new DataTable();
            SqlDataAdapter sqlDA; cnn.Open();
            cmd.CommandText = "select IngID, ProductName as Nombre, cantingreso as Cantidad from prodendeps p inner join " +
                "Products pr on p.Product_ProductID=pr.ProductID where p.Depositos_DepID = @idorder";
            cmd.Parameters.AddWithValue("@idorder", ido);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cnn;
            sqlDA = new SqlDataAdapter(cmd);
            sqlDA.Fill(dataTable);
            gvprodendep.DataSource = dataTable;
            gvprodendep.DataBind();
            cnn.Close();
            gvprodendep.UseAccessibleHeader = true;
            gvprodendep.HeaderRow.TableSection = TableRowSection.TableHeader;
        }




    }
    
}