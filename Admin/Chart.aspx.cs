using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ShopGaspar
{
    public partial class Chart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      


        protected string obtenerDatos()
        {
            //SqlConnection connectionString = new SqlConnection("Data Source=GOMEZGASPAR\\GASPARGOMEZ;Initial Catalog=SISTEMASIII006_231b468c28eb457a866e1010c0d04c15; Integrated Security=True");


            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = "SELECT concat(YEAR(fechacomprobante),'-', MONTH(fechacomprobante)) AS Mes, " +
            //    "SUM(importe) AS Egresos,(SELECT SUM(d.totalprod) AS Expr1 FROM dbo.Orders AS o INNER JOIN " +
            //    "dbo.OrderDetails AS d ON o.OrderId = d.OrderId WHERE (YEAR(c.fechacomprobante) = YEAR(o.OrderDate))" +
            //    " AND (MONTH(c.fechacomprobante) = MONTH(o.OrderDate))) AS Ingresos FROM " +
            //    "dbo.comprobantes AS c WHERE  (idcomprobante = 4) " +
            //    "GROUP BY YEAR(fechacomprobante), MONTH(fechacomprobante)";
            //cmd.CommandType = CommandType.Text;
            //cmd.Connection = connectionString;
            //connectionString.Open();
            //DataTable Datos = new DataTable();
           
            //Datos.Rows.Add(cmd.ExecuteReader());
            //connectionString.Close();



            DataTable Datos = new DataTable();

            //Columnas de los datos
            Datos.Columns.Add(new DataColumn("Año", typeof(string)));
            Datos.Columns.Add(new DataColumn("ing", typeof(string)));
            Datos.Columns.Add(new DataColumn("Egreso", typeof(string)));

            //Datos de las columnas (mostrar en el chart)
            Datos.Rows.Add(new Object[] { "new Date(2015, 5, 6)", 15, 8 });

            string strDatos;

            strDatos = "[";

            foreach (DataRow dr in Datos.Rows)
            {
                strDatos = strDatos + "[";
                strDatos = strDatos + "" + dr[0] + "" + "," + dr[1].ToString().Replace(",", ".") + "," + dr[2].ToString().Replace(",", ".");
                strDatos = strDatos + "],";

            }
            strDatos = strDatos + "]";

            return strDatos;
        }


    }


}
    

