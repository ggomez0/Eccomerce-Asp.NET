<%@ Page Title="Recuperar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="passrecov.aspx.cs" Inherits="ShopGaspar.Account.passrecov" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:TextBox ID="txtEmail" runat="server" Width = "250" />
        <br />
        <asp:Label ID="lblMessage" runat="server" />
        <br />
        <asp:Button Text="Send" runat="server" OnClick="SendEmail" />
     </div>
</asp:Content>
