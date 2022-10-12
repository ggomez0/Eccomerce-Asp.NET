using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using System.Web.ModelBinding;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ShopGaspar
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        //public IQueryable<Product> GetProducts1([QueryString("id")] int? categoryId)
        //{
        //    var _db = new ShopGaspar.Models.ProductContext();
        //    IQueryable<Product> query = _db.Products;
        //    if (categoryId.HasValue && categoryId > 0)
        //    {
        //        query = query.Where(p => p.CategoryID == categoryId);
        //    }
        //    return query;
        //}

        //public IQueryable<Product> GetProducts()
        //{
        //    var _db = new ShopGaspar.Models.ProductContext();
        //    IQueryable<Product> query = _db.Products;
        //    if (txtsearch.Text == "")
        //    {
        //        query = query.Where(p => p.ProductName == "Fast Car");
        //    }
        //    else
        //    {
        //        query = query.Where(p => p.ProductName == "Convertible Car");
        //    }
        //    return query;
        //}
        //private void SearchCustomers(string conexion, TextBox txt, string comando, string comandowhere, string comanconta, ListView tabla)
        //{
        //    string constr = ConfigurationManager.ConnectionStrings[conexion].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            string sql = comando;
        //            if (!string.IsNullOrEmpty(txt.Text.Trim()))
        //            {
        //                sql += comandowhere;
        //                cmd.Parameters.AddWithValue(comanconta, txt.Text.Trim());
        //            }
        //            cmd.CommandText = sql;
        //            cmd.Connection = con;
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                sda.Fill(dt);
        //                tabla.DataSource = dt;
        //                tabla.DataBind();
        //            }
        //        }
        //    }
        //}
        //protected void buscaproductos_Click(object sender, EventArgs e)
        //{
        //    this.SearchCustomers("ShopGaspar", txtfilter, "select * from Products", " where @contactname like '%'", "@contactname", productList);

        //}


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopGaspar"].ToString());
            //SqlCommand cmd = new SqlCommand();
            //SqlDataAdapter sqlDA; 
            //cnn.Open();
            //sqlDA = new SqlDataAdapter(cmd);
            //cmd.CommandText =
            //   "SELECT ProductID, ImagePath, ProductName, UnitPrice FROM [Products] WHERE([ProductName] LIKE @param)";
            //cmd.Parameters.AddWithValue("Param", txtsearch.Text.Replace("'", "''"));
            //productList.DataBind();
        }
    }
}