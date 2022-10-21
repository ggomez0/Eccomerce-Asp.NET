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
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Categoria" ID="btncat" OnClick="btncat_Click" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Productos" ID="btnprod" OnClick="btnprod_Click" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Depositos" ID="btndep" OnClick="btndep_Click" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Ingreso / Egreso" ID="btningegr" OnClick="btningegr_Click" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Compras" ID="btncompras" OnClick="btncompras_Click" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Transacciones" ID="btntrans" OnClick="btntrans_Click" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Clientes" ID="btnclientes" OnClick="btnclientes_Click" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Estadisticas" ID="btnestadi" OnClick="btnestadi_Click" />
<%--                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="Pago Comprobantes" ID="btnpagocomp" OnClick="btnpagocomp_Click" />--%>
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="" />
                    <asp:Button runat="server" CssClass="btn btn-dark rounded-3" Text="" />
      
               


                
                </div>



</asp:Content>
