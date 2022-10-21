<%@ Page Title="Pagos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PagoComprobantes.aspx.cs" Inherits="ShopGaspar.Admin.PagoComprobantes" EnableEventValidation="false" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
          <p></p>  
                 <h3>Pago de Facturas</h3>
         <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label>
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
          <asp:Button ID="Button5" CssClass="btn btn-success rounded-3"  runat="server" Text="Realizar Pago" ValidationGroup="VG99" />
                                    <!-- ModalPopupExtender -->
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server"
                                        PopupControlID="Panel21" TargetControlID="Button5" CancelControlID="Button7"
                                        BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel21" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:black; overflow:auto; height:600px; width:1000px" >
                                        <div style="padding:20px">
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <h3>Realizar Pago</h3>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                               <asp:Label runat="server" Text="Proveedor: "/>
                                                            </td>
                                                            <td style="padding-right:30px">
                                                               <asp:DropDownList ID="ddlistpr" runat="server"
                                                                ItemType="ShopGaspar.Models.proveedores"
                                                                SelectMethod="GetProveedores" DataTextField="ProvName"
                                                                DataValueField="ProvID">
                                                            </asp:DropDownList>
                                                            </td>
                                                            
                                                            <td>
                                                               <asp:Label runat="server" Text="Metodo de Pago: "/>
                                                                </td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="ddlisttrans">
                                                                    
                                                                  <asp:ListItem>Transferencia</asp:ListItem>
                                                                    <asp:ListItem>Efectivo</asp:ListItem>
                                                                    <asp:ListItem>Cheque</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="padding-left:30px">
                                                                <asp:Label runat="server" Text="Fecha"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" TextMode="Date" ID="txtcalendarpago"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                     <%--   <tr>
                                                            <td>
                                                               <asp:Label runat="server" Text="Nombre: "/>
                                                            </td>
                                                            <td>
                                                                <asp:Textbox runat="server" Enabled="false"></asp:Textbox>
                                                            </td>
                                                            <td>
                                                               <asp:Label runat="server" Text="Representante: "/>
                                                            </td>
                                                            <td>
                                                                <asp:Textbox runat="server" Enabled="false"></asp:Textbox>

                                                            </td>
                                                            <td style="padding-left:30px">
                                                             
                                                               <asp:Label runat="server" Text="Email: "/>
                                                            </td>
                                                            <td>
                                                               <asp:Textbox runat="server" Enabled="false"></asp:Textbox>

                                                            </td>
                                                        </tr>--%>
                                                        

                                                    </table>
                                                    <p></p>

                                                   


                                             

                                                      <asp:GridView ID="gvpagofact" runat="server" CssClass="grid" 
                                                            ShowHeaderWhenEmpty="true" class="table thead-dark" AutoGenerateColumns="false"
                                                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="idcomp"
                                                            CellPadding="3">
                                                         <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
                                                             <Columns>
                                                                <asp:TemplateField>
                                                                     <ItemTemplate>
                                                                         <asp:CheckBox runat="server" ID="checkboxpagado"/>
                                                                     </ItemTemplate>
                                                                     
                                                                 </asp:TemplateField>
                                                                  <asp:TemplateField HeaderText="#BDD">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblidfact" Text='<%# Eval("idcomp") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                              <asp:TemplateField HeaderText="#Fact">
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
                                                                <asp:Label Text='<%# Eval("ProvID") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%#:String.Format("{0:c}", Eval("importe"))%>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                          
                                            
                                       
                                                                                                    
                                                                              
                                        </Columns>


                                                         </asp:GridView>
                                                     
                                                     </ContentTemplate>

                                            </asp:UpdatePanel>
                                        </div>
                                        <asp:Button ID="btnagregarfact" runat="server" Text="Agregar" OnClick="btnagregarfact_Click"       
                                                                     CssClass="btn btn-success rounded-3" />
                                        <asp:Button ID="Button7" CssClass="btn btn-danger rounded-3" runat="server" Text="Cerrar"/>
                                    
                                      
                                         </asp:Panel>

                        <asp:GridView ID="gvfactpag" runat="server" CssClass="grid" 
                                                            ShowHeaderWhenEmpty="true" class="table thead-dark" AutoGenerateColumns="false"
                                                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                                            CellPadding="3">
                                                         <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />

                            <Columns>
                                 <asp:TemplateField HeaderText="#">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblidfactpag" Text='<%# Eval("idcomp") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Estado">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("stringn") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Proveedor">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("descripcion") %>'
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
                                 <asp:TemplateField HeaderText="Opciones">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="btnverfactpago" OnClick="btnverfactpago_Click2" ImageUrl="~/Images/lupa.png" CommandArgument='<%#Eval("idcomp") %>' Height="20px" />
                                                                </ItemTemplate>
                                                        </asp:TemplateField>
                            </Columns>
                            </asp:GridView>



                                                  </div>

    
</asp:Content>
