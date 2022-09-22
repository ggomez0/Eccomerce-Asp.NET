<%@ Page Title="Estadisticas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EstadisticasAdmin.aspx.cs" Inherits="ShopGaspar.Admin.EstadisticasAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
        <div class="container">
            <asp:GridView ID="gvstat" BorderStyle="None" runat="server"
                CssClass="grid" ShowHeaderWhenEmpty="true"
                AutoGenerateColumns="true">
                <HeaderStyle BackColor="black" Font-Bold="True"
                            ForeColor="White"  />

            </asp:GridView>
        </div>
    
</asp:Content>
