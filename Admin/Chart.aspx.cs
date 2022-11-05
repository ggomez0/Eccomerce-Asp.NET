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
            SqlConnection connectionString = new SqlConnection("Data Source=GOMEZGASPAR\\GASPARGOMEZ;Initial Catalog=SISTEMASIII006_231b468c28eb457a866e1010c0d04c15; Integrated Security=True");


            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT ProductName, UnitPrice FROM OrderDetails";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = connectionString;
            connectionString.Open();
            DataTable Datos = new DataTable();
            Datos.Load(cmd.ExecuteReader());
            connectionString.Close();
                


            //DataTable Datos = new DataTable();

            ////Columnas de los datos
            //Datos.Columns.Add(new DataColumn("Año", typeof(string)));
            //Datos.Columns.Add(new DataColumn("Java", typeof(string)));
            //Datos.Columns.Add(new DataColumn("Python", typeof(string)));
            //Datos.Columns.Add(new DataColumn("C#", typeof(string)));
            //Datos.Columns.Add(new DataColumn("JavaScript", typeof(string)));

            ////Datos de las columnas (mostrar en el chart)
            //Datos.Rows.Add(new Object[] { "new Date(2015, 5, 6)", 15, 2.8, 5.7, 3.6 });
            //Datos.Rows.Add(new Object[] { "new Date(2016, 5, 6)", 21, 4.4, 5.4, 2.9 });
            //Datos.Rows.Add(new Object[] { "new Date(2017, 5, 6)", 14.6, 3.5, 3.6, 3.0 });

            string strDatos;

            strDatos = "[";

            foreach (DataRow dr in Datos.Rows)
            {
                strDatos = strDatos + "[";
                strDatos = strDatos + "" + dr[0] + "" + "," + dr[1] ;

                //+"," + dr[3].ToString().Replace(",", ".") + "," + dr[4].ToString().Replace(",", ".") + "," + dr[2].ToString().Replace(",", ".") 
                strDatos = strDatos + "],";

            }
            strDatos = strDatos + "]";

            return strDatos;
        }
    }
}
    

