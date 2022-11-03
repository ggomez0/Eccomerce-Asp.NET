using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;
using ShopGaspar.Models;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ShopGaspar.Admin
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string query = "select distinct idcomprobante from comprobantes";
                //DataTable dt = GetData(query);
                //ddlCountries.DataSource = dt;
                //ddlCountries.DataTextField = "idcomprobante";
                //ddlCountries.DataValueField = "idcomprobante";
                //ddlCountries.DataBind();
                //ddlCountries.Items.Insert(0, new ListItem("Selecciona", ""));
                string query = string.Format("select fechacomprobante, sum(importe) from comprobantes where idcomprobante=4 group by fechacomprobante");
                DataTable dt = GetData(query);

                string[] x = new string[dt.Rows.Count];
                decimal[] y = new decimal[dt.Rows.Count];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    x[i] = dt.Rows[i][0].ToString();
                    y[i] = Convert.ToInt32(dt.Rows[i][1]);
                }
                BarChart1.Series.Add(new AjaxControlToolkit.BarChartSeries { Data = y });
                BarChart1.CategoriesAxis = string.Join(",", x);
                if (x.Length > 3)
                {
                    BarChart1.ChartWidth = (x.Length * 100).ToString();
                }
                BarChart1.BorderStyle = BorderStyle.None;


                string query1 = string.Format("select o.OrderYear, sum(od.totalprod) from Orders o inner join OrderDetails od on o.OrderId=od.OrderId group by o.OrderYear");
                DataTable dt1 = GetData(query1);

                string[] x1 = new string[dt1.Rows.Count];
                decimal[] y1 = new decimal[dt1.Rows.Count];
                for (int j = 0; j < dt1.Rows.Count; j++)
                {
                    x1[j] = dt1.Rows[j][0].ToString();
                    y1[j] = Convert.ToInt32(dt1.Rows[j][1]);
                }
                BarChart2.Series.Add(new AjaxControlToolkit.BarChartSeries { Data = y1 });
                BarChart2.CategoriesAxis = string.Join(",", x1);
                if (x1.Length > 3)
                {
                    BarChart2.ChartWidth = (x1.Length * 100).ToString();
                }
                BarChart2.BorderStyle = BorderStyle.None;

            }
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string query = string.Format("select fechacomprobante, sum(importe) from comprobantes where idcomprobante=4 group by fechacomprobante", ddlCountries.SelectedItem.Value);
            //DataTable dt = GetData(query);

            //string[] x = new string[dt.Rows.Count];
            //decimal[] y = new decimal[dt.Rows.Count];
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    x[i] = dt.Rows[i][0].ToString();
            //    y[i] = Convert.ToInt32(dt.Rows[i][1]);
            //}
            //BarChart1.Series.Add(new AjaxControlToolkit.BarChartSeries { Data = y });
            //BarChart1.CategoriesAxis = string.Join(",", x);
            //if (x.Length > 3)
            //{
            //    BarChart1.ChartWidth = (x.Length * 100).ToString();
            //}
            //BarChart1.BorderStyle = BorderStyle.None;
        }

        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }
    }
}