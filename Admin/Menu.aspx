    <%@ Page Title="Bienvenido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ShopGaspar._Default" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" >
                    <style>
                        .game-board {
                    display: grid;
                    grid-template-rows: 12.5em 12.5em ;
                    grid-template-columns: 12.5em 12.5em 12.5em 12.5em 12.5em 12.5em;
                    grid-gap:1em;
                }

            
                .box {
                  background: #060606;
                  border: 1px solid #555;
                  border-radius:20px;
                  display: flex;
                  align-items: center;
                  justify-content: center;
                  color: #AAA;           
                  padding:10px;
                  border-inline:hidden;
                }

                .button64{background-color:#060606; height:12em; width:12em; border-inline:hidden}
                    </style>
                 <h1 style="text-align:center;">Administracion</h1>
                <div class="game-board container">
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" ID="btncat" OnClick="btncat_Click" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Productos" ID="btnprod" OnClick="btnprod_Click" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Depositos" ID="btndep" OnClick="btndep_Click" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Ingreso / Egreso" ID="btningegr" OnClick="btningegr_Click" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Compras" ID="btncompras" OnClick="btncompras_Click" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Transacciones" ID="btntrans" OnClick="btntrans_Click" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Clientes" ID="btnclientes" OnClick="btnclientes_Click" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Estadisticas" ID="btnestadi" OnClick="btnestadi_Click" />
                    <asp:Button runat="server" CssClass="button64 box" Text="XXXX" />
                    <asp:Button runat="server" CssClass="button64 box" Text="XXXX" />
                    <asp:Button runat="server" CssClass="button64 box" Text="XXXX" />
                    <asp:Button runat="server" CssClass="button64 box" Text="XXXX" />

               


                
                </div>


</asp:Content>
