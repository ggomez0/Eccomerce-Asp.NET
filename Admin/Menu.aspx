    <%@ Page Title="Bienvenido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ShopGaspar._Default" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" >
                    <style>
                        .game-board {
                    display: grid;
                    grid-template-rows: 12.5em 12.5em ;
                    grid-template-columns: 12.5em 12.5em 12.5em 12.5em 12.5em 12.5em;
                    grid-gap:1em;
                }


                    </style>
                <div class="game-board container">
                    <a class="btn btn-dark rounded-3" href="CategoriaAdmin.aspx" runat="server" >
                        <p></p>
                        <asp:Image ImageUrl="~/Images/categories.png" runat="server" Height="100px" />
                        <p></p>
                     <span>Categoria</span>
                    </a>
                    <a class="btn btn-dark rounded-3" href="ProductosAdmin.aspx" runat="server">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/productos2010.png" runat="server" Height="100px" />
                        <p></p>
                    <span>Productos</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="~/Admin/DepositosAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/deposito2010.png" runat="server" Height="100px" />  
                        <p></p>

                        <span>Depositos</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="IngEgrAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/resize-7-512.png" runat="server" Height="100px" />
                        <p></p>
                        <span>Stock</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="~/Admin/ComprasAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/buy-512.png" runat="server" Height="100px" />
                        <p></p>
                        <span>Compras</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="~/Admin/TransaccionesAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/transaction.png" runat="server" Height="100px" />
                        <p></p>
                        <span>Transacciones</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="~/Admin/ClientesAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/user-512.png" runat="server" Height="100px" />
                        <p></p>
                        <span>Clientes</span>
                    </a>
                    <a class="btn btn-dark rounded-3" runat="server" href="EstadisticasAdmin.aspx">
                        <p></p>
                        <asp:Image ImageUrl="~/Images/statistics-512.png" runat="server" Height="100px" />
                        <p> </p>
                    <span>Estadisticias</span>
                    </a>
                    <a class="btn btn-dark rounded-3">
                        <asp:Image runat="server" Height="100px" />
                    <span></span>
                    </a>
                    <a class="btn btn-dark rounded-3">
                        <asp:Image  runat="server" Height="100px" />
                    <span></span>
                    </a>
                    <a class="btn btn-dark rounded-3">
                        <asp:Image  runat="server" Height="100px" />
                   <span></span>
                    </a>
                    <a class="btn btn-dark rounded-3">
                        <asp:Image runat="server" Height="100px" />
                   <span></span>
                    </a>



      
               


                
                </div>



</asp:Content>
