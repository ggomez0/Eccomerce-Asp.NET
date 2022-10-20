using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopGaspar
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
     
        }

        protected void btncat_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CategoriaAdmin.aspx");
        }

        protected void btnprod_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ProductosAdmin.aspx");

        }

        protected void btndep_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/DepositosAdmin.aspx");

        }

        protected void btningegr_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/IngEgrAdmin.aspx");

        }

        protected void btncompras_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ComprasAdmin.aspx");

        }

        protected void btntrans_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/TransaccionesAdmin.aspx");
        }

        protected void btnclientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ClientesAdmin.aspx");

        }

        protected void btnestadi_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/EstadisticasAdmin.aspx");

        }

        protected void btnpagocomp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/PagoComprobantes.aspx");
        }
    }
}