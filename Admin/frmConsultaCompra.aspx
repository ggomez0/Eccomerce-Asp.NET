<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmConsultaCompra.aspx.cs" Inherits="ShopGaspar.Admin.frmConsultaCompra" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-header">
                    Consultar Compras
                  </div>
                  <div class="card-body p-2">
                        <div class="row">
                            <div class="col-sm-2">
                              <div class="form-group mb-0">
                                <label for="txtRucProveedor" class="col-form-label col-form-label-sm">Fecha Inicio:</label>
                                <input type="text" class="form-control form-control-sm model" id="txtFechaInicio" name="FechaInicio" autocomplete="off">
                              </div>
                            </div>
                            <div class="col-sm-2">
                              <div class="form-group mb-0">
                                <label for="txtRucProveedor" class="col-form-label col-form-label-sm">Fecha Fin:</label>
                                <input type="text" class="form-control form-control-sm model" id="txtFechaFin" name="FechaFin" autocomplete="off">
                              </div>
                            </div>
                            <div class="col-sm-2">
                              <div class="form-group mb-0">
                                <label for="txtRucProveedor" class="col-form-label col-form-label-sm">Proveedor:</label>

                                <select class="form-control form-control-sm model" id="cboProveedor" name="Proveedor">
                                </select>
                              </div>
                            </div>
                            <div class="col-sm-2">
                              <div class="form-group mb-0">
                                <label for="txtRucProveedor" class="col-form-label col-form-label-sm">Tienda:</label>
                                <select class="form-control form-control-sm model" id="cboTienda" name="Tienda">
                                </select>
                              </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="form-group mb-0">
                                    <label for="btnBuscar" class="col-form-label col-form-label-sm invisible">Direccion:</label>
                                    <button id="btnBuscar" type="button" class="btn btn-sm btn-primary btn-block">Buscar</button>
                                </div>
                            </div>
                        </div>
                      <hr />
                        <div class="row mt-3">
                            <div class="col-sm-12">
                                <table id="tbCompras" class="table table-striped table-bordered nowrap compact" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Numero Compra</th>
                                            <th>Proveedor</th>
                                            <th>Tienda Destino</th>
                                            <th>Fecha Compra</th>
                                            <th>Total Costo </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                  </div>
                  <div class="card-footer">
                  </div>
                </div>
            </div>
    </div>
    <script src="Controlador/frmConsultarCompra/frmConsultarCompra.js"></script>

</asp:Content>
