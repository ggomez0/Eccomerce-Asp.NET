    <%@ Page Title="Bienvenido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopGaspar._Default" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" >
    
      <div id="carouselExampleSlidesOnly" class="carousel container" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active" >
              <img class="d-block img-fluid" src="Images/carne1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="Images/carne2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="Images/carne3.jpg" alt="Third slide">
            </div>
          </div>
        </div>



     <br /> <br /> <br />

    <div class="container marketing">
        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">Carniceria. <span class="text-muted">La mejor carne.</span></h2>
            <p class="lead">Con una carne de primera calidad, nos aliamos con GOMBU para traer a la comunidad de San lorenzo Carne envasada, fresca y barata</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" alt="carne,carniceria" style="width:100% ;" src="Images/carnes.jpg" data-holder-rendered="true">
          </div>
        </div>

        <br /> <br /> <br />

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading">Almacen. <span class="text-muted">Cualquier producto que te falte.</span></h2>
            <p class="lead">En el Almacen EL PUENTE, tenemos una amplia variedad de productos de alacena. Ayudandole al cliente a realizar la mejor compra para su dia a dia.</p>
          </div>
          <div class="col-md-5 order-md-1">
            <img class="featurette-image img-fluid mx-auto" alt="almacen" style="width: 100%;" src="Images/Almacen.jpg" data-holder-rendered="true">
          </div>
        </div>

         <br /> <br /> <br />

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">Verduleria. <span class="text-muted">Fruta Verdura fresca.</span></h2>
            <p class="lead">Verdura y fruta fresca, dia a dia fruta preseleccionada. </p>
          </div>
          <div class="col-md-5">
              <img class="featurette-image img-fluid mx-auto" alt="verduleria,fruta,verdura" style="width: 100%;" src="Images/verduleria.jpg" data-holder-rendered="true">
          </div>
        </div>    
    </div>
</asp:Content>
