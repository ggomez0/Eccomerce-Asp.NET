<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docCompra.aspx.cs" Inherits="ShopGaspar.Admin.docCompra" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div style="font-size: 11px; text-align: right;">
            <center>
                <button type="button" id="Imprimir" onclick="javascript:imprSelec('seleccion')">IMPRIMIR</button>
            </center>
            <br>
   </div>

    <div id="seleccion">
        <center>
       
    <table style="width: 650px; border:2px solid #000;padding: 10px;" border="0">
        <tbody>
            <tr>
                <td colspan="4"></td>
                <td colspan="2" style="vertical-align: top;" align="right">
                    <table border="1" style="height: 90px; font-weight: bold; ">
                        <tr bgcolor="#D9D9D9"><td align="center">COMPRA</td></tr>
                        <tr><td align="center">NRO - <span id="numero"></span> </td></tr>
                        <tr><td align="center">Fecha - <span id="fechacompra"></span> </td></tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 20px;"><td colspan="6"><br /></td></tr>
            <tr>
                <td colspan="6">
                    <table style="width: 100%;">
                        <tr bgcolor="#D9D9D9">
                            <td colspan="4">
                                <u>Detalle Proveedor</u>
                            </td>
                        </tr>
                        <tr>
                            <td width="15">Ruc:</td>
                            <td style="border-bottom: 1px solid black;"><center><span id="rucproveedor"></span></center></td>
                            <td width="100">Razon Social:</td>
                            <td style="border-bottom: 1px solid black;"><center><span id="nombreproveedor"></span></center></td>
                        </tr>
                    </table>
                    <hr>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <table style="width: 100%;" border="0">
                        <tr bgcolor="#D9D9D9">
                            <td colspan="4">
                                <u>Tienda Destino</u>
                            </td>
                        </tr>
                        <tr>
                            <td width="15">Ruc:</td>
                            <td style="border-bottom: 1px solid black;"><center><span id="ructienda"></span></center></td>
                            <td width="110">Nombre Tienda:</td>
                            <td style="border-bottom: 1px solid black;"><center><span id="nombretienda"></span></center></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr style="height: 10px;"></tr>
            <tr style="height: 10px;"><td style="height:10px"></td></tr>
            <tr bgcolor="#D9D9D9">
                <td colspan="6">
                    <u>Detalle Productos</u>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <table id="tbCompras" border="1" style=" width: 100%;">
                        <thead>
                            <tr bgcolor="#D9D9D9">
                                <th style="width: 15%;">Cantidad</th>
                                <th style="width: 50%;">Concepto</th>
                                <th style="width: 20%;">P.Unit Compra</th>
                                <th style="width: 25%;">Importe</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4"></td>
                <td colspan="2" align="right">
                    <table style="font-weight: bold; width: 150px;">
                        <tr>
                            <td>Total S/.</td>
                            <td style="border:1px solid black;"><span id="totalcosto"></span></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</center>
    </div>
    
   <script src="Assets/Plugins/jquery/jquery.3.5.1.min.js"></script>
   <script src="Controlador/Utilidades.js"></script>
   <script src="Assets/Plugins/loadingoverlay/loadingoverlay.js"></script>

   <script type="text/javascript" language="javascript">

       $(document).ready(function () {

            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const IdCompra = urlParams.get('id')
            
           CargarDatos(IdCompra);
       });

       function CargarDatos($IdCompra) {
           
            $('#tbCompras tbody').html('');

            var request = {
                IdCompra: $IdCompra
           };

            AjaxPost("../frmConsultarCompra.aspx/ObtenerDetalle", JSON.stringify(request),
                function (response) {
                    $("#seleccion").LoadingOverlay("hide");
                    if (response.estado) {
                        $("#numero").text(response.objeto.Codigo);
                        $("#fechacompra").text(response.objeto.FechaCompra);

                        $("#rucproveedor").text(response.objeto.oProveedor.Ruc);
                        $("#nombreproveedor").text(response.objeto.oProveedor.RazonSocial);

                        $("#ructienda").text(response.objeto.oTienda.RUC);
                        $("#nombretienda").text(response.objeto.oTienda.Nombre);
                        
                        $("#totalcosto").text(response.objeto.TotalCosto);

                        $("#tbCompras tbody").html("");
                
                        $.each(response.objeto.oListaDetalleCompra, function (i, row) {
                            $("<tr>").append(
                                $("<td>").text(row.Cantidad),
                                $("<td>").text(row.oProducto.Nombre),
                                $("<td>").text(row.PrecioUnitarioCompra),
                                $("<td>").text(row.TotalCosto)
                        
                            ).appendTo("#tbCompras tbody");

                        })

                    } 
                },
                function () {
                    $("#seleccion").LoadingOverlay("hide");
                },
                function () {
                    $("#seleccion").LoadingOverlay("show");
                })
       }

        function imprSelec(nombre) {
            var printContents = document.getElementById(nombre).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
        function hide() {
            document.getElementById('Imprimir').style.visibility = "hidden";
        }
   </script>



</body>
</html>

