<%@ Page Title="Ordenes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ordcprabor.aspx.cs" Inherits="ShopGaspar.Admin.ordcprabor" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
         <p></p>
        <h1>Ordenes en estado borrador</h1>
         <asp:Label ID="lblerror" runat="server"></asp:Label>
                                                        <tr>
                                                            <td>
                                                                <asp:Label runat="server">
                                                                    Pedidos:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlistpedidos" style="width:8%"
                                                                    runat="server" ItemType="ShopGaspar.Models.pedrepo"
                                                                    SelectMethod="Getpedidosrepo"
                                                                    DataTextField="idcomp"
                                                                    DataValueField="idcomp">
                                                                </asp:DropDownList>
                                                            </td>
                                                            </tr>
                                                         
                                                            

         <asp:Button ID="btnlstpasaraord" runat="server"  Text="-->"/>

                                    <!-- Extender -->
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server"
                                        PopupControlID="Panel21" TargetControlID="btnlstpasaraord" CancelControlID="Button745"
                                        BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel21" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:black;" >
                                        <div style="padding:20px">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                        <span>Desea enviar este pedido de reposicion a ordenes de compra?</span>        
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <asp:Button ID="btnagregarprov" runat="server" Text="Enviar" OnClick="btnlstpasaraord_Click1"    
                                                                     CssClass="btn btn-success rounded-3" CausesValidation="true"
                                                                     />
                                        <asp:Button ID="Button745" CssClass="btn btn-danger rounded-3" runat="server" Text="Cerrar" ValidationGroup="VG10122" />
                                        <br />
                                        <p>  </p>
                                        <p></p>
                                    </asp:Panel>


        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvordcprarec" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" OnRowUpdating="gvordcprarec_RowUpdating" DataKeyNames="ID, ProvID"> 
            <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Ver" CssClass="btn btn-success rounded-3" ID="btnvermasordcpraenv" CommandName="Update"   OnClick="btnvermasordcpraenv_Click" 
                            CommandArgument='<%#Eval("ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

       
    </div>
</asp:Content>
