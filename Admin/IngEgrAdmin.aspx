<%@ Page Title="Movimientos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IngEgrAdmin.aspx.cs" Inherits="ShopGaspar.Admin.IngEgrAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
            <asp:Button ID="btnmov" CssClass="btn btn-success rounded-3" runat="server"
                            Text="Realizar Movimiento" OnClick="btnmov_Click"/>
                       

        <p></p>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvhistorial" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true">
        
        
        </asp:GridView>
    </div>
</asp:Content>
