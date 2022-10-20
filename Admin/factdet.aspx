<%@ Page Title="Detalle Factura" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Admin/factdet.aspx.cs" Inherits="ShopGaspar.Admin.factdet" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="container">
                   <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">DETALLE DE LA FACTURA N°</asp:Label>
<p></p>
                       



        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvlstcompradet" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" 
            DataKeyNames="idcomprdet"  OnRowDeleting="gvlstcompradet_RowDeleting">
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
