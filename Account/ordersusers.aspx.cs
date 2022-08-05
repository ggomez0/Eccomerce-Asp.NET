using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopGaspar.Account
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.Mostrarprod();
            }

        }

        private void Mostrarprod()
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopGaspar"].ToString());
            SqlCommand cmd = new SqlCommand();
            DataTable dataTable = new DataTable();
            SqlDataAdapter sqlDA; cnn.Open();
            cmd.CommandText = "select OrderId, OrderDate from Orders where Username = @CurrentUser";
            cmd.Parameters.AddWithValue("@CurrentUser", User.Identity.Name);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cnn;
            sqlDA = new SqlDataAdapter(cmd);
            sqlDA.Fill(dataTable);
            gvorderuser.DataSource = dataTable;
            gvorderuser.DataBind();
            cnn.Close();
            gvorderuser.UseAccessibleHeader = true;
            gvorderuser.HeaderRow.TableSection = TableRowSection.TableHeader;
        }


        protected void imgbtnorderuser_Click(object sender, ImageClickEventArgs e)
        {
            int id = Convert.ToInt32((sender as ImageButton).CommandArgument);
            Response.Redirect("~/Account/orderdetailsuser.aspx?id=" + id);
            



        }

        

    }



      
    }
