<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pagodetalles.aspx.cs" Inherits="ShopGaspar.Admin.pagodetalles" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
           <asp:FormView ID="pagoID" runat="server" ItemType="ShopGaspar.Models.comprobantes" SelectMethod ="GetPago" RenderOuterTable="false" >
                            <ItemTemplate>
                                <div>
                                    <h1>Detalle del pago N° <%#:Item.idcomp %></h1>
                                </div>
                                <br />
                                   <tr>
                                       <td>
                                           <span style="font-size:1em">Fecha: <%#Item.fechacomprobante %></span><br />
                                           <span style="font-size:1em">Total: <%#:String.Format("{0:c}", Eval("importe"))%></span><br />
                                        </td>
                                    </tr>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                       



        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvfactdet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" >
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White"  />
           
         <Columns>

                                              <asp:TemplateField HeaderText="ID">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("descripcion") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sucursal">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("stringn") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tipo de factura">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("Nombre") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Fecha">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("fechacomprobante") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Proveedor">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("ProvName") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total">
                                                            <ItemTemplate>
                                                                <asp:Label Text=<%#:String.Format("{0:c}", Eval("importe"))%>
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
             </Columns>
            </asp:GridView>

      
    </div>
</asp:Content>
