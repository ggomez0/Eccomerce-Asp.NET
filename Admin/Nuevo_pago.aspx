<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nuevo_pago.aspx.cs" Inherits="ShopGaspar.Admin.Nuevo_pago" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
     <h3>Realizar Pago de factura</h3>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" Text="ID Pago: "></asp:Label>
                                                  </td><td>
                                                      <asp:TextBox runat="server" Enabled="false" ID="txtidpago"></asp:TextBox>
                                                      </td></tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label runat="server" Text="Proveedor: " />
                                                                </td>
                                                                <td style="padding-right:30px">
                                                                    <asp:DropDownList ID="ddlistpr" runat="server"
                                                                        ItemType="ShopGaspar.Models.proveedores"
                                                                        SelectMethod="GetProveedores"
                                                                        DataTextField="ProvName"
                                                                        DataValueField="ProvID">
                                                                    </asp:DropDownList>
                                                                </td>

                                                                <td>
                                                                    <asp:Label runat="server" Text="Metodo de Pago: " />
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
                                                                    <asp:TextBox runat="server" TextMode="Date"
                                                                        ID="txtcalendarpago"></asp:TextBox>
                                                                </td>
                                                            </tr>


                                                        </table>

                                                   
                                                  
                                        

<asp:Button runat="server" ID="btnagregarfactpago" Text="+ Factura" CssClass="btn btn-success" />
                                             


                        <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="Panel21"
                            TargetControlID="btnagregarfactpago" CancelControlID="btncerrarfactpago" BackgroundCssClass="modalBackground">
                        </cc1:ModalPopupExtender>
                        <asp:Panel ID="Panel21" runat="server" CssClass="modalPopup" align="center"
                            Style="background-color:white; border:solid; border-color:black; height:650px; overflow:auto;">
                            <div style="padding:20px">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
         <h3>Seleccione las facturas</h3>
        
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" 
            ID="gvfacturas" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" DataKeyNames="ID" OnRowUpdating="gvfacturas_RowUpdating" 
             >
            <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    
                      <asp:Button ID="Button5" CssClass="btn btn-success rounded-3"  runat="server" Text="+" CommandName="Update"/>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
            </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                </div>
                            
                                                        <asp:Button ID="btncerrarfactpago"
                                                            CssClass="btn btn-danger rounded-3" runat="server"
                                                            Text="Cerrar" ValidationGroup="VG107" />
                        </asp:Panel>

        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" 
            ID="gvfactpago" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" OnRowDeleting="gvfactpago_RowDeleting" DataKeyNames="ID">
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White"  /> 
            <Columns>
              <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ImageUrl="~/Images/delete.png" Height="30px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


            <asp:Button ID="btnguardarpago" OnClick="btnguardarpago_Click"  CssClass="btn btn-info rounded-3" runat="server"  Text="Guardar Pago"/>
        </div>

    <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label>
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>