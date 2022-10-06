using ShopGaspar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopGaspar.Admin
{
    public partial class frmConsultaCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static Respuesta<List<comprobantes>> Obtener(string fechainicio, string fechafin, int idproveedor, int idtienda)
        {
            List<comprobantes> oListaCompra = new List<comprobantes>();
            oListaCompra = comprobantes               .Instancia.ObtenerListaCompra(Convert.ToDateTime(fechainicio), Convert.ToDateTime(fechafin), idproveedor, idtienda);
            if (oListaCompra != null)
                return new Respuesta<List<comprobantes>>() { estado = true, objeto = oListaCompra };
            else
                return new Respuesta<List<comprobantes>>() { estado = false, objeto = null };
        }

        [WebMethod]
        public static Respuesta<comprobantesdet> ObtenerDetalle(int IdCompra)
        {
            comprobantesdet oCompra = new comprobantesdet();
            oCompra = comprobantesdet.Instancia.ObtenerDetalleCompra(IdCompra);
            if (oCompra != null)
                return new Respuesta<Compra>() { estado = true, objeto = oCompra };
            else
                return new Respuesta<Compra>() { estado = false, objeto = null };
        }
    }
}