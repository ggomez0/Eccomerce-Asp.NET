<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AdminPage.aspx.cs" Inherits="ShopGaspar.Admin.AdminPage" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

        <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div class="">
                  <style>
                                        .button4 {border-radius: 12px;}
                                    </style>

                <%-- //////////////////////////////////////////////////--%>

                    <div class="row" >
                        <div class="col-2">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist"
                                aria-orientation="vertical" style="border-color:black; border-right:groove; border-color:black;">

                                <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-cat"
                                    role="tab" aria-controls="v-pills-cat" aria-selected="true">Categoria</a>
                                <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-prod"
                                    role="tab" aria-controls="v-pills-prod" aria-selected="false">Productos</a>
                                <a class="nav-link" id="v-pills-dep-tab" data-toggle="pill" href="#v-pills-dep"
                                    role="tab" aria-controls="v-pills-dep" aria-selected="false">Depositos</a>
                                <a class="nav-link" id="v-pills-prodendep-tab" data-toggle="pill"
                                    href="#v-pills-prodendep" role="tab" aria-controls="v-pills-prodendep"
                                    aria-selected="false">Ingreso / Egreso</a>
                                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-trans"
                                    role="tab" aria-controls="v-pills-trans" aria-selected="false">Transacciones</a>
                                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-cli"
                                    role="tab" aria-controls="v-pills-cli" aria-selected="false">Clientes</a>
                                <a class="nav-link" id="v-pills-estat-tab" data-toggle="pill" href="#v-pills-stat"
                                    role="tab" aria-controls="v-pills-stat" aria-selected="false">Estadisticas</a>
                            </div>
                        </div>


                        <div class="col-9" >
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-cat" role="tabpanel"
                                    aria-labelledby="v-pills-cat-tab">

                                  

                                    <asp:Button ID="Button1" CssClass="btn btn-success button4"  runat="server" Text="Agregar Categoria" />
                                    <!-- ModalPopupExtender -->
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                        PopupControlID="Panel2" TargetControlID="Button1" CancelControlID="Button2"
                                        BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:blue; border-radius:30px">
                                        <div style="padding:20px">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <h3>Agregar Categoria:</h3>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="AddCategoria" runat="server">
                                                                </asp:TextBox>
                                                                <asp:Button ID="AddCat" runat="server" Text="Agregar"
                                                                    OnClick="AddCat_Click" CausesValidation="true"
                                                                    ValidationGroup="VG1" />

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
                                        <asp:Button ID="Button2" runat="server" Text="Cerrar" />
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

                                                                                                <asp:RequiredFieldValidator
                                                                                                    ValidationGroup="VG15"
                                                                                                    ID="RequiredFieldValidator112"
                                                                                                    runat="server"
                                                                                                    Text="* Nombre del producto requerido."
                                                                                                    ControlToValidate="txtCategoryNameedit"
                                                                                                    SetFocusOnError="true"
                                                                                                    Display="Dynamic">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>


                                                                                       
                                                                                    </table>
                                                                                    <p></p>
                                                                                    <p></p>

                                                                                    <asp:Button CssClass="btn btn-success button4" ID="Editcat"
                                                                                        runat="server"
                                                                                        Text="Editar Producto"
                                                                                        CommandName="Update"
                                                                                        CausesValidation="true"
                                                                                        ValidationGroup="VG15" />
                                                                                      <asp:Button ID="btncerrareditcat" CssClass="btn btn-danger button4" runat="server"
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
                                </div>

                                <%--///////////////////////////////////////////////////////--%>
                                <%------------PRODUCTOS-------------------------------%>

                                <div class="tab-pane fade" id="v-pills-prod" role="tabpanel"
                                    aria-labelledby="v-pills-prod-tab">


                                    <asp:Button ID="btnShow" runat="server" CssClass="btn btn-success button4"
                                        Text="Agregar Producto" ValidationGroup="VG4" />
                                    <!-- ModalPopupExtender -->
                                    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1"
                                        TargetControlID="btnShow" CancelControlID="btnClose"
                                        BackgroundCssClass="modalBackground ">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center"
                                        Style="background-color:white; border:solid; border-color:blue; border-radius:30px 5px ">
                                        <div style="margin:15px">
                                            <asp:UpdatePanel ID="UpdatePanel100" runat="server">
                                                <ContentTemplate>

                                                    <h3>Agregar producto:</h3>
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
                                                                <asp:Label ID="LabelAddImageFile" runat="server">Imagen:
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

                                                    <asp:Button ID="AddProductButton" runat="server"
                                                        Text="Agregar Producto" OnClick="AddProductButton_Click"
                                                        CausesValidation="true" ValidationGroup="VG5" />
                                                    <asp:Label ID="LabelAddStatus" runat="server" Text=""></asp:Label>
                                                    <asp:Button ID="btnClose" runat="server" Text="Cancelar"
                                                        ValidationGroup="VG6" />
                                                    <p></p>




                                                </ContentTemplate>
                                            </asp:UpdatePanel>
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
                                                                        Style="background-color:white; border:solid; border-color:blue; border-radius:30px 5px ">
                                                                        <div style="padding:20px">
                                                                            <asp:UpdatePanel ID="UpdatePanel2"
                                                                                runat="server">
                                                                                <ContentTemplate>
                                                                                    <h3>Editar producto:</h3>
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

                                                                                    <asp:Button ID="Editbtnprod"
                                                                                        runat="server"
                                                                                        Text="Editar Producto"
                                                                                        CommandName="Update"
                                                                                        CausesValidation="true"
                                                                                        ValidationGroup="VG8" />
                                                                                    <asp:Label ID="lblprodedit"
                                                                                        runat="server" Text="">
                                                                                    </asp:Label>


                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </div>
                                                                        <asp:Button ID="btncerraredit" runat="server"
                                                                            Text="Cerrar"
                                                                            ValidationGroup="VG9" />
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
                                </div>

                                <%--------------------------------------------------%>

                                    <div class="tab-pane fade" id="v-pills-dep" role="tabpanel"
                                        aria-labelledby="v-pills-dep-tab">
                                        <asp:Button ID="Button3" CssClass="btn btn-success button4" runat="server" Text="Agregar Depositos"
                                            ValidationGroup="VG11" />
                                        <!-- ModalPopupExtender -->
                                        <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                            PopupControlID="Panel3" TargetControlID="Button3" CancelControlID="Button4"
                                            BackgroundCssClass="modalBackground">
                                        </cc1:ModalPopupExtender>
                                        <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" align="center"
                                            Style="background-color:white; border:solid; border-color:blue; border-radius:30px 5px ">
                                            <div style="padding:20px">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>

                                                        <h3>Agregar Depositos:</h3>
                                                        <table>

                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblnomdep" runat="server">Nombre:
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtnomdep" runat="server">
                                                                    </asp:TextBox>
                                                                    <asp:RequiredFieldValidator
                                                                        ValidationGroup="VG12"
                                                                        ID="RequiredFieldValidator7" runat="server"
                                                                        Text="* Nombre del deposito requerido."
                                                                        ControlToValidate="txtnomdep"
                                                                        SetFocusOnError="true" Display="Dynamic">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lbldescdep" runat="server">
                                                                        Descripcion:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtdescdep" runat="server">
                                                                    </asp:TextBox>
                                                                    <asp:RequiredFieldValidator
                                                                        ValidationGroup="VG12"
                                                                        ID="RequiredFieldValidator8" runat="server"
                                                                        Text="* Descripcion requerida."
                                                                        ControlToValidate="txtdescdep"
                                                                        SetFocusOnError="true" Display="Dynamic">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblubidep" runat="server">Ubicacion:
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtubidep" runat="server">
                                                                    </asp:TextBox>
                                                                    <asp:RequiredFieldValidator
                                                                        ValidationGroup="VG12"
                                                                        ID="RequiredFieldValidator9" runat="server"
                                                                        Text="* Ubicacion requerido."
                                                                        ControlToValidate="txtubidep"
                                                                        SetFocusOnError="true" Display="Dynamic">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="imgdep" runat="server">Imagen:
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                                    <asp:RequiredFieldValidator
                                                                        ValidationGroup="VG12"
                                                                        ID="RequiredFieldValidator11" runat="server"
                                                                        Text="* Imagen requerida."
                                                                        ControlToValidate="FileUpload1"
                                                                        SetFocusOnError="true" Display="Dynamic">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                        </table>



                                                    </ContentTemplate>
                                                </asp:UpdatePanel>



                                                <asp:Button ID="btnagregardep" runat="server" Text="Agregar Deposito"
                                                    OnClick="btnagregardep_Click" CssClass="btn btn-success button4" CausesValidation="true"
                                                    ValidationGroup="VG12" />

                                                <asp:Button ID="Button4" runat="server" Text="Cerrar"
                                                    ValidationGroup="VG13" />
                                                <asp:Label ID="lblconfirmardep" runat="server" Text=""></asp:Label>
                                            </div>
                                        </asp:Panel>



                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <asp:gridview class="table thead-dark" CssClass="grid" ID="gvdep"
                                                    runat="server" AutoGenerateColumns="false"
                                                    ShowHeaderWhenEmpty="true" BackColor="White" BorderColor="#CCCCCC"
                                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="DepID" OnRowCommand="gvdep_RowCommand"
                                                    OnRowEditing="gvdep_RowEditing"
                                                    OnRowCancelingEdit="gvdep_RowCancelingEdit"
                                                    OnRowUpdating="gvdep_RowUpdating"
                                                    OnRowDeleting="gvdep_RowDeleting">
                                                    <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />

                                                    <Columns>
                                                        <asp:TemplateField HeaderText="ID">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("DepID") %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nombre">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("DepName") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Ubicacion">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("ubicacion") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Descripcion">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("Description") %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Foto">
                                                            <ItemTemplate>

                                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>" style="height:10rem;
                                                                object-fit:contain;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ValidationGroup="depdet"
                                                                    ImageUrl="~/Images/lupa.png" ID="depdet"
                                                                    runat="server" OnClick="depdet_Click"
                                                                    CommandArgument='<%#Eval("DepID") %>' Width="20px"
                                                                    Height="20px" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                    <asp:ImageButton ImageUrl="~/Images/edit.png"
                                                                        runat="server" ID="btneditdep" Width="20px"
                                                                        Height="20px" ValidationGroup="VG30" />

                                                                 <cc1:ModalPopupExtender ID="mp1" runat="server"
                                                                        PopupControlID="Panel21"
                                                                        TargetControlID="btneditdep"
                                                                        CancelControlID="btncerrareditdep"
                                                                        BackgroundCssClass="modalBackground">
                                                                    </cc1:ModalPopupExtender>
                                                                    <asp:Panel ID="Panel21" runat="server"
                                                                        CssClass="modalPopup" align="center"
                                                                        Style="background-color:white; border:solid; border-color:blue; border-radius:30px 5px ">
                                                                        <div style="padding:20px">
                                                                            <asp:UpdatePanel ID="UpdatePanel2"
                                                                                runat="server">
                                                                                <ContentTemplate>
                                                                                    <h3>Editar deposito:</h3>
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbldepnameedit"
                                                                                                    runat="server">
                                                                                                    Nombre:
                                                                                                </asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtdepnameedit"
                                                                                                    Text='<%# Eval("DepName") %>'
                                                                                                    Width="50%"
                                                                                                    runat="server" ValidationGroup="VG31" />


                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbldescdepedit"
                                                                                                    runat="server">
                                                                                                    Nombre:</asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtdesceditdep"
                                                                                                    Text='<%# Eval("Description") %>'
                                                                                                    runat="server" ValidationGroup="VG31" />

                                                                                                <asp:RequiredFieldValidator
                                                                                                    ValidationGroup="VG31"
                                                                                                    ID="RequiredFieldValidator119"
                                                                                                    runat="server"
                                                                                                    Text="* Nombre del deposito requerido."
                                                                                                    ControlToValidate="txtdesceditdep"
                                                                                                    SetFocusOnError="true"
                                                                                                    Display="Dynamic">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lblubieditdep"
                                                                                                    runat="server">
                                                                                                    Ubicacion:
                                                                                                </asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtubieditdep"
                                                                                                    TextMode="MultiLine"
                                                                                                    Text='<%# Eval("Description") %>'
                                                                                                    runat="server" ValidationGroup="VG31" />

                                                                                                <asp:RequiredFieldValidator
                                                                                                    ValidationGroup="VG31"
                                                                                                    ID="RequiredFieldValidator113"
                                                                                                    runat="server"
                                                                                                    Text="* Ubicacion requerida."
                                                                                                    ControlToValidate="txtubieditdep"
                                                                                                    SetFocusOnError="true"
                                                                                                    Display="Dynamic">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                    
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label
                                                                                                    ID="lbleditimagedep"
                                                                                                    runat="server">
                                                                                                    Imagen:</asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox
                                                                                                    ID="txtImagePathdep"
                                                                                                    Text='<%# Eval("ImagePath") %>'
                                                                                                    Width="85%"
                                                                                                    runat="server" ValidationGroup="VG31" />
                                                                                                <asp:RequiredFieldValidator
                                                                                                    ValidationGroup="VG31"
                                                                                                    ID="RequiredFieldValidator114"
                                                                                                    runat="server"
                                                                                                    Text="* Imagen requerida."
                                                                                                    ControlToValidate="txtImagePathdep"
                                                                                                    SetFocusOnError="true"
                                                                                                    Display="Dynamic">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <p></p>
                                                                                    <p></p>

                                                                                    <asp:Button ID="Editbtndep"
                                                                                        runat="server"
                                                                                        Text="Editar Deposito"
                                                                                        CommandName="Update"
                                                                                        CausesValidation="true"
                                                                                        ValidationGroup="VG31" />
                                                                                    <asp:Label ID="lbldepedit"
                                                                                        runat="server" Text="">
                                                                                    </asp:Label>


                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </div>
                                                                        <asp:Button ID="btncerrareditdep" runat="server"
                                                                            Text="Cerrar"
                                                                            ValidationGroup="VG32" />
                                                                    </asp:Panel>
                                                               
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>

                                                                <asp:ImageButton ImageUrl="~/Images/delete.png"
                                                                    runat="server" CommandName="Delete"
                                                                    ValidationGroup="Vagosdep" ToolTip="Eliminar"
                                                                    Width="20px" Height="20px" />
                                                            </ItemTemplate>                                                       
                                                        </asp:TemplateField>

                                                    </Columns>

                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>

                                    <div class="tab-pane fade" id="v-pills-prodendep" role="tabpanel"
                                        aria-labelledby="v-pills-prodendep-tab">
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>

                                                <h3>Realizar movimientos de stock</h3>
                                                <table>
                                                    <tr>
                                                        <td>

                                                            <asp:RadioButtonList ID="rblistlist" runat="server">

                                                                <asp:ListItem>Ingreso</asp:ListItem>
                                                                <asp:ListItem>Egreso</asp:ListItem>

                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server">Producto:</asp:Label>
                                                        </td>
                                                        <td>


                                                            <asp:TextBox ID="txtacproddep" runat="server"
                                                                AutoPostBack="true" AutoCompleteType="Search">
                                                            </asp:TextBox>
                                                            <cc1:AutoCompleteExtender ID="AutoCompleteExtender2"
                                                                runat="server" ServiceMethod="ProductSearch"
                                                                MinimumPrefixLength="1" CompletionInterval="100"
                                                                EnableCaching="false" CompletionSetCount="10"
                                                                TargetControlID="txtacproddep" FirstRowSelected="false"
                                                                ServicePath="dropdownlist.asmx">
                                                            </cc1:AutoCompleteExtender>


                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server">Cantidad:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtcantdep" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14"
                                                                runat="server" Text="* Stock requerido."
                                                                ControlToValidate="txtcantdep" ValidationGroup="VG21" SetFocusOnError="true"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ValidationGroup="VG21"
                                                                ID="RegularExpressionValidator4" runat="server"
                                                                Text="* Debe ser valor numerico"
                                                                ControlToValidate="txtcantdep" SetFocusOnError="True"
                                                                Display="Dynamic"
                                                                ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$">
                                                            </asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server">Deposito:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlistdep" runat="server"
                                                                ItemType="ShopGaspar.Models.depositos"
                                                                SelectMethod="GetDepositos" DataTextField="DepName"
                                                                DataValueField="DepID">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server">Observaciones:
                                                            </asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtobsdep" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ValidationGroup="VG21"
                                                                ID="RequiredFieldValidator10" runat="server"
                                                                Text="* Observaciones requerida."
                                                                ControlToValidate="txtobsdep" SetFocusOnError="true"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>

                                                </table>
                                                <p></p>
                                                <p></p>

                                                <asp:Button ID="btndepexis" runat="server"
                                                    Text="Realizar movimiento de existencias"
                                                    OnClick="btndepexis_Click1" CausesValidation="true"
                                                    ValidationGroup="VG21" CssClass="btn btn-success button4" />
                                                <asp:Label ID="lblprodendep" runat="server" Text=""></asp:Label>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>


                                    <%-----------------------------------------------------------%>

                                        <div class="tab-pane fade" id="v-pills-trans" role="tabpanel"
                                            aria-labelledby="v-pills-trans-tab">

                                            <div class="">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:gridview class="table thead-dark" CssClass="grid"
                                                            ID="tablatrans" runat="server" AutoGenerateColumns="false"
                                                            ShowHeaderWhenEmpty="true" BackColor="White"
                                                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                                            CellPadding="3">
                                                            <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
                                                     
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="ID">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%# Eval("OrderId") %>'
                                                                            runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Fecha">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%# Eval("OrderDate") %>'
                                                                            runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Usuario">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%# Eval("Username") %>'
                                                                            runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Detalles">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ValidationGroup="ordenesval"
                                                                            ImageUrl="~/Images/lupa.png" ID="imgordenes"
                                                                            runat="server"
                                                                            CommandArgument='<%#Eval("OrderId") %>'
                                                                            OnClick="imgordenes_Click" Width="20px"
                                                                            Height="20px" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>

                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <%--------------------------------------------------%>

                                            <div class="tab-pane fade" id="v-pills-cli" role="tabpanel"
                                                aria-labelledby="v-pills-cli-tab">

                                                <div class="">
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>
                                                            <asp:GridView class="table thead-dark" ID="tablausers"
                                                                runat="server" CssClass="grid"
                                                                AutoGenerateColumns="false" BorderStyle="None"
                                                                BorderWidth="1px" CellPadding="3"
                                                                ShowHeaderWhenEmpty="true" BackColor="White"
                                                                BorderColor="#CCCCCC">
                                                                <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Usuario">
                                                                        <ItemTemplate>
                                                                            <asp:Label Text='<%# Eval("Username") %>'
                                                                                runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Email">
                                                                        <ItemTemplate>
                                                                            <asp:Label Text='<%# Eval("Email") %>'
                                                                                runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Detalles">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ValidationGroup="valord1"
                                                                                ImageUrl="~/Images/lupa.png" ID="imgord"
                                                                                runat="server"
                                                                                CommandArgument='<%#Eval("Username") %>'
                                                                                OnClick="imgord_Click" Width="20px"
                                                                                Height="20px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                </Columns>

                                                            </asp:GridView>

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </div>


                                            <div class="tab-pane fade" id="v-pills-stat" role="tabpanel"
                                                aria-labelledby="v-pills-stat-tab">
                                                <asp:GridView ID="gvstat" BorderStyle="None" runat="server"
                                                    CssClass="grid" ShowHeaderWhenEmpty="true"
                                                    AutoGenerateColumns="true">
                                                    <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />

                                                </asp:GridView>
                                            </div>

                            </div>
                        </div>
                    </div>
                    <p></p>
            </div>





        </asp:Content>