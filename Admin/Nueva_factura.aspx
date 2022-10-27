<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nueva_factura.aspx.cs" Inherits="ShopGaspar.Admin.Nueva_factura" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <h3>Realizar movimientos de stock</h3>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" Text="ID Factura: "></asp:Label>
                                                  </td><td>
                                                      <asp:TextBox runat="server" Enabled="false" ID="txtidfact"></asp:TextBox>
                                                      </td></tr>
                                                    <tr>
                                                        <td>
                                                   
                                                            <asp:Label Font-Bold="true" runat="server">Deposito:</asp:Label>
                                                   </td><td>
                                                            <asp:DropDownList ID="ddlistdep" runat="server"
                                                                ItemType="ShopGaspar.Models.depositos"
                                                                SelectMethod="GetDepositos" DataTextField="DepName"
                                                                DataValueField="DepID">
                                                            </asp:DropDownList>
                                                       </td>
                                                        </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" Text="Observaciones: " Font-Bold="true"></asp:Label>
                                                            </td> <td>
                                                             <asp:TextBox ID="txtobsmov" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ValidationGroup="VG21"
                                                                ID="RequiredFieldValidator10" runat="server"
                                                                Text="* Observaciones requerida."
                                                                ControlToValidate="txtobsmov" SetFocusOnError="true"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                            </td>
        
                                                        </tr>
                                                        </table>
                                        

<asp:Button runat="server" ID="btnagregarprodfact" Text="+ Producto" CssClass="btn btn-success" />
                                             


                        <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="Panel21"
                            TargetControlID="btnagregarprodfact" CancelControlID="btncerrarprodfact" BackgroundCssClass="modalBackground">
                        </cc1:ModalPopupExtender>
                        <asp:Panel ID="Panel21" runat="server" CssClass="modalPopup" align="center"
                            Style="background-color:white; border:solid; border-color:black;">
                            <div style="padding:20px">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
         <h3>Seleccione los productos</h3>
        
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" 
            ID="gvproductoslista" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" DataKeyNames="ID" OnRowUpdating="gvproductoslista_RowUpdating">
            <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    
                      <asp:Button ID="Button5" CssClass="btn btn-success rounded-3"  runat="server" Text="+" CommandName="Update"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                    <asp:TextBox ID="txtcantpedido" runat="server" TextMode="Number" Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                </div>
                            
                                                        <asp:Button ID="btncerrarprodfact"
                                                            CssClass="btn btn-danger rounded-3" runat="server"
                                                            Text="Cerrar" ValidationGroup="VG107" />
                        </asp:Panel>

        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" 
            ID="gvprodfact" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" OnRowDeleting="gvprodfact_RowDeleting" DataKeyNames="idcomprdet">
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White"  /> 
            <Columns>
                <asp:TemplateField HeaderText="#">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("idcomprdet") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
             
                <asp:TemplateField HeaderText="Producto">
                    <ItemTemplate>
                        <asp:Label ID="lblprodmov"  Text='<%# Eval("ProductName") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:Label ID="lblcantmov" Text='<%# Eval("cantidad") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ImageUrl="~/Images/delete.png" Height="30px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


            <asp:Button ID="btnguardarfact" OnClick="btnguardarfact_Click"  CssClass="btn btn-info rounded-3" runat="server"  Text="Guardar Factura"/>
        </div>

    <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label>
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>









          <!-- ModalPopupExtender --->
                                    <%--<cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                        PopupControlID="Panel111" TargetControlID="Button8factopen"
                                        CancelControlID="Button8fact" BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel111" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:black;">
                                        <div style="padding:20px; max-height: 500px; overflow:auto; ">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <h3>Nueva Factura</h3>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label runat="server" Text="N° Factura:">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblnumidfact" runat="server"></asp:Label>
                                                                <asp:TextBox ID="txtnumfact" style="width:60%"
                                                                    runat="server" TextMode="Number"
                                                                    CausesValidation="true">
                                                                </asp:TextBox>
                                                                <asp:RequiredFieldValidator
                                                                    ID="RequiredFieldValidator14" runat="server"
                                                                    Text="* campo requerido."
                                                                    ControlToValidate="txtnumfact"
                                                                    ValidationGroup="VG2481" SetFocusOnError="true"
                                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                                <asp:CompareValidator ID="CompareValidator1"
                                                                    runat="server" ControlToValidate="txtnumfact"
                                                                    ErrorMessage="Debe ser &gt; 0"
                                                                    Operator="GreaterThan" Type="Integer"
                                                                    ValueToCompare="0" ValidationGroup="VG2481" />
                                                            </td>


                                                            <td>
                                                                <asp:Label runat="server" Text="N° Sucursal:">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtsucursal" runat="server"
                                                                    TextMode="Number" style="width:60%"
                                                                    CausesValidation="true">
                                                                </asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                                    runat="server" Text="* campo requerido."
                                                                    ControlToValidate="txtsucursal"
                                                                    ValidationGroup="VG2481" SetFocusOnError="true"
                                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                                <asp:CompareValidator ID="CompareValidator2"
                                                                    runat="server" ControlToValidate="txtsucursal"
                                                                    ErrorMessage="Debe ser &gt; 0"
                                                                    Operator="GreaterThan" Type="Integer"
                                                                    ValueToCompare="0" ValidationGroup="VG2481" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label runat="server">
                                                                    Proveedor:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlistfact" style="width:60%"
                                                                    runat="server"
                                                                    ItemType="ShopGaspar.Models.proveedores"
                                                                    SelectMethod="GetProveedores"
                                                                    DataTextField="ProvName" DataValueField="ProvID">
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td>
                                                                <asp:Label runat="server" Text="Tipo:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="txttipo" runat="server"
                                                                    style="width:60%">
                                                                    <asp:ListItem Text="A"></asp:ListItem>
                                                                    <asp:ListItem Text="B"></asp:ListItem>
                                                                    <asp:ListItem Text="C"></asp:ListItem>
                                                                </asp:DropDownList>

                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <asp:Label runat="server" Text="Fecha factura:">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" TextMode="Date"
                                                                    style="width:60%" ID="txtcalendar"> </asp:TextBox>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                    <p></p>

                                                    <h3>Productos</h3>

                                                    <p></p>


                                                    <asp:Button ID="btnopenprodfact"
                                                        CssClass="btn btn-success rounded-3" runat="server"
                                                        Text="+ Producto" />
                                                    <!-- ModalPopupExtender --->
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender4" runat="server"
                                                        PopupControlID="Panel1555" TargetControlID="btnopenprodfact"
                                                        CancelControlID="btncloseprodfact"
                                                        BackgroundCssClass="modalBackground">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Panel ID="Panel1555" runat="server" CssClass="modalPopup"
                                                        align="center"
                                                        Style="background-color:white; border:solid; border-color:black;">
                                                        <div style="padding:20px; max-height: 500px; overflow:auto; ">
                                                            <asp:UpdatePanel runat="server">
                                                                <ContentTemplate>





                                                                    <asp:GridView runat="server" CssClass="grid"
                                                                        BorderStyle="None" ID="gvproductosfact"
                                                                        ShowHeaderWhenEmpty="true"
                                                                        AutoGenerateColumns="false" DataKeyNames="ID">
                                                                        <HeaderStyle BackColor="black" Font-Bold="True"
                                                                            ForeColor="White" />
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="checkboxprodfact"
                                                                                        runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="#">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblidprod"
                                                                                        Text='<%# Eval("ID") %>'
                                                                                        runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Producto">
                                                                                <ItemTemplate>
                                                                                    <asp:Label
                                                                                        Text='<%# Eval("Producto") %>'
                                                                                        runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Descripcion">
                                                                                <ItemTemplate>
                                                                                    <asp:Label
                                                                                        Text='<%# Eval("Descripcion") %>'
                                                                                        runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Precio">
                                                                                <ItemTemplate>
                                                                                    <asp:Label
                                                                                        Text='<%#:String.Format("{0:c}", Eval("Precio"))%>'
                                                                                        runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Categoria">
                                                                                <ItemTemplate>
                                                                                    <asp:Label
                                                                                        Text='<%# Eval("CategoryID") %>'
                                                                                        runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Stock">
                                                                                <ItemTemplate>
                                                                                    <asp:Label
                                                                                        Text='<%# Eval("Stock") %>'
                                                                                        runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Cant.">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox runat="server"
                                                                                        Width="60px" ID="txtcantlstfact"
                                                                                        TextMode="Number"
                                                                                        CssClass="rounded-3"
                                                                                        CausesValidation="true" />
                                                                                    <asp:CompareValidator runat="server"
                                                                                        ControlToValidate="txtcantlstfact"
                                                                                        ErrorMessage="Debe ser &gt; 0"
                                                                                        Operator="GreaterThan"
                                                                                        Type="Integer"
                                                                                        ValueToCompare="0"
                                                                                        ValidationGroup="VG2481" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>

                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                        <asp:Button ID="btnagregarprod" runat="server" Text="Agregar"
                                                            CssClass="btn btn-success rounded-3" />
                                                        <asp:Button ID="btncloseprodfact"
                                                            CssClass="btn btn-danger rounded-3" runat="server"
                                                            Text="Cerrar" />
                                                        <br />
                                                        <p> </p>
                                                        <p></p>
                                                    </asp:Panel>--%>
    </div>
</asp:Content>
