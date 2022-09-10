<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detprodcat.aspx.cs" Inherits="ShopGaspar.Admin.detprodcat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblcatprod">Los productos con categoria N°</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvdetprodcat" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true"> <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        
        </asp:GridView>
    </div>
</asp:Content>
