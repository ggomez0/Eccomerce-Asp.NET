<%@ Page Title="Pedido de reposicion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="lstcompradet.aspx.cs" Inherits="ShopGaspar.Admin.lstcompradet" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container">
                       <asp:FormView ID="pedidoid" runat="server" ItemType="ShopGaspar.Models.pedrepo" SelectMethod ="GetPedido" RenderOuterTable="false" >
                            <ItemTemplate>
                                <div>
                                    <h1>Detalle de pedido N° <%#:Item.idcomp %></h1>
                                </div>
                                <br />
                                   <tr>
                                       <td>
                  
                                           <span>Fecha: <%#Item.dateTime %></span>
                                        </td>
                                    </tr>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>

                      <asp:Button ID="Button5" CssClass="btn btn-success rounded-3"  runat="server" Text="Agregar Productos" ValidationGroup="VG99" />
                                    <!-- ModalPopupExtender -->
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server"
                                        PopupControlID="Panel21" TargetControlID="Button5" CancelControlID="Button7"
                                        BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel21" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:black;" >
                                        <div style="padding:20px">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                   
                                                    <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black">Productos</asp:Label>
         <h3>Seleccione los productos para agregarlos al pedido</h3>
        
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
                                        PopupControlID="Panel22123123" TargetControlID="Button5" CancelControlID="Button7"
                                        BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel22123123" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:black;" >
                                        <div style="padding:20px">
                                           
                                                    <h3>Agregar Producto al pedido</h3>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Text="Cantidad: " runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtcantpedido" TextMode="Number" CssClass="rounded-3"/>
                                                                   
                                                            </td>
                                                           
                                                       
                                                        </tr>
                                                           <tr>
                                                            <td>
                                                                <asp:label runat="server">
                                                                   Proveedor:</asp:label>
                                                            </td>
                                                            <td>
                                                                <asp:dropdownlist id="ddlistprovprod"
                                                                    runat="server" itemtype="shopgaspar.models.proveedores"
                                                                    selectmethod="getproveedores"
                                                                    datatextfield="provname"
                                                                    datavaluefield="provid">
                                                                </asp:dropdownlist>
                                                            </td>
                                                        </tr>

                                                    </table>


                                        </div>
                                          <asp:Button ID="btnupdateinsert"
                                            runat="server" Font-Size="Large" Font-Bold="true"
                                            Text="Agregar"
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


                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                              <asp:Button ID="Button7" CssClass="btn btn-danger rounded-3" runat="server" Text="Cerrar" ValidationGroup="VG101" />
                                        <br />
                                        <p>  </p>
                                        <p></p>
                                    </asp:Panel>
      
        
          <p></p>
         <p></p>




        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvlstcompradet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" 
            DataKeyNames="ID"  OnRowDeleting="gvlstcompradet_RowDeleting">
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
