<%@ Page Title="Gracias x la compra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutComplete.aspx.cs" Inherits="ShopGaspar.Checkout.CheckoutComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div style="text-align:center;">
    <h1>Pago Realizado</h1>
    <p></p>
    <h3>Numero de Transaccion:</h3> <asp:Label Font-Size="2em" ID="ordencompra" runat="server"></asp:Label>
    <p></p>
    <h3>Gracias por la compra!</h3>     
    <asp:Button class="btn btn-success" ID="Continue" runat="server" Text="Volver al Inicio" OnClick="Continue_Click" />
       </div>
</asp:Content>