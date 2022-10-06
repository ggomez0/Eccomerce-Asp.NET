<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductosAdmin.aspx.cs" Inherits="ShopGaspar.Admin.ProductosAdmin" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

         <asp:Button ID="btnShow" runat="server" CssClass="btn btn-success rounded-3"
                                        Text="Agregar Producto" ValidationGroup="VG4" />
                                    <!-- ModalPopupExtender -->
                                    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1"
                                        TargetControlID="btnShow" CancelControlID="btnClose"
                                        BackgroundCssClass="modalBackground ">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:black;">
                                        <div style="margin:15px">
                                       
                                                    <h3>Agregar producto</h3>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelAddCategory" runat="server">
                                                                    Categoria:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DropDownAddCategory"
                                                                    runat="server" ItemType="ShopGaspar.Models.Category"
                                                                    SelectMethod="GetCategories"
                                                                    DataTextField="CategoryName"
                                                                    DataValueField="CategoryID">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelAddName" runat="server">Nombre:
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="AddProductName" runat="server">
                                                                </asp:TextBox>
                                                                <asp:RequiredFieldValidator ValidationGroup="VG5"
                                                                    ID="RequiredFieldValidator1" runat="server"
                                                                    Text="* Nombre del producto requerido."
                                                                    ControlToValidate="AddProductName"
                                                                    SetFocusOnError="true" Display="Dynamic">
                                                                </asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelAddDescription" runat="server">
                                                                    Descripcion:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="AddProductDescription" runat="server">
                                                                </asp:TextBox>
                                                                <asp:RequiredFieldValidator ValidationGroup="VG5"
                                                                    ID="RequiredFieldValidator2" runat="server"
                                                                    Text="* Descripcion requerida."
                                                                    ControlToValidate="AddProductDescription"
                                                                    SetFocusOnError="true" Display="Dynamic">
                                                                </asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelAddPrice" runat="server">Precio:
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="AddProductPrice" runat="server">
                                                                </asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                                                    runat="server" Text="* Precio requerido."
                                                                    ControlToValidate="AddProductPrice"
                                                                    SetFocusOnError="true" Display="Dynamic" ValidationGroup="VG5">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator
                                                                    ValidationGroup="VG5"
                                                                    ID="RegularExpressionValidator1" runat="server"
                                                                    Text="* Valor numerico sin $"
                                                                    ControlToValidate="AddProductPrice"
                                                                    SetFocusOnError="True" Display="Dynamic"
                                                                    ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$">
                                                                </asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                     
                                                        <tr>
                                                            <td>
                                                                <asp:Label runat="server">Imagen:
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:FileUpload ID="imgprodadd"  runat="server" />
                                                                <asp:RequiredFieldValidator ValidationGroup="VG5"
                                                                    ID="RequiredFieldValidator440" runat="server"
                                                                    Text="* Imagen requerida."
                                                                    ControlToValidate="imgprodadd"
                                                                    SetFocusOnError="true" Display="Dynamic">
                                                                </asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <p></p>
                                                    <p></p>

                                                    <asp:Button ID="AddProductButton" CssClass="btn btn-success rounded-3" runat="server"
                                                        Text="Agregar Producto" OnClick="AddProductButton_Click"
                                                        CausesValidation="true" ValidationGroup="VG5" />
                                                    <asp:Label ID="LabelAddStatus" runat="server" Text=""></asp:Label>
                                                    <asp:Button ID="btnClose" CssClass="btn btn-danger rounded-3" runat="server" Text="Cancelar"
                                                        ValidationGroup="VG6" />
                                                    <p></p>



                                        </div>

                                    </asp:Panel>
                                    <br />
                                    <br />

                                    <div>
                                        <asp:UpdatePanel ID="wer123" runat="server">
                                            <ContentTemplate>

                                                <asp:GridView ID="gridproductos" runat="server" CssClass="grid"
                                                    ShowHeaderWhenEmpty="true" class="table thead-dark"
                                                    AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC"
                                                    BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                                    DataKeyNames="ProductID" OnRowCommand="gridproductos_RowCommand"
                                                    OnRowEditing="gridproductos_RowEditing"
                                                    OnRowCancelingEdit="gridproductos_RowCancelingEdit"
                                                    OnRowUpdating="gridproductos_RowUpdating"
                                                    OnRowDeleting="gridproductos_RowDeleting">
                                                    <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />


                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Nombre">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("ProductName") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Descripcion">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("Description") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ImagePath">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("ImagePath") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Precio">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("UnitPrice") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Stock">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("stock") %>' runat="server" />
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Vendido">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("vendido") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Categoria">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("CategoryID") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>


                                                                <%------------------------------------------------------------------------------------------------------------------------------------------%>


                                                                    <asp:ImageButton ImageUrl="~/Images/edit.png"
                                                                        runat="server" ID="btneditprod" Width="20px"
                                                                        Height="20px" ValidationGroup="VG7" />
                                                                    <!-- ModalPopupExtender -->
                                                                    <cc1:ModalPopupExtender ID="mp1" runat="server"
                                                                        PopupControlID="Panel21"
                                                                        TargetControlID="btneditprod"
                                                                        CancelControlID="btncerraredit"
                                                                        BackgroundCssClass="modalBackground">
                                                                    </cc1:ModalPopupExtender>
                                                                    <asp:Panel ID="Panel21" runat="server"
                                                                        CssClass="modalPopup" align="center"
                                                                        Style="background-color:white; border:solid; border-color:black;">
                                                                        <div style="padding:20px">
                                                                            <asp:UpdatePanel ID="UpdatePanel2"
                                                                                runat="server">
                                                                                <ContentTemplate>
                                                                                    <h3>Editar producto</h3>
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbleditcatprod"
                                                                                                    runat="server">
                                                                                                    Categoria:
                                                                                                </asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtctid"
                                                                                                    Text='<%# Eval("CategoryID") %>'
                                                                                                    Width="50%"
                                                                                                    runat="server" ValidationGroup="VG8" />


                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbleditname"
                                                                                                    runat="server">
                                                                                                    Nombre:</asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtProductName"
                                                                                                    Text='<%# Eval("ProductName") %>'
                                                                                                    runat="server" />

                                                                                                <asp:RequiredFieldValidator
                                                                                                    ValidationGroup="VG8"
                                                                                                    ID="RequiredFieldValidator111"
                                                                                                    runat="server"
                                                                                                    Text="* Nombre del producto requerido."
                                                                                                    ControlToValidate="txtProductName"
                                                                                                    SetFocusOnError="true"
                                                                                                    Display="Dynamic">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbldesceditprod"
                                                                                                    runat="server">
                                                                                                    Descripcion:
                                                                                                </asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtDescription"
                                                                                                    TextMode="MultiLine"
                                                                                                    Text='<%# Eval("Description") %>'
                                                                                                    runat="server" />

                                                                                                <asp:RequiredFieldValidator
                                                                                                    ValidationGroup="VG8"
                                                                                                    ID="RequiredFieldValidator211"
                                                                                                    runat="server"
                                                                                                    Text="* Descripcion requerida."
                                                                                                    ControlToValidate="txtDescription"
                                                                                                    SetFocusOnError="true"
                                                                                                    Display="Dynamic">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbleditpriceprod"
                                                                                                    runat="server">
                                                                                                    Precio:</asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtUnitPrice"
                                                                                                    Width="80%"
                                                                                                    Text='<%# Eval("UnitPrice") %>'
                                                                                                    runat="server" />

                                                                                                <asp:RequiredFieldValidator
                                                                                                    ID="RequiredFieldValidator311"
                                                                                                    runat="server"
                                                                                                    Text="* Precio requerido."
                                                                                                    ControlToValidate="txtUnitPrice"
                                                                                                    SetFocusOnError="true"
                                                                                                    Display="Dynamic" ValidationGroup="VG8">
                                                                                                </asp:RequiredFieldValidator>
                                                                                                <asp:RegularExpressionValidator
                                                                                                    ValidationGroup="VG8"
                                                                                                    ID="RegularExpressionValidator111"
                                                                                                    runat="server"
                                                                                                    Text="* Valor numerico sin $"
                                                                                                    ControlToValidate="txtUnitPrice"
                                                                                                    SetFocusOnError="True"
                                                                                                    Display="Dynamic"
                                                                                                    ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$">
                                                                                                </asp:RegularExpressionValidator>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbleditimageprod"
                                                                                                    runat="server">
                                                                                                    Imagen:</asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtImagePath"
                                                                                                    Text='<%# Eval("ImagePath") %>'
                                                                                                    Width="85%"
                                                                                                    runat="server" />
                                                                                                <asp:RequiredFieldValidator
                                                                                                    ValidationGroup="VG8"
                                                                                                    ID="RequiredFieldValidator411"
                                                                                                    runat="server"
                                                                                                    Text="* Imagen requerida."
                                                                                                    ControlToValidate="txtImagePath"
                                                                                                    SetFocusOnError="true"
                                                                                                    Display="Dynamic">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <p></p>
                                                                                    <p></p>

                                                                                  
                                                                                    <asp:Label ID="lblprodedit"
                                                                                        runat="server" Text="">
                                                                                    </asp:Label>


                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </div>
                                                                          <asp:Button ID="Editbtnprod"
                                                                                        runat="server"
                                                                                        Text="Editar"
                                                                                        CommandName="Update"
                                                                                        CausesValidation="true"
                                                                                        ValidationGroup="VG8" CssClass="btn btn-success rounded-3" />
                                                                        <asp:Button ID="btncerraredit" CssClass="btn btn-danger rounded-3" runat="server"
                                                                            Text="Cerrar"
                                                                            ValidationGroup="VG9" />
                                                                        <p></p>
                                                                        <p></p>
                                                                    </asp:Panel>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>

                                                                <asp:ImageButton ImageUrl="~/Images/delete.png"
                                                                    runat="server" CommandName="Delete"
                                                                    ValidationGroup="VG10" ToolTip="Eliminar"
                                                                    Width="20px" Height="20px" />
                                                            </ItemTemplate>                                                       
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
                                                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>
                                                        <asp:Label ID="lblconfirmardep" runat="server" Text=""></asp:Label>

    </div>
</asp:Content>
