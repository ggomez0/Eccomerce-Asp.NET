    <%@ Page Title="Bienvenido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopGaspar._Default" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" >
                    <style>
                        .game-board {
                    display: grid;
                    grid-template-rows: 12.5em 12.5em ;
                    grid-template-columns: 12.5em 12.5em 12.5em 12.5em 12.5em;
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

                .button64{background-color:#060606; height:12em; width:12e/
                              m; border-inline:hidden}
                    </style>
                <div class="game-board container">
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Productos" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />
                    <asp:Button runat="server" CssClass="button64 box" Text="Categoria" />

               


                
                </div>


</asp:Content>
