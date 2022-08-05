<%@ Page Title="Carro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="ShopGaspar.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container body-content">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1>Carro de Compras</h1></div>
    <p></p> 
  
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="ShopGaspar.Models.CartItem" SelectMethod="GetShoppingCartItems" 
        CssClass="table table-striped" >   
        <Columns>
        <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID"/>        
        <asp:BoundField DataField="Product.ProductName" HeaderText="Nombre" />        
        <asp:BoundField DataField="Product.UnitPrice" HeaderText="Precio Unitario" DataFormatString="{0:c}"/>     
        
            <asp:TemplateField   HeaderText="Cantidad">            
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox> 
                </ItemTemplate>        
        </asp:TemplateField>    
        
            <asp:TemplateField HeaderText="Total">            
                <ItemTemplate> 
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>        
        </asp:TemplateField>
            
        <asp:TemplateField HeaderText="Borrar">            
                <ItemTemplate>
                    <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
<%--                    <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" ID="imgremove" OnClick="imgremove_Click" ToolTip="Eliminar" Width="20px" Height="20px"/>--%>

                </ItemTemplate>        
        </asp:TemplateField>    
        </Columns>    
    </asp:GridView>

    <div>
        <p></p>
        <strong >
            <asp:Label ID="LabelTotalText" runat="server" Text="Total a Pagar: " Font-Bold="true"></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false" Font-Bold="true"></asp:Label>
            
        </strong> 
       
    </div>

    <br />
    <table> 
    <tr>
      <td>
        <asp:Button class="btn btn-outline-dark flex-shrink-0" ID="UpdateBtn" runat="server" Text="Actualizar Carrito" OnClick="UpdateBtn_Click" />
      </td>
      <td>

        <!--Checkout Placeholder -->
          <div style="margin-left:50px";>
          
             
      <asp:Button runat="server" class="btn btn-outline-dark flex-shrink-0" ID="Pagarbtn" Text="Pagar Orden" onclick="Pagarbtn_Click" />
         
              </div>
      </td>
    </tr>
    </table>
        </div>
</asp:Content>
