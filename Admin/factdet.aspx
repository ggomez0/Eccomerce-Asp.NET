<%@ Page Title="Detalle Factura" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Admin/factdet.aspx.cs" Inherits="ShopGaspar.Admin.factdet" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="container">
      
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black">Productos</asp:Label>
         <h3>Seleccione los productos para agregarlos a la factura</h3>
        
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" 
            ID="gvproductoslista" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" 
            DataKeyNames="ID"     OnRowUpdating="gvproductoslista_RowUpdating">
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    
                    
                            
                 
                      <asp:Button ID="Button5" CssClass="btn btn-success rounded-3"  runat="server" Text="+" ValidationGroup="VG99" />
                                    <!-- ModalPopupExtender -->
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server"
                                        PopupControlID="Panel22" TargetControlID="Button5" CancelControlID="Button7"
                                        BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel22" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:black;" >
                                        <div style="padding:20px">
                                           
                                                    <h3>Agregar Producto a la factura</h3>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Cantidad" runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtcantlstfact" TextMode="Number" CssClass="rounded-3" />
                                                                    
                                                            </td>
                                                           
                                                       
                                                        </tr>

                                                    </table>


                                        </div>
                                          <asp:Button ID="btnupdateinsert"
                                            runat="server" Font-Size="Large" Font-Bold="true"
                                            Text="+"
                                            CommandName="Update"
                                            CausesValidation="true"
                                            ValidationGroup="VG31" CssClass="btn btn-success rounded-3" />
                                        <asp:Button ID="Button7" CssClass="btn btn-danger rounded-3" runat="server" Text="Cerrar" ValidationGroup="VG101" />
                                        <br />
                                        <p>  </p>
                                        <p></p>
                                    </asp:Panel>
                    
                  
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>
          <p></p>
         <p></p>




         <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DE LA FACTURA N°</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvlstcompradet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" 
            DataKeyNames="idcomprdet"  OnRowDeleting="gvlstcompradet_RowDeleting">
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White"  />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>

                    <asp:ImageButton ImageUrl="~/Images/delete.png"
                        runat="server" CommandName="Delete"
                        ValidationGroup="Vagosdep" ToolTip="Eliminar"
                        Width="30px" Height="30px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>


         <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label>
         <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
         <asp:Label runat="server" ID="lblinvisible" Visible="false"></asp:Label>


    </div>
</asp:Content>
