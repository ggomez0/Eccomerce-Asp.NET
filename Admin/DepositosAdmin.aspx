<%@ Page Title="Depositos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepositosAdmin.aspx.cs" Inherits="ShopGaspar.Admin.DepositosAdmin" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <asp:Button ID="Button3" CssClass="btn btn-success rounded-3" runat="server" Text="Agregar Depositos"
                                            ValidationGroup="VG11" />
       
                                        <!-- ModalPopupExtender -->
                                        <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                            PopupControlID="Panel3" TargetControlID="Button3" CancelControlID="btncerrardep"
                                            BackgroundCssClass="modalBackground">
                                        </cc1:ModalPopupExtender>
                                        <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" align="center"
                                            Style="background-color:white; border:solid; border-color:black;">
                                            <div style="padding:20px;">                                            

                                                        <h3>Agregar Depositos</h3>
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





                                                <asp:Button ID="btnagregardep" runat="server" Text="Agregar Deposito"
                                                    OnClick="btnagregardep_Click" CssClass="btn btn-success rounded-3" CausesValidation="true"
                                                    ValidationGroup="VG12" />

                                                <asp:Button ID="btncerrardep" runat="server" CssClass="btn btn-danger rounded-3" Text="Cerrar"
                                                    ValidationGroup="VG13" />
                                                <asp:Label ID="lblconfirmardep" runat="server" Text=""></asp:Label>
                                            </div>
                                        </asp:Panel>

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

                                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>" style="
                                                                object-fit:fill; width:10em" />
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

                                                                 <cc1:ModalPopupExtender ID="mp8" runat="server"
                                                                        PopupControlID="Pane2188"
                                                                        TargetControlID="btneditdep"
                                                                        CancelControlID="btncerrareditdep"
                                                                        BackgroundCssClass="modalBackground">
                                                                    </cc1:ModalPopupExtender>
                                                                    <asp:Panel ID="Pane2188" runat="server"
                                                                        CssClass="modalPopup" align="center"
                                                                        Style="background-color:white; border:solid; border-color:black;">
                                                                        <div style="padding:20px">
                                                                         
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
                                                                                                    Descripcion:</asp:Label>
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
                                                                                                    Text='<%# Eval("ubicacion") %>'
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
                                                                                        ValidationGroup="VG31" CssClass="btn btn-success rounded-3" />
                                                                                    
                                                                                      <asp:Button ID="btncerrareditdep" runat="server"
                                                                            Text="Cerrar" CssClass="btn btn-danger rounded-3"
                                                                            ValidationGroup="VG32" />

                                                                        </div>
                                                                      <asp:Label ID="lbldepedit"
                                                                                        runat="server" Text="">
                                                                                    </asp:Label>
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
                                      

        <asp:Label id="lblSuccessMessage" runat="server"></asp:Label>
        <asp:Label id="lblErrorMessage" runat="server"></asp:Label>

    </div>
</asp:Content>
