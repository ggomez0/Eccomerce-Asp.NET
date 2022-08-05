    <%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ShopGaspar.Admin.AdminPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div >
    <h1 style="text-align:center;">Administracion</h1>
    <hr />

<%--//////////////////////////////////////////////////--%>

       <div class="row">
        <div class="col-2">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
               
                <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-cat" role="tab" aria-controls="v-pills-cat" aria-selected="true">Categoria</a>
                <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-prod" role="tab" aria-controls="v-pills-prod" aria-selected="false">Productos</a>
                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-trans" role="tab" aria-controls="v-pills-trans" aria-selected="false">Transacciones</a>
                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-cli" role="tab" aria-controls="v-pills-cli" aria-selected="false">Clientes</a>
                <a class="nav-link" id="v-pills-estat-tab" data-toggle="pill" href="#v-pills-stat" role="tab" aria-controls="v-pills-stat" aria-selected="false">Estadisticas</a>
            </div>
        </div>
      
       
            <div class="col-9">
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="v-pills-cat" role="tabpanel" aria-labelledby="v-pills-cat-tab">                       
                        <h3>Agregar Categoria:</h3>
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox ID="AddCategoria" runat="server"></asp:TextBox>    
                                    <asp:Button ID="AddCat" runat="server" Text="Agregar" OnClick="AddCat_Click"  CausesValidation="true" ValidationGroup="VG1"/>
                               
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Font-Bold="true" Text="*Nombre de Categoria requerida" ControlToValidate="AddCategoria" SetFocusOnError="true" Display="Dynamic" ValidationGroup="VG1"></asp:RequiredFieldValidator>    
                                </td>
                            </tr>
                                <tr>
                                  <td>    <asp:Label ID="lbladdcatstatus" runat="server" Text=""></asp:Label>
                                
                                      </td></tr>                              

                        </table>
                        <p></p>
                        <p></p>
                            <h3>Eliminar Categoria:</h3>
                        <table>
                            <tr>
                                <td> 
                                    <asp:Label ID="lblCat" runat="server">Categoria:</asp:Label>
                               <asp:TextBox ID="txtContactsSearch" runat="server" AutoPostBack="true" AutoCompleteType="Search"></asp:TextBox>
                                <cc1:AutoCompleteExtender  ID="AutoCompleteExtender1" runat="server" ServiceMethod="CategorySearch"
                                    MinimumPrefixLength="1" CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="txtContactsSearch" FirstRowSelected="false" ServicePath="dropdownlist.asmx">
                                    </cc1:AutoCompleteExtender></td>                       
                            </tr>
                        </table>
                        <p></p>
                        <asp:Button ID="btnremcat" runat="server" Text="Remover Categoria" OnClick="btnremcat_Click" CausesValidation="false"/>
                        <asp:Label ID="lblsuccat" runat="server" Text=""></asp:Label>


                    </div>
                   
                            <div class="tab-pane fade" id="v-pills-prod" role="tabpanel" aria-labelledby="v-pills-prod-tab">
                        <h3>Agregar producto:</h3>
                        <table>
                            <tr><td>
                              <asp:Label ID="LabelAddCategory" runat="server">Categoria:</asp:Label></td>
                                <td>
                                    <asp:DropDownList ID="DropDownAddCategory" runat="server" 
                                        ItemType="ShopGaspar.Models.Category" 
                                        SelectMethod="GetCategories" DataTextField="CategoryName" 
                                        DataValueField="CategoryID" >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="LabelAddName" runat="server">Nombre:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="AddProductName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="VG2" ID="RequiredFieldValidator1" runat="server" Text="* Nombre del producto requerido." ControlToValidate="AddProductName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="LabelAddDescription" runat="server">Descripcion:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="AddProductDescription" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="VG2" ID="RequiredFieldValidator2" runat="server" Text="* Descripcion requerida." ControlToValidate="AddProductDescription" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="LabelAddPrice" runat="server">Precio:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="AddProductPrice" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="* Precio requerido." ControlToValidate="AddProductPrice" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="VG2" ID="RegularExpressionValidator1" runat="server" Text="* Valor numerico sin $" ControlToValidate="AddProductPrice" SetFocusOnError="True" Display="Dynamic" ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblstock" runat="server">Stock:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtstock" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Text="* Stock requerido." ControlToValidate="txtstock" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="VG2" ID="RegularExpressionValidator2" runat="server" Text="* Debe ser valor numerico" ControlToValidate="txtstock" SetFocusOnError="True" Display="Dynamic" ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="LabelAddImageFile" runat="server">Imagen:</asp:Label></td>
                                <td>
                                    <asp:FileUpload ID="ProductImage" runat="server" />
                                    <asp:RequiredFieldValidator ValidationGroup="VG2" ID="RequiredFieldValidator4" runat="server" Text="* Imagen requerida." ControlToValidate="ProductImage" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <p></p>
                        <p></p>

                        <asp:Button ID="AddProductButton" runat="server" Text="Agregar Producto" OnClick="AddProductButton_Click"  CausesValidation="true" ValidationGroup="VG2"/>
                        <asp:Label ID="LabelAddStatus" runat="server" Text=""></asp:Label>

                        <p></p>
                                <br />
                                <br />
                                <p></p>
                                <h3>Editar y Eliminar productos</h3>
                           <div>
 <asp:UpdatePanel ID="wer123" runat="server">
                        <ContentTemplate>

            <asp:GridView ID="gridproductos" runat="server" ShowFooter="true" DataKeyNames="ProductID"
                ShowHeaderWhenEmpty="true" class="table thead-dark" AutoGenerateColumns="false"

                OnRowCommand="gridproductos_RowCommand" OnRowEditing="gridproductos_RowEditing" OnRowCancelingEdit="gridproductos_RowCancelingEdit"
                OnRowUpdating="gridproductos_RowUpdating" OnRowDeleting="gridproductos_RowDeleting"

       BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                
                <Columns>
                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProductName" Text='<%# Eval("ProductName") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripcion">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Description") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" Text='<%# Eval("Description") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ImagePath">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ImagePath") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtImagePath" Text='<%# Eval("ImagePath") %>' Width="85%" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("UnitPrice") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUnitPrice" Width="80%" Text='<%# Eval("UnitPrice") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stock">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("stock") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtstock" Text='<%# Eval("stock") %>' Width="80%" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vendido">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("vendido") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Categoria">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("CategoryID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                   
                            <asp:TextBox ID="txtctid" Text='<%# Eval("CategoryID") %>' Width="50%" runat="server" />

                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" ValidationGroup="Vagos" CommandName="Edit" ToolTip="Editar" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ValidationGroup="Vagos" ToolTip="Eliminar" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ValidationGroup="Vagos" ToolTip="Actualizar" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ValidationGroup="Vagos" ToolTip="Cancelar" Width="20px" Height="20px"/>
                        </EditItemTemplate>                
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
            <br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />

        </div>
                    </div>

                <%--------------------------------------------------%>

                    <div class="tab-pane fade" id="v-pills-trans" role="tabpanel" aria-labelledby="v-pills-trans-tab">
                           
                        <div class="">  
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                            <asp:gridview class="table thead-dark" CssClass="grid" ID="tablatrans" runat="server" 
                                AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" BackColor="White" 
                                BorderColor="#CCCCCC"  BorderStyle="None" BorderWidth="1px" CellPadding="3">            
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />  
                                <Columns>
                                     <asp:TemplateField HeaderText="ID">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("OrderId") %>' runat="server" />
                                            </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("OrderDate") %>' runat="server" />
                                            </ItemTemplate>
                                    </asp:TemplateField>    
                                      <asp:TemplateField HeaderText="Usuario">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Username") %>' runat="server" />
                                            </ItemTemplate>
                                    </asp:TemplateField> 
                                   <%--  <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Total") %>' runat="server" />
                                            </ItemTemplate>
                                    </asp:TemplateField> --%>
                                    <asp:TemplateField HeaderText="Detalles">
                                            <ItemTemplate>
                                                <asp:ImageButton ValidationGroup="ordenesval" ImageUrl="~/Images/lupa.png" ID="imgordenes" runat="server"  CommandArgument='<%#Eval("OrderId") %>' OnClick="imgordenes_Click" Width="20px" Height="20px"/>
                                            </ItemTemplate>
                                    </asp:TemplateField>
                            
                                </Columns> 
                
                            </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                        </div>
                    </div>
                <%--------------------------------------------------%>

                    <div class="tab-pane fade" id="v-pills-cli" role="tabpanel" aria-labelledby="v-pills-cli-tab">

                        <div class="">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                               <asp:GridView class="table thead-dark" ID="tablausers" runat="server" CssClass="grid"
                                AutoGenerateColumns="false" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowHeaderWhenEmpty="true" BackColor="White" BorderColor="#CCCCCC">
                                    <Columns>
                                     <asp:TemplateField HeaderText="Usuario">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Username") %>' runat="server" />
                                            </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Email") %>' runat="server" />
                                            </ItemTemplate>
                                    </asp:TemplateField>             
                                    <asp:TemplateField HeaderText="Detalles">
                                            <ItemTemplate>
                                                <asp:ImageButton ValidationGroup="valord1" ImageUrl="~/Images/lupa.png" ID="imgord" runat="server"  CommandArgument='<%#Eval("Username") %>' OnClick="imgord_Click" Width="20px" Height="20px"/>
                                            </ItemTemplate>
                                    </asp:TemplateField>
                            
                                </Columns>   
                              
                            </asp:GridView>

                                </ContentTemplate>
                                </asp:UpdatePanel>

                        </div>
                    </div> 
                    

                 <div class="tab-pane fade" id="v-pills-stat" role="tabpanel" aria-labelledby="v-pills-stat-tab">
                     <asp:GridView ID="gvstat" BorderStyle="None" runat="server" CssClass="grid" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true">

                     </asp:GridView>
                </div>
                
                
                </div>
            </div>
       </div>   
    <p></p> 
</div>
 </asp:Content>