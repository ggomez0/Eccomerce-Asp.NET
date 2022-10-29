using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;
using ShopGaspar.Models;

namespace ShopGaspar.Admin
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public static object[] GetChartData()
        //{
        //    List<Order> data = new List<Order>();

        //    using (ProductContext dc = new ProductContext())
        //    {
        //        data = dc.Orders.ToList();
        //    }

        //    var chartData = new object[data.Count + 1];
        //    chartData[0] = new object[]{
        //        "Year",
        //        "Electronics",
        //        "Books & Media",
        //        "Home & Kitchen"
        //    };

        //    int j = 0;
        //    foreach (var i in data)
        //    {
        //        j++;
        //        chartData[j] = new object[] { i.Address.ToString(), i.City, i.Country, i.Email };
        //    }
        //    return chartData;
        //}
    }
}