<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ordcpraborrdet.aspx.cs" Inherits="ShopGaspar.Admin.ordcpraborrdet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <p></p>
        <p></p>
                <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DE LA ORDEN BORRADOR N°</asp:Label>
        
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvordcpraborrdet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true"> 
            <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        
            </asp:GridView>
    </div>
</asp:Content>
