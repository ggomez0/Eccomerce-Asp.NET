<%@ Page Title="Movimiento" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nuevo_Movimiento.aspx.cs" Inherits="ShopGaspar.Admin.Nuevo_Movimiento" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
     <h3>Realizar movimientos de stock</h3>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" Text="ID Movimiento: "></asp:Label>
                                                  </td><td>
                                                      <asp:TextBox runat="server" Enabled="false" ID="txtidmov"></asp:TextBox>
                                                      </td></tr><tr><td> 
                                                      </td><td>
                                                            <asp:RadioButtonList ID="rblistlist" runat="server">
                                                                
                                                                <asp:ListItem>Ingreso</asp:ListItem>
                                                                <asp:ListItem>Egreso</asp:ListItem>

                                                            </asp:RadioButtonList>
                                                            </td>
                                                        </tr>
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
                                        

<asp:Button runat="server" ID="btnagregarprodmov" Text="+ Producto" CssClass="btn btn-success" />
                                             


                        <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="Panel21"
                            TargetControlID="btnagregarprodmov" CancelControlID="btncerrarprodmov" BackgroundCssClass="modalBackground">
                        </cc1:ModalPopupExtender>
                        <asp:Panel ID="Panel21" runat="server" CssClass="modalPopup" align="center"
                            Style="background-color:white; border:solid; border-color:black;">
                            <div style="padding:20px">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
         <h3>Seleccione los productos</h3>
        
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" 
            ID="gvproductoslista" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" DataKeyNames="ID" 
             OnRowUpdating="gvproductoslista_RowUpdating">
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
                            
                                                        <asp:Button ID="btncerrarprodmov"
                                                            CssClass="btn btn-danger rounded-3" runat="server"
                                                            Text="Cerrar" ValidationGroup="VG107" />
                        </asp:Panel>

        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" 
            ID="gvprodmov" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" OnRowDeleting="gvprodmov_RowDeleting" DataKeyNames="idcomprdet">
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White"  /> 
            <Columns>
                  <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button Text="-" CssClass="btn btn-danger rounded-3"  runat="server" ImageUrl="~/Images/delete.png" Font-Size="Large" CommandName="Delete" ToolTip="Eliminar" ValidationGroup="ELIM_PROD_MOV"/>
                    </ItemTemplate>
                </asp:TemplateField>
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
              
            </Columns>
        </asp:GridView>


            <asp:Button ID="btnguardarmov" OnClick="btnguardarmov_Click"  CssClass="btn btn-info rounded-3" runat="server"  Text="Guardar movimiento"/>
        </div>

    <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label>
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>
