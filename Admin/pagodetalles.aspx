<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pagodetalles.aspx.cs" Inherits="ShopGaspar.Admin.pagodetalles" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
          <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DEL PAGO N°</asp:Label>
<p></p>
                       



        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvfactdet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" >
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White"  />
            </asp:GridView>
    </div>
</asp:Content>
