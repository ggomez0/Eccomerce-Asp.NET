    <%@ Page Title="Bienvenido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ShopGaspar._Default" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" >
                    <style>
                        .game-board {
                    display: grid;
                    grid-template-rows: 15em 15em;
                    grid-template-columns: 15em 15em 15em 15em;
                    grid-gap:1em;
                }


                    </style>
                <div class="game-board" style="margin-left:18%;">
                    <a class="btn btn-dark rounded-3" href="CategoriaAdmin.aspx" runat="server" >
                        <p></p>
                        <asp:Image ImageUrl="~/Images/categorias7.png" runat="server" Height="130px" />
                        <p></p>
                     <span>Categoria</span>
                    </a>
                    <a class="btn btn-dark rounded-3" href="ProductosAdmin.aspx" runat="server">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/productos7.png" runat="server" Height="130px" />
                        <p></p>
                    <span>Productos</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="~/Admin/DepositosAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/deposito7.png" runat="server" Height="130px" />  
                        <p></p>

                        <span>Depositos</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="IngEgrAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/ingreso-egreso7.png" runat="server" Height="130px" />
                        <p></p>
                        <span>Stock</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="~/Admin/ComprasAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/compras7.png" runat="server" Height="130px" />
                        <p></p>
                        <span>Compras</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="~/Admin/TransaccionesAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/transa7.png" runat="server" Height="130px" />
                        <p></p>
                        <span>Transacciones</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="~/Admin/ClientesAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/clientes7.png" runat="server" Height="130px" />
                        <p></p>
                        <span>Clientes</span>
                    </a>
                   <%-- <a class="btn btn-dark rounded-3" runat="server" href="EstadisticasAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/estadisticas7.png" runat="server" Height="100px" />
                        <p> </p>
                    <span>Estadisticas</span>
                    </a>--%>
                    <a class="btn btn-dark rounded-3" runat="server" href="Reportes.aspx">
                        <p></p>
                        <asp:Image runat="server" Height="130px" ImageUrl="~/Images/reportes7.png" />
                        <p></p>
                    <span >Reportes</span>
                    </a>
                 <%--   <a class="btn btn-dark rounded-3">
                        <asp:Image  runat="server" Height="100px" />
                    <span></span>
                    </a>
                   --%>



      
               


                
                </div>



</asp:Content>
