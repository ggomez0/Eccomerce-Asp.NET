<%@ Page Title="Detalle Factura" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Admin/factdet.aspx.cs" Inherits="ShopGaspar.Admin.factdet" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="container">
           <asp:FormView ID="factid" runat="server" ItemType="ShopGaspar.Models.comprobantes" SelectMethod ="GetFactura" RenderOuterTable="false" >
                            <ItemTemplate>
                                <div>
                                    <h1>Detalle de la factura N° <%#:Item.idcomp %></h1>
                                </div>
                                <br />
                                   <tr>
                                       <td>
                                           
                                           <span style="font-size:1em">N° Factura: <%#Item.stringn %></span><br />
                                           <span style="font-size:1em">N° Sucursal: <%#Item.descripcion %></span><br />
                                           <span style="font-size:1em">Fecha: <%#Item.fechacomprobante %></span><br />
                                           <span style="font-size:1em">Total: <%#:String.Format("{0:c}", Item.importe) %></span><br />
                                        </td>
                                    </tr>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                       



        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvlstcompradet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" 
            DataKeyNames="idcomprdet"  OnRowDeleting="gvlstcompradet_RowDeleting">
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White"  />
        <Columns>
            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("idcomprdet") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Producto">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("ProductName") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cantidad">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("cantidad") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Precio">
                                                <ItemTemplate>
                                                    <asp:Label Text=<%#:String.Format("{0:c}", Eval("precio"))%> runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Categoria">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("CategoryName") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total">
                                                <ItemTemplate>
                                                    <asp:Label Text=<%#:String.Format("{0:c}", Eval("Total"))%> runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
            <%--<asp:TemplateField>
                <ItemTemplate>

                    <asp:ImageButton ImageUrl="~/Images/delete.png"
                        runat="server" CommandName="Delete"
                        ValidationGroup="Vagosdep" ToolTip="Eliminar"
                        Width="30px" Height="30px" />
                </ItemTemplate>
            </asp:TemplateField>--%>
        </Columns>
        </asp:GridView>


         <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label>
         <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
         <asp:Label runat="server" ID="lblinvisible" Visible="false"></asp:Label>


    </div>
</asp:Content>
