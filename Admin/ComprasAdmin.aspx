<%@ Page Title="Compras" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ComprasAdmin.aspx.cs" Inherits="ShopGaspar.Admin.ComprasAdmin" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

        <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div class="container">

                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-prov-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-prov" type="button" role="tab" aria-controls="pills-prov"
                            aria-selected="true">Proveedores</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-lstcpra-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-lstcpra" type="button" role="tab" aria-controls="pills-lstcpra"
                            aria-selected="false">Orden de compra</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-fact-tab" data-bs-toggle="pill" data-bs-target="#pills-fact"
                            type="button" role="tab" aria-controls="pills-fact" aria-selected="false">Factura</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-pago-tab" data-bs-toggle="pill" data-bs-target="#pills-pago"
                            type="button" role="tab" aria-controls="pills-pago" aria-selected="false">Pago</button>
                    </li>

                </ul>


                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-prov" role="tabpanel"
                        aria-labelledby="pills-prov-tab">

                        <asp:Button ID="Button5" CssClass="btn btn-success rounded-3" runat="server"
                            Text="Agregar Proveedores" ValidationGroup="VG99" />
                        <!-- ModalPopupExtender -->
                        <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="Panel21"
                            TargetControlID="Button5" CancelControlID="Button7" BackgroundCssClass="modalBackground">
                        </cc1:ModalPopupExtender>
                        <asp:Panel ID="Panel21" runat="server" CssClass="modalPopup" align="center"
                            Style="background-color:white; border:solid; border-color:black;">
                            <div style="padding:20px">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <h3>Agregar Proveedor</h3>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server">
                                                        Nombre:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtnomprov" runat="server">
                                                    </asp:TextBox>


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                                        runat="server" Font-Bold="true"
                                                        Text="*Nombre del proveedor requerida"
                                                        ControlToValidate="txtnomprov" SetFocusOnError="true"
                                                        Display="Dynamic" ValidationGroup="VG100">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label7" runat="server">
                                                        Representante:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtreprprov" runat="server">
                                                    </asp:TextBox>


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                                        runat="server" Font-Bold="true"
                                                        Text="*Nombre del representante requerida"
                                                        ControlToValidate="txtreprprov" SetFocusOnError="true"
                                                        Display="Dynamic" ValidationGroup="VG100">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label8" runat="server">
                                                        Telefono:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txttelprov" runat="server">
                                                    </asp:TextBox>


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                                                        runat="server" Font-Bold="true"
                                                        Text="*Numero de telefono requerida"
                                                        ControlToValidate="txttelprov" SetFocusOnError="true"
                                                        Display="Dynamic" ValidationGroup="VG100">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label9" runat="server">
                                                        CUIT:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtcuitprov" runat="server">
                                                    </asp:TextBox>


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13"
                                                        runat="server" Font-Bold="true" Text="*CUIT requerido"
                                                        ControlToValidate="txtcuitprov" SetFocusOnError="true"
                                                        Display="Dynamic" ValidationGroup="VG100">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label10" runat="server">
                                                        E-mail:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtemailprov" runat="server">
                                                    </asp:TextBox>


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15"
                                                        runat="server" Font-Bold="true" Text="*Email requerida"
                                                        ControlToValidate="txtemailprov" SetFocusOnError="true"
                                                        Display="Dynamic" ValidationGroup="VG100">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label11" runat="server">
                                                        Comentario:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtcomprov" runat="server">
                                                    </asp:TextBox>


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16"
                                                        runat="server" Font-Bold="true" Text="*Comentario requerido"
                                                        ControlToValidate="txtcomprov" SetFocusOnError="true"
                                                        Display="Dynamic" ValidationGroup="VG100">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text="">
                                                    </asp:Label>

                                                </td>
                                            </tr>

                                        </table>



                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <asp:Button ID="btnagregarprov" runat="server" Text="Agregar" OnClick="btnagregarprov_Click"
                                CssClass="btn btn-success rounded-3" CausesValidation="true" ValidationGroup="VG100" />
                            <asp:Button ID="Button7" CssClass="btn btn-danger rounded-3" runat="server" Text="Cerrar"
                                ValidationGroup="VG101" />
                            <br />
                            <p> </p>
                            <p></p>
                        </asp:Panel>


                        <asp:GridView ID="gvproveedores" runat="server" CssClass="grid" ShowHeaderWhenEmpty="true"
                            class="table thead-dark" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ProvID"
                            OnRowCommand="gvproveedores_RowCommand" OnRowEditing="gvproveedores_RowEditing"
                            OnRowCancelingEdit="gvproveedores_RowCancelingEdit"
                            OnRowUpdating="gvproveedores_RowUpdating" OnRowDeleting="gvproveedores_RowDeleting">
                            <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />



                            <Columns>

                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ProvID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ProvName") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Representante">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ReprProv") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("telefono") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="E-Mail">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("email") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comentario">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("comentario") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderStyle-Width="10px">
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server"
                                            ValidationGroup="VG105" ID="btneditprov" Width="20px" Height="20px" />

                                        <cc1:ModalPopupExtender ID="mp45" runat="server" PopupControlID="Panel23"
                                            TargetControlID="btneditprov" CancelControlID="btncerrareditprov"
                                            BackgroundCssClass="modalBackground">
                                        </cc1:ModalPopupExtender>
                                        <asp:Panel ID="Panel23" runat="server" CssClass="modalPopup" align="center"
                                            Style="background-color:white; border:solid; border-color:black;">
                                            <div style="padding:20px">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <h3>Editar Proveedor</h3>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label6e" runat="server">
                                                                        Nombre:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtnomprovedit" runat="server"
                                                                        Text='<%# Eval("ProvName") %>'>
                                                                    </asp:TextBox>


                                                                    <asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator35" runat="server"
                                                                        Font-Bold="true"
                                                                        Text="*Nombre del proveedor requerida"
                                                                        ControlToValidate="txtnomprovedit"
                                                                        SetFocusOnError="true" Display="Dynamic"
                                                                        ValidationGroup="VG106">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label7e" runat="server">
                                                                        Representante:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtreprprovedit" runat="server"
                                                                        Text='<%# Eval("ReprProv") %>'>
                                                                    </asp:TextBox>


                                                                    <asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator36" runat="server"
                                                                        Font-Bold="true"
                                                                        Text="*Nombre del representante requerida"
                                                                        ControlToValidate="txtreprprovedit"
                                                                        SetFocusOnError="true" Display="Dynamic"
                                                                        ValidationGroup="VG106">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label8e" runat="server">
                                                                        Telefono:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txttelprovedit" runat="server"
                                                                        Text='<%# Eval("telefono") %>'>
                                                                    </asp:TextBox>


                                                                    <asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator37" runat="server"
                                                                        Font-Bold="true"
                                                                        Text="*Numero de telefono requerida"
                                                                        ControlToValidate="txttelprovedit"
                                                                        SetFocusOnError="true" Display="Dynamic"
                                                                        ValidationGroup="VG106">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label9e" runat="server">
                                                                        CUIT:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtcuitprovedit" runat="server"
                                                                        Text='<%# Eval("cuit") %>'>
                                                                    </asp:TextBox>


                                                                    <asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator38" runat="server"
                                                                        Font-Bold="true" Text="*CUIT requerido"
                                                                        ControlToValidate="txtcuitprovedit"
                                                                        SetFocusOnError="true" Display="Dynamic"
                                                                        ValidationGroup="VG106">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label10e" runat="server">
                                                                        E-mail:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtemailprovedit" runat="server"
                                                                        Text='<%# Eval("email") %>'>
                                                                    </asp:TextBox>


                                                                    <asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator39" runat="server"
                                                                        Font-Bold="true" Text="*Email requerida"
                                                                        ControlToValidate="txtemailprovedit"
                                                                        SetFocusOnError="true" Display="Dynamic"
                                                                        ValidationGroup="VG106">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label11e" runat="server">
                                                                        Comentario:</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtcomprovedit" runat="server"
                                                                        Text='<%# Eval("comentario") %>'>
                                                                    </asp:TextBox>


                                                                    <asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator40" runat="server"
                                                                        Font-Bold="true" Text="*Comentario requerido"
                                                                        ControlToValidate="txtcomprovedit"
                                                                        SetFocusOnError="true" Display="Dynamic"
                                                                        ValidationGroup="VG106">
                                                                    </asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label4e" runat="server" Text="">
                                                                    </asp:Label>

                                                                </td>
                                                            </tr>

                                                        </table>
                                                        <asp:Button ID="Button6" runat="server" Text="Editar"
                                                            CssClass="btn btn-success rounded-3" CausesValidation="true"
                                                            CommandName="Update" ValidationGroup="VG106" />
                                                        <asp:Button ID="btncerrareditprov"
                                                            CssClass="btn btn-danger rounded-3" runat="server"
                                                            Text="Cerrar" ValidationGroup="VG107" />

                                                    </ContentTemplate>

                                                </asp:UpdatePanel>
                                            </div>
                                            <asp:Label ID="lblcatedit" runat="server" Text="">
                                            </asp:Label>
                                        </asp:Panel>


                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="10px">
                                    <ItemTemplate>

                                        <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server"
                                            CommandName="Delete" ValidationGroup="VG108" ToolTip="Eliminar" Width="20px"
                                            Height="20px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <%--------------------------------------------------------------%>

                        <div class="tab-pane fade" id="pills-lstcpra" role="tabpanel"
                            aria-labelledby="pills-lstcpra-tab">

                            <asp:Button ID="addordcpra" runat="server" Text="Nueva Orden de compra"
                                OnClick="addordcpra_Click" CssClass="btn btn-success rounded-3" />

                            <asp:GridView ID="gvlstcpra" runat="server" CssClass="grid" ShowHeaderWhenEmpty="true"
                                class="table thead-dark" AutoGenerateColumns="false" BackColor="White"
                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                DataKeyNames="idcomp" OnRowCommand="gvlstcpra_RowCommand"
                                OnRowEditing="gvlstcpra_RowEditing" OnRowCancelingEdit="gvlstcpra_RowCancelingEdit"
                                OnRowUpdating="gvlstcpra_RowUpdating" OnRowDeleting="gvlstcpra_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("idcomp") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Proveedor">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("ProvName") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("dateTime") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="$">
                                        <ItemTemplate>
                                            <asp:Label Text=<%#:String.Format("{0:c}", Eval("importe"))%> runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                    <asp:TemplateField HeaderStyle-Width="10px" HeaderText="Opciones">
                                        <ItemTemplate>
                                            <asp:ImageButton ImageUrl="~/Images/plus.png" runat="server"
                                                ID="btnlstdet" Width="20px"
                                                OnClick="btnlstdet_Click" Height="20px"
                                                CommandArgument='<%#Eval("idcomp") %>' />


                                            <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server"
                                                CommandName="Delete" ToolTip="Eliminar"
                                                Width="20px" Height="20px" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>


                        </div>

                                <div class="tab-pane fade" id="pills-fact" role="tabpanel"
                                    aria-labelledby="pills-fact-tab">


                                    <asp:Button ID="Button8factopen" CssClass="btn btn-success rounded-3" runat="server"
                                        Text="Nueva Factura" OnClick="Button8factopen_Click" />

                                    <asp:GridView ID="gvfact" runat="server" CssClass="grid" ShowHeaderWhenEmpty="true"
                                        class="table thead-dark" AutoGenerateColumns="false" BackColor="White"
                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                        DataKeyNames="idcomp" OnRowCommand="gvfact_RowCommand"
                                        OnRowUpdating="gvfact_RowUpdating" OnRowDeleting="gvfact_RowDeleting">



                                        <Columns>

                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("stringn") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sucursal">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("descripcion") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Tipo de factura">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("Nombre") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Fecha">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("fechacomprobante") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Proveedor">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("ProvName") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total">
                                                <ItemTemplate>
                                                    <asp:Label Text=<%#:String.Format("{0:c}", Eval("importe"))%>
                                                        runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderStyle-Width="10px">
                                                <ItemTemplate>
                                                    <asp:ImageButton ImageUrl="~/Images/plus.png" runat="server"
                                                        ValidationGroup="VG7711" ID="btnlstdet1" Width="20px"
                                                        OnClick="btnlstdet1_Click" Height="20px"
                                                        CommandArgument='<%#Eval("idcomp") + "," + Eval("ProvID") %>' />

                                                </ItemTemplate>
                                            </asp:TemplateField>



                                            <asp:TemplateField HeaderStyle-Width="10px">
                                                <ItemTemplate>

                                                    <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server"
                                                        CommandName="Delete" ValidationGroup="VG1011" ToolTip="Eliminar"
                                                        Width="20px" Height="20px" ID="eliminarfact" />
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                        </Columns>
                                    </asp:GridView>
                                </div>



                                <%---------------------------------------------------------------------------------------------%>
                                    <div class="tab-pane fade" id="pills-pago" role="tabpanel"
                                        aria-labelledby="pills-pago-tab">

                                        <p></p>
                                        <h3>Pago de Facturas</h3>
                                        <p></p>

                                        <asp:Button runat="server" ID="btnpagofact"
                                            CssClass="btn btn-success rounded-3" Text="Realizar Pago" OnClick="btnpagofact_Click" />
                                       


                                        <asp:GridView ID="gvfactpag" runat="server" CssClass="grid"
                                            ShowHeaderWhenEmpty="true" class="table thead-dark"
                                            AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="3">

                                            <Columns>
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%# Eval("idcomp") %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                                <asp:TemplateField HeaderText="Forma">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%# Eval("descripcion") %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%# Eval("fechacomprobante") %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Proveedor">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%# Eval("ProvName") %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Importe">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%# Eval("importe") %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Opciones">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ID="btnverfactpago"
                                                            OnClick="btnverfactpago_Click2" ImageUrl="~/Images/lupa.png"
                                                            CommandArgument='<%#Eval("idcomp") %>' Height="20px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>










                                    </div>




                </div>

            </div>
            <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label>
            <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
            <asp:Label ID="lblconfirmardep" runat="server" Text=""></asp:Label>


        </asp:Content>