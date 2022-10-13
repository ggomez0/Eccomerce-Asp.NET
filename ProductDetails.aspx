<%@ Page Title="Detalle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ShopGaspar.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
    <asp:FormView ID="productDetail" runat="server" ItemType="ShopGaspar.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
     <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                        <img class="card-img-top mb-5 mb-md-0" src="/Images/Thumbs/<%#:Item.ImagePath %>" alt="..." />
                    </div>
                    <div class="col-md-6">
                        <div class="small mb-1">
                            ID Producto:&nbsp;<%#:Item.ProductID %>
                        </div>
                        <h1 class="display-5 fw-bolder">
                            <%#:Item.ProductName %>
                        </h1>
                        <div class="fs-5 mb-5">          
                            <span>&nbsp;<%#: String.Format("{0:c}", Item.UnitPrice) %></span>
                        </div>
                        <p class="lead">
                            <%#:Item.Description %>
                        </p><br />
                        <div class="d-flex"> 
                            <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>" class="btn btn-outline-dark flex-shrink-0">                           
                                <b>Agregar al Carrito<b>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
               </ItemTemplate>
    </asp:FormView>
          <%--Productos relacionados--%>
           
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Tambien tenemos estos productos</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

              <%----------------------------------------------------------------------------------------------------------------------%>
                    <asp:FormView ID="FormView2" runat="server" ItemType="ShopGaspar.Models.Product" SelectMethod ="GetProduct1" RenderOuterTable="false">
                        <ItemTemplate>                    
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="/Images/Thumbs/<%#:Item.ImagePath %>" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"><%#:Item.ProductName %></h5>
                                            <!-- Product price-->
                                            <%#: String.Format("{0:c}", Item.UnitPrice) %>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">Agregar al carro</a></div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                </asp:FormView>
                  <%----------------------------------------------------------------------------------------------------------------------%>
                     <asp:FormView ID="FormView1" runat="server" ItemType="ShopGaspar.Models.Product" SelectMethod ="GetProduct2" RenderOuterTable="false">
                        <ItemTemplate>                    
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="/Images/Thumbs/<%#:Item.ImagePath %>" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"><%#:Item.ProductName %></h5>
                                            <!-- Product price-->
                                            <%#: String.Format("{0:c}", Item.UnitPrice) %>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">Agregar al carro</a></div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                </asp:FormView>

                     <asp:FormView ID="FormView3" runat="server" ItemType="ShopGaspar.Models.Product" SelectMethod ="GetProduct3" RenderOuterTable="false">
                        <ItemTemplate>                    
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="/Images/Thumbs/<%#:Item.ImagePath %>" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"><%#:Item.ProductName %></h5>
                                            <!-- Product price-->
                                            <%#: String.Format("{0:c}", Item.UnitPrice) %>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">Agregar al carro</a></div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                </asp:FormView>
                     <asp:FormView ID="FormView4" runat="server" ItemType="ShopGaspar.Models.Product" SelectMethod ="GetProduct4" RenderOuterTable="false">
                        <ItemTemplate>                    
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="/Images/Thumbs/<%#:Item.ImagePath %>" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"><%#:Item.ProductName %></h5>
                                            <!-- Product price-->
                                            <%#: String.Format("{0:c}", Item.UnitPrice) %>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">Agregar al carro</a></div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                </asp:FormView>



                            
                        </div>
                    </div>
                </div>
            </div>
        </section>

            
</asp:Content>
