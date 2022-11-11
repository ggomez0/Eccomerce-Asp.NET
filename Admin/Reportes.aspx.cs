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
using System.Windows.Forms;

namespace ShopGaspar.Admin
{
    public partial class Reportes : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ShopGaspar"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string result = "select sum(totalprod) from OrderDetails";
                    SqlCommand showresult = new SqlCommand(result, conn);
                    conn.Open();
                    string nummov = showresult.ExecuteScalar().ToString();
                    lbling.Text += nummov;
                    conn.Close();
                }
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string result = "select max(OrderId) from Orders";
                    //((SELECT SUM(d.totalprod) AS Expr1 FROM dbo.Orders AS o INNER JOIN dbo.OrderDetails AS d ON o.OrderId = d.OrderId WHERE YEAR(c.fechacomprobante) = YEAR(o.OrderDate)) AND (MONTH(c.fechacomprobante) = MONTH(o.OrderDate))) - SUM(importe))
                    SqlCommand showresult = new SqlCommand(result, conn);
                    conn.Open();
                    string nummov1 = showresult.ExecuteScalar().ToString();
                    lblped.Text += nummov1;
                    conn.Close();
                }
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string result = "select sum(importe) from comprobantes where idcomprobante=4";
                    SqlCommand showresult = new SqlCommand(result, conn);
                    conn.Open();
                    string nummov2 = showresult.ExecuteScalar().ToString();
                    lblegr.Text += nummov2;
                    conn.Close();
                }
            }
        }
        protected string datosql1()
        {

            SqlConnection redSQL = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT concat(YEAR(fechacomprobante),'-',month(fechacomprobante)) as Fecha, (SELECT SUM(d.totalprod) AS Expr1 FROM dbo.Orders AS o INNER JOIN dbo.OrderDetails AS d ON o.OrderId = d.OrderId WHERE" +
                " (YEAR(c.fechacomprobante) = YEAR(o.OrderDate)) AND (MONTH(c.fechacomprobante) = MONTH(o.OrderDate))) AS Ingresos, SUM(importe) AS Egresos, ((SELECT SUM(d.totalprod) AS Expr1 FROM dbo.Orders AS o INNER JOIN dbo.OrderDetails AS d ON o.OrderId = d.OrderId WHERE " +
                "(YEAR(c.fechacomprobante) = YEAR(o.OrderDate)) AND (MONTH(c.fechacomprobante) = MONTH(o.OrderDate))) - SUM(importe)) as Ganancias FROM " +
                "dbo.comprobantes AS c WHERE (idcomprobante = 4) GROUP BY YEAR(fechacomprobante), MONTH(fechacomprobante) order by YEAR(fechacomprobante), MONTH(fechacomprobante) asc ";

            cmd.CommandType = CommandType.Text;
            cmd.Connection = redSQL;
            redSQL.Open();

            DataTable gdatos = new DataTable();
            gdatos.Load(cmd.ExecuteReader());
            redSQL.Close();



            string xdata;
            xdata = "[['Fecha','Ingresos','Egresos','Ganancias'],";
            foreach (DataRow dr in gdatos.Rows)
            {
                xdata = xdata + "[";
                xdata = xdata + "'" + dr[0] + "'" + "," + dr[1].ToString() + "," + dr[2].ToString() + "," + dr[3].ToString();
                xdata = xdata + "],";
            }

            xdata = xdata + "]";
            return xdata;

        }

        protected string datosql2()
        {

            SqlConnection redSQL = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT concat(YEAR(fechacomprobante),'-',month(fechacomprobante)) as Fecha, (SELECT SUM(d.totalprod) AS Expr1 FROM dbo.Orders AS o INNER JOIN dbo.OrderDetails AS d ON o.OrderId = d.OrderId WHERE" +
                " (YEAR(c.fechacomprobante) = YEAR(o.OrderDate)) AND (MONTH(c.fechacomprobante) = MONTH(o.OrderDate))) AS Ingresos FROM " +
                "dbo.comprobantes AS c WHERE (idcomprobante = 4) GROUP BY YEAR(fechacomprobante), MONTH(fechacomprobante) order by YEAR(fechacomprobante), MONTH(fechacomprobante) asc ";

            cmd.CommandType = CommandType.Text;
            cmd.Connection = redSQL;
            redSQL.Open();

            DataTable gdatos = new DataTable();
            gdatos.Load(cmd.ExecuteReader());
            redSQL.Close();



            string xdata;
            xdata = "[['Fecha','Ingresos'],";
            foreach (DataRow dr in gdatos.Rows)
            {
                xdata = xdata + "[";
                xdata = xdata + "'" + dr[0] + "'" + "," + dr[1].ToString();
                xdata = xdata + "],";
            }

            xdata = xdata + "]";
            return xdata;

        }

        protected string datosql3()
        {

            SqlConnection redSQL = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT concat(YEAR(fechacomprobante),'-',month(fechacomprobante)) as Fecha, SUM(importe) AS Egresos FROM " +
                "dbo.comprobantes AS c WHERE (idcomprobante = 4) GROUP BY YEAR(fechacomprobante), MONTH(fechacomprobante) order by YEAR(fechacomprobante), MONTH(fechacomprobante) asc ";

            cmd.CommandType = CommandType.Text;
            cmd.Connection = redSQL;
            redSQL.Open();

            DataTable gdatos = new DataTable();
            gdatos.Load(cmd.ExecuteReader());
            redSQL.Close();



            string xdata;
            xdata = "[['Fecha','Egresos'],";
            foreach (DataRow dr in gdatos.Rows)
            {
                xdata = xdata + "[";
                xdata = xdata + "'" + dr[0] + "'" + "," + dr[1].ToString();
                xdata = xdata + "],";
            }

            xdata = xdata + "]";
            return xdata;

        }
    }
}