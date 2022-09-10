<%@ Page Title="Orden" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gvordenesusuarios.aspx.cs" Inherits="ShopGaspar.Admin.gvordenesusuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">ORDENES REALIZADAS POR EL USUARIO </asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvordenesusuario" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false"> <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("OrderId") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("OrderDate") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("FirstName") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Direccion">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Address") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Phone") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Email") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Detalles">
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/lupa.png" ID="imgbtn1" runat="server"  CommandArgument='<%#Eval("OrderId") %>' OnClick="imgbtn1_Click" Width="20px" Height="20px"/>
                        </ItemTemplate>
                </asp:TemplateField>


        </Columns>

        </asp:GridView>
    </div>
</asp:Content>
