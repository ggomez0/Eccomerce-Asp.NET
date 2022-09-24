<%@ Page Title="Detalles Orden de compra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ordcpradet.aspx.cs" Inherits="ShopGaspar.Admin.ordcpradet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DE LA ORDEN N°</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvordcpradet" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true">
             <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        
        </asp:GridView>
    </div>
</asp:Content>
