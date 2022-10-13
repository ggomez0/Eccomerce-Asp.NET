<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="prodendep.aspx.cs" Inherits="ShopGaspar.Admin.prodendep" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <asp:FormView ID="pedidoid" runat="server" ItemType="ShopGaspar.Models.depositos" SelectMethod ="GetDeposito" RenderOuterTable="false" >
                            <ItemTemplate>
                                <div>
                                    <h1>Detalle del deposito N° <%#:Item.DepID %></h1>
                                </div>
                                <br />
                                   <tr>
                                       <td>
                  
                                           <span style="font-size:1.3em">Nombre: <%#Item.DepName %></span><br />
                                           <span style="font-size:1.3em">Descripcion: <%#Item.Description %></span><br />
                                           <span style="font-size:1.3em">Ubicacion: <%#Item.ubicacion %></span><br />
                                        </td>
                                    </tr>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvprodendep" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true"> <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        
        </asp:GridView>
    </div>
</asp:Content>
