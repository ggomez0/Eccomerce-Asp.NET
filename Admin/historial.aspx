<%@ Page Title="Historial" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="historial.aspx.cs" Inherits="ShopGaspar.Admin.historial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black">Historial de transacciones</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvhistorial" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true">
             <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        
        </asp:GridView>
    </div>
</asp:Content>
