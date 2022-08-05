<%@ Page Title="Orden" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="orderdetailsuser.aspx.cs" Inherits="ShopGaspar.Account.orderdetailsuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
    <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DE LA ORDEN N°</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvorderid" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true">
       
            
        </asp:GridView>
    </div>
  
</asp:Content>