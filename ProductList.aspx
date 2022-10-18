<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ShopGaspar.ProductList"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="container" style="text-align:center; ">
     
         <table><tr><td>
      <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryName">
        <asp:ListItem Text="Todas las Categorias" Value="" />
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShopGaspar %>"
        SelectCommand="select distinct CategoryName from Products p inner join categories c on c.CategoryID=p.CategoryID"></asp:SqlDataSource>

      <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" type="submit" Text="Buscar" OnClick="btnSearch_Click" CssClass="rounded-3 btn-success" />      
   </td></tr></table> <p></p>
       <div style="">
    <asp:ListView ID="productlist" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="4">
        <AlternatingItemTemplate>
          <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>">
                                        <div class="" style="width: 18rem;">       
                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>"  style="height:10rem; object-fit:contain;" />
                                         </a>

                                            <div class="card-body">
                                                <h5 href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>" class="card-title">
                                                    <span>
                                                        <%#:Eval("ProductName")%>                                               
                                                    </span>
                                                </h5>

                                                <p class="card-text"></b><%#:String.Format("{0:c}", Eval("UnitPrice"))%></p>
                                                <a href="/AddToCart.aspx?productID=<%#:Eval("ProductID") %>" class="btn btn-success rounded-3" style="font-family:Calibri">
                                                    <b>Agregar al Carrito<b>
                                                </a>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
        </AlternatingItemTemplate>

        <EditItemTemplate>
          <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>">
                                        <div class="" style="width: 18rem;">       
                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>"  style="height:10rem; object-fit:contain;" />
                                         </a>

                                            <div class="card-body">
                                                <h5 href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>" class="card-title">
                                                    <span>
                                                        <%#:Eval("ProductName")%>                                               
                                                    </span>
                                                </h5>

                                                <p class="card-text"></b><%#:String.Format("{0:c}", Eval("UnitPrice"))%></p>
                                                <a href="/AddToCart.aspx?productID=<%#:Eval("ProductID") %>" class="btn btn-success rounded-3" style="font-family:Calibri">
                                                    <b>Agregar al Carrito<b>
                                                </a>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
        </EditItemTemplate>

        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No se encontraron productos.</td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>

        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>

        <InsertItemTemplate>
          <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>">
                                        <div class="" style="width: 18rem;">       
                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>"  style="height:10rem; object-fit:contain;" />
                                         </a>

                                            <div class="card-body">
                                                <h5 href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>" class="card-title">
                                                    <span>
                                                        <%#:Eval("ProductName")%>                                               
                                                    </span>
                                                </h5>

                                                <p class="card-text"></b><%#:String.Format("{0:c}", Eval("UnitPrice"))%></p>
                                                <a href="/AddToCart.aspx?productID=<%#:Eval("ProductID") %>" class="btn btn-success rounded-3" style="font-family:Calibri">
                                                    <b>Agregar al Carrito<b>
                                                </a>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
        </InsertItemTemplate>

        <ItemTemplate>
            <td runat="server">
                       <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>">
                                        <div class="" style="width: 18rem;">       
                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>"  style="height:10rem; object-fit:contain;" />
                                         </a>

                                            <div class="card-body">
                                                <h5 href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>" class="card-title">
                                                    <span>
                                                        <%#:Eval("ProductName")%>                                               
                                                    </span>
                                                </h5>

                                                <p class="card-text"></b><%#:String.Format("{0:c}", Eval("UnitPrice"))%></p>
                                                <a href="/AddToCart.aspx?productID=<%#:Eval("ProductID") %>" class="btn btn-success rounded-3" style="font-family:Calibri">
                                                    <b>Agregar al Carrito<b>
                                                </a>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
        </ItemTemplate>

        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server" style="position:center;">
                    <td runat="server">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="24">
                            <Fields >
                                    <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="page-item" CurrentPageLabelCssClass="page-item disabled" NextPreviousButtonCssClass="page-item" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>

  
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4" GroupItemCount="4">
        <AlternatingItemTemplate>
          <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>">
                                        <div class="" style="width: 18rem;">       
                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>"  style="height:10rem; object-fit:contain;" />
                                         </a>

                                            <div class="card-body">
                                                <h5 href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>" class="card-title">
                                                    <span>
                                                        <%#:Eval("ProductName")%>                                               
                                                    </span>
                                                </h5>

                                                <p class="card-text"></b><%#:String.Format("{0:c}", Eval("UnitPrice"))%></p>
                                                  <a href="/AddToCart.aspx?productID=<%#:Eval("ProductID") %>" class="btn btn-success rounded-3" style="font-family:Calibri">
                                                    <b>Sin Stock<b>
                                                </a>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
        </AlternatingItemTemplate>

        <EditItemTemplate>
          <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>">
                                        <div class="" style="width: 18rem;">       
                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>"  style="height:10rem; object-fit:contain;" />
                                         </a>

                                            <div class="card-body">
                                                <h5 href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>" class="card-title">
                                                    <span>
                                                        <%#:Eval("ProductName")%>                                               
                                                    </span>
                                                </h5>

                                                <p class="card-text"></b><%#:String.Format("{0:c}", Eval("UnitPrice"))%></p>
                                                <a href="/AddToCart.aspx?productID=<%#:Eval("ProductID") %>" class="btn btn-success rounded-3" style="font-family:Calibri">
                                                    <b>Sin Stock<b>
                                                </a>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
        </EditItemTemplate>

        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No se encontraron productos.</td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>

        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>

        <InsertItemTemplate>
          <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>">
                                        <div class="" style="width: 18rem;">       
                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>"  style="height:10rem; object-fit:contain;" />
                                         </a>

                                            <div class="card-body">
                                                <h5 href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>" class="card-title">
                                                    <span>
                                                        <%#:Eval("ProductName")%>                                               
                                                    </span>
                                                </h5>

                                                <p class="card-text"></b><%#:String.Format("{0:c}", Eval("UnitPrice"))%></p>
                                                 <a href="/AddToCart.aspx?productID=<%#:Eval("ProductID") %>" class="btn btn-success rounded-3" style="font-family:Calibri">
                                                    <b>Sin Stock<b>
                                                </a>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
        </InsertItemTemplate>

        <ItemTemplate>
            <td runat="server">
                       <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>">
                                        <div class="" style="width: 18rem;">       
                                                <img class="card-img-top" src="/Images/Thumbs/<%#:Eval("ImagePath") %>"  style="height:10rem; object-fit:contain;" />
                                         </a>

                                            <div class="card-body">
                                                <h5 href="ProductDetails.aspx?productID=<%#:Eval("ProductID")%>" class="card-title">
                                                    <span>
                                                        <%#:Eval("ProductName")%>                                               
                                                    </span>
                                                </h5>

                                                <p class="card-text"></b><%#:String.Format("{0:c}", Eval("UnitPrice"))%></p>
                                                <a href="/AddToCart.aspx?productID=<%#:Eval("ProductID") %>" class="btn btn-success rounded-3" style="font-family:Calibri">
                                                    <b>Sin Stock<b>
                                                </a>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
        </ItemTemplate>

        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server" style="position:center;">
                    <td runat="server">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="24">
                            <Fields >
                                    <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="page-item" CurrentPageLabelCssClass="page-item disabled" NextPreviousButtonCssClass="page-item" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShopGaspar %>"
        SelectCommand="SELECT [ProductID], [ImagePath], [ProductName], [UnitPrice] from Products p inner join categories c on c.CategoryID=p.CategoryID WHERE ([ProductName] LIKE '%' + @ProductName + '%') AND (CategoryName = @CategoryName OR ISNULL(@CategoryName,'') = '') and stock>0">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtsearch" Name="ProductName" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="DropDownList1" Name="CategoryName" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false" />
        </SelectParameters>
    </asp:SqlDataSource> 

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ShopGaspar %>"
        SelectCommand="SELECT [ProductID], [ImagePath], [ProductName], [UnitPrice] from Products p inner join categories c on c.CategoryID=p.CategoryID WHERE ([ProductName] LIKE '%' + @ProductName + '%') AND (CategoryName = @CategoryName OR ISNULL(@CategoryName,'') = '') and stock<=0">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtsearch" Name="ProductName" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="DropDownList1" Name="CategoryName" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false" />
        </SelectParameters>
    </asp:SqlDataSource> 
</div>
  </div>
</asp:Content>