<%@ Page Title="Lista de compra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="lstcompradet.aspx.cs" Inherits="ShopGaspar.Admin.lstcompradet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black">Productos</asp:Label>
         <h3>Seleccione los productos para agregarlos a la lista</h3>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" 
            ID="gvproductoslista" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" 
            DataKeyNames="ProductID"     OnRowUpdating="gvproductoslista_RowUpdating">
             <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                   <asp:Button ID="btnupdateinsert"
                        runat="server" Font-Size="Large" Font-Bold="true"
                        Text="+"
                        CommandName="Update"
                        CausesValidation="true"
                        ValidationGroup="VG31" CssClass="btn btn-success rounded-3" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>
          <p></p>
         <p></p>

         <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DE LA ORDEN N°</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvlstcompradet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" 
            DataKeyNames="lstcpradetid"  OnRowDeleting="gvlstcompradet_RowDeleting">
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
