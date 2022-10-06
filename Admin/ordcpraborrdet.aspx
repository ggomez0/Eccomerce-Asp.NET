﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ordcpraborrdet.aspx.cs" Inherits="ShopGaspar.Admin.ordcpraborrdet" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <p></p>
        <p></p>
                <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DE LA ORDEN BORRADOR N°</asp:Label>
        <p>        </p>
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Forma de pago:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlistformadepago">
                        <asp:ListItem>Forma de pago 1</asp:ListItem>
                        <asp:ListItem>Forma de pago 2</asp:ListItem>
                        <asp:ListItem>Forma de pago 3</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <p></p>

        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvordcpraborrdet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true"> 
            <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
            <Columns>
                  <asp:TemplateField HeaderStyle-Width="10px">
                                                            <ItemTemplate>
                                                                    <asp:ImageButton ImageUrl="~/Images/edit.png"
                                                                        runat="server" ValidationGroup="VG105" ID="btneditprov" Width="20px"
                                                                        Height="20px"  />

                                                                  <cc1:ModalPopupExtender ID="mp45" runat="server"
                                                                        PopupControlID="Panel23"
                                                                        TargetControlID="btneditprov"
                                                                        CancelControlID="btncerrareditprov"
                                                                        BackgroundCssClass="modalBackground">
                                                                    </cc1:ModalPopupExtender>
                                                                    <asp:Panel ID="Panel23" runat="server"
                                                                        CssClass="modalPopup" align="center"
                                                                        Style="background-color:white; border:solid; border-color:black;">
                                                                        <div style="padding:20px">
                                                                            <asp:UpdatePanel ID="UpdatePanel2"
                                                                                runat="server">
                                                                                <ContentTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label6e" runat="server">
                                                                    Cantidad:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtcant" runat="server" Text='<%# Eval("cantidad") %>' TextMode="Number">
                                                                </asp:TextBox>
                                              
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                             <td>
                                                                <asp:Label ID="Label7e" runat="server">
                                                                    Representante:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtimporte" runat="server" TextMode="Number">
                                                                </asp:TextBox>
                                                                

                                                            </td>
                                                        </tr>
                                                        
                                                           
                                                    </table>
                                                            <asp:Button ID="Button6" runat="server" Text="Editar"
                                                                     CssClass="btn btn-success rounded-3" CausesValidation="true"  CommandName="Update"
                                                                    ValidationGroup="VG106" />
                                                                <asp:Button ID="btncerrareditprov" CssClass="btn btn-danger rounded-3" runat="server" Text="Cerrar" ValidationGroup="VG107" />
                                    
                                                     </ContentTemplate>
                                                                                
                                                                            </asp:UpdatePanel>
                                                                        </div>
                                                                    
                                                                    </asp:Panel>

                                                              
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                      </Columns>
            </asp:GridView>
        <asp:Button runat="server" ID="btnordcprahecho" Text="Enviar orden de compra" OnClick="btnordcprahecho_Click"/>
    </div>
</asp:Content>
