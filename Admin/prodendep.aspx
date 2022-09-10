<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="prodendep.aspx.cs" Inherits="ShopGaspar.Admin.prodendep" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblprodendep">DETALLE DEL DEPOSITO N°</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvprodendep" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true"> <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        
        </asp:GridView>
    </div>
</asp:Content>
