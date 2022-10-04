<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRegistrarCompra.aspx.cs" Inherits="ShopGaspar.Admin.frmRegistrarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-header">
                     Registrar Compra
                  </div>
                  <div class="card-body card-compra p-2">
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="card">
                                  <div class="card-body p-2">
                                      <h6 class="card-title mb-1">Detalle Proveedor Origen</h6>
                                      <div class="row">
                                          <input id="txtIdProveedor" type="hidden" value="0" />
                                          <div class="col-sm-4">
                                            <div class="form-group mb-0">
                                              <label for="txtRucProveedor" class="col-form-label col-form-label-sm">RUC:</label>
                                              <input type="text" class="form-control form-control-sm model" readonly id="txtRucProveedor" name="RUC">
                                            </div>
                                          </div>
                                          <div class="col-sm-4">
                                            <div class="form-group mb-0">
                                              <label for="txtRazonSocialProveedor" class="col-form-label col-form-label-sm">Razon Social:</label>
                                              <input type="text" class="form-control form-control-sm model" readonly id="txtRazonSocialProveedor" name="RazonSocial">
                                            </div>
                                          </div>
                                          <div class="col-sm-4">
                                            <div class="form-group mb-0">
                                                <label for="btnBuscarProveedor" class="col-form-label col-form-label-sm invisible">Buscar:</label>
                                                <button id="btnBuscarProveedor" type="button" class="btn btn-sm btn-secondary btn-block">Buscar</button>
                                            </div>
                                          </div>
                                      </div>
                                  </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="card">
                                  <div class="card-body p-2">
                                      <h6 class="card-title mb-1">Detalle Tienda Destino</h6>
                                      <div class="row">
                                          <input id="txtIdTienda" type="hidden" value="0" />
                                          <div class="col-sm-4">
                                            <div class="form-group mb-0">
                                              <label for="txtRucTienda" class="col-form-label col-form-label-sm">RUC:</label>
                                              <input type="text" class="form-control form-control-sm model" readonly id="txtRucTienda" name="RUC">
                                            </div>
                                          </div>
                                          <div class="col-sm-4">
                                            <div class="form-group mb-0">
                                              <label for="txtNombreTienda" class="col-form-label col-form-label-sm">Nombre:</label>
                                              <input type="text" class="form-control form-control-sm model" readonly id="txtNombreTienda" name="NombreTienda">
                                            </div>
                                          </div>
                                          <div class="col-sm-4">
                                            <div class="form-group mb-0">
                                                <label for="btnBuscarTienda" class="col-form-label col-form-label-sm invisible">Buscar:</label>
                                                <button id="btnBuscarTienda" type="button" class="btn btn-sm btn-secondary btn-block">Buscar</button>
                                            </div>
                                          </div>
                                      </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-sm-12">
                                <div class="card">
                                  <div class="card-body p-2">
                                      <h6 class="card-title mb-1">Detalle Producto</h6>
                                      <div class="row">
                                          <input id="txtIdProducto" type="hidden" value="0" />
                                          <div class="col-sm-2">
                                            <div class="form-group mb-0">
                                              <label for="txtCodigoProducto" class="col-form-label col-form-label-sm">Codigo:</label>
                                              <input type="text" class="form-control form-control-sm model" id="txtCodigoProducto" name="Codigo" autocomplete="off">
                                            </div>
                                          </div>
                                          <div class="col-sm-2">
                                            <div class="form-group mb-0">
                                              <label for="txtNombreProducto" class="col-form-label col-form-label-sm">Nombre:</label>
                                              <input type="text" class="form-control form-control-sm model" readonly id="txtNombreProducto" name="Nombre">
                                            </div>
                                          </div>
                                          <div class="col-sm-2">
                                            <div class="form-group mb-0">
                                                <label for="btnBuscarTienda" class="col-form-label col-form-label-sm invisible">Buscar:</label>
                                                <button id="btnBuscarProducto" type="button" class="btn btn-sm btn-secondary btn-block">Buscar</button>
                                            </div>
                                          </div>
                                          <div class="col-sm-2">
                                            <div class="form-group mb-0">
                                              <label for="txtCantidadProducto" class="col-form-label col-form-label-sm">Cantidad:</label>
                                              <input type="text" class="form-control form-control-sm model" id="txtCantidadProducto" name="Cantidad" value="0">
                                            </div>
                                          </div>
                                          <div class="col-sm-2">
                                            <div class="form-group mb-0">
                                              <label for="txtPrecioCompraProducto" class="col-form-label col-form-label-sm">Precio Compra:</label>
                                              <input type="text" class="form-control form-control-sm model" id="txtPrecioCompraProducto" name="PrecioCompra" value="0">
                                            </div>
                                          </div>
                                          <div class="col-sm-2">
                                            <div class="form-group mb-0">
                                              <label for="txtPrecioVentaProducto" class="col-form-label col-form-label-sm">Precio Venta:</label>
                                              <input type="text" class="form-control form-control-sm model" id="txtPrecioVentaProducto" name="PrecioVenta" value="0">
                                            </div>
                                          </div>
                                      </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                       <div class="row mt-2">
                           <div class="col-sm-12">
                               <div class="float-right">
                                    <button id="btnAgregarCompra" class="btn btn-primary btn-sm float-right" ><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar a compra
                                    </button>
                                </div>
                           </div>
                           
                       </div>

                      <hr />
                        <div class="row mt-3">
                            <div class="col-sm-12">
                                <div class="table-responsive-sm">
                                    <table id="tbCompra" class="table table-striped table-bordered nowrap table-sm" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Ruc Proveedor</th>
                                                <th>Ruc Tienda</th>
                                                <th>Codigo Producto</th>
                                                <th>Cantidad</th>
                                                <th>Precio Compra</th>
                                                <th>Precio Venta</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>

                                </div>
                                
                            </div>
                        </div>
                  </div>
                  <div class="card-footer">
                      <div class="float-right">
                          <button id="btnTerminarGuardarCompra" class="btn btn-success btn-sm float-right"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Terminar y Guardar Compra
                          </button>
                      </div>
                  </div>
                </div>
            </div>
    </div>

    <div class="modal fade" id="modalProveedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Proveedores</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="table-responsive">
                  <table id="tbProveedor" class="table table-striped table-bordered nowrap compact">
                    <thead>
                      <tr>
                          <th></th>
                          <th>RUC</th>
                          <th>Razon Social</th>
                          <th>Direccion</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
              </div>
                
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="modalTienda" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Tiendas</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="table-responsive">
                  <table id="tbTienda" class="table table-striped table-bordered nowrap compact">
                    <thead>
                      <tr>
                          <th></th>
                          <th>RUC</th>
                          <th>Razón Social</th>
                          <th>Direccion</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
              </div>
                
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="modalProducto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Productos</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="table-responsive">
                  <table id="tbProducto" class="table table-striped table-bordered nowrap compact">
                    <thead>
                      <tr>
                          <th></th>
                          <th>Codigo</th>
                          <th>Nombre</th>
                          <th>Descripcion</th>
                          <th>Categoria</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
              </div>
                
          </div>
        </div>
      </div>
    </div>
<%--    <script src="Controlador/frmRegistrarCompra/frmRegistrarCompra.js"></script>--%>




</asp:Content>
