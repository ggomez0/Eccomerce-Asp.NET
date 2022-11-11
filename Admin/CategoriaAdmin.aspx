<%@ Page Title="Categoria" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoriaAdmin.aspx.cs" Inherits="ShopGaspar.Admin.CategoriaAdmin" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

         <asp:Button ID="Button1" CssClass="btn btn-success rounded-3"  runat="server" Text="Agregar Categoria" />
                                    <!-- ModalPopupExtender --->
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                        PopupControlID="Panel2" TargetControlID="Button1" CancelControlID="Button2"
                                        BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:black;" >
                                        <div style="padding:20px">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <h3>Agregar Categoria</h3>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="AddCategoria" runat="server">
                                                                </asp:TextBox>
                                                                

                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                                                    runat="server" Font-Bold="true"
                                                                    Text="*Nombre de Categoria requerida"
                                                                    ControlToValidate="AddCategoria"
                                                                    SetFocusOnError="true" Display="Dynamic"
                                                                    ValidationGroup="VG1"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lbladdcatstatus" runat="server" Text="">
                                                                </asp:Label>

                                                            </td>
                                                        </tr>

                                                    </table>



                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <asp:Button ID="AddCat" runat="server" Text="Agregar"
                                                                    OnClick="AddCat_Click" CssClass="btn btn-success rounded-3" CausesValidation="true"
                                                                    ValidationGroup="VG1" />
                                        <asp:Button ID="Button2" CssClass="btn btn-danger rounded-3" runat="server" Text="Cerrar" />
                                        <br />
                                        <p>  </p>
                                        <p></p>
                                    </asp:Panel>

                              
                                    <asp:GridView ID="gvcattab" runat="server" CssClass="grid"
                                        ShowHeaderWhenEmpty="true" class="table thead-dark" AutoGenerateColumns="false"
                                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="3" DataKeyNames="CategoryID" OnRowCommand="gvcattab_RowCommand"
                                                    OnRowEditing="gvcattab_RowEditing"
                                                    OnRowCancelingEdit="gvcattab_RowCancelingEdit"
                                                    OnRowUpdating="gvcattab_RowUpdating"
                                                    OnRowDeleting="gvcattab_RowDeleting">
                                                            <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
                                                            
                                                          
                                                           
                                        <Columns>

                                              <asp:TemplateField HeaderText="ID">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("CategoryID") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nombre">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("CategoryName") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                              <asp:TemplateField HeaderStyle-Width="10px" >
                                                            <ItemTemplate>
                                                                    <asp:ImageButton ImageUrl="~/Images/lupa.png"
                                                                        runat="server" ValidationGroup="VG2" ID="btndetcat" Width="20px"
                                                                        Height="20px" OnClick="btndetcat_Click" CommandArgument='<%#Eval("CategoryID") %>' />
                                                               
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderStyle-Width="10px">
                                                            <ItemTemplate>
                                                                    <asp:ImageButton ImageUrl="~/Images/edit.png"
                                                                        runat="server" ValidationGroup="VG3" ID="btneditcat" Width="20px"
                                                                        Height="20px"  />
                                                                  <cc1:ModalPopupExtender ID="mp1" runat="server"
                                                                        PopupControlID="Panel21"
                                                                        TargetControlID="btneditcat"
                                                                        CancelControlID="btncerrareditcat"
                                                                        BackgroundCssClass="modalBackground">
                                                                    </cc1:ModalPopupExtender>
                                                                    <asp:Panel ID="Panel21" runat="server"
                                                                        CssClass="modalPopup" align="center"
                                                                        Style="background-color:white; border:solid; border-color:black;">
                                                                        <div style="padding:20px">
                                                                            <asp:UpdatePanel ID="UpdatePanel2"
                                                                                runat="server">
                                                                                <ContentTemplate>
                                                                                    <h3>Editar categoria</h3>
                                                                                    <table>                                                                                     
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbleditnamecat"
                                                                                                    runat="server">
                                                                                                    Nombre:</asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtCategoryNameedit"
                                                                                                    Text='<%# Eval("CategoryName") %>'
                                                                                                    runat="server" />

                                                                                              
                                                                                            </td>
                                                                                        </tr>


                                                                                       
                                                                                    </table>
                                                                                    <p></p>
                                                                                    <p></p>

                                                                                    <asp:Button CssClass="btn btn-success rounded-3" ID="Editcat"
                                                                                        runat="server"
                                                                                        Text="Editar categoria"
                                                                                        CommandName="Update"
                                                                                        ValidationGroup="VG188885" />
                                                                                      <asp:Button ID="btncerrareditcat" CssClass="btn btn-danger rounded-3" runat="server"
                                                                            Text="Cerrar"
                                                                            ValidationGroup="VG16" />
                                                                                  



                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </div>
                                                                        <asp:Label ID="lblcatedit"
                                                                                        runat="server" Text="">
                                                                                    </asp:Label>
                                                                    </asp:Panel>

                                                               
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-Width="10px">
                                                            <ItemTemplate>

                                                                <asp:ImageButton ImageUrl="~/Images/delete.png"
                                                                    runat="server" CommandName="Delete"
                                                                    ValidationGroup="VG3" ToolTip="Eliminar"
                                                                    Width="20px" Height="20px" />
                                                            </ItemTemplate>                                                       
                                                        </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
        <asp:label runat="server" ID="lblErrorMessage"></asp:label>
        <asp:label runat="server" ID="lblSuccessMessage"></asp:label>
    </div>
</asp:Content>
