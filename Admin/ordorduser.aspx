<%@ Page Title="Detalle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ordorduser.aspx.cs" Inherits="ShopGaspar.Admin.ordorduser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DE LA ORDEN N°</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvordord" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true">
        </asp:GridView>
    </div>
</asp:Content>
