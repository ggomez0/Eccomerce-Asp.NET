<%@ Page Title="Productos de Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="proddeprov.aspx.cs" Inherits="ShopGaspar.Admin.proddeprov" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">Productos del proveedor N°</asp:Label>
         
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvprodprov" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true"
            DataKeyNames="ProductID" OnRowCommand="gvprodprov_RowCommand"
            OnRowEditing="gvprodprov_RowEditing"
            OnRowCancelingEdit="gvprodprov_RowCancelingEdit"
            OnRowUpdating="gvprodprov_RowUpdating"
            OnRowDeleting="gvprodprov_RowDeleting">
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White"  />

        
        </asp:GridView>
    </div>
</asp:Content>
