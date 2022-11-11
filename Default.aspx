<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopGaspar.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div id="carouselExampleSlidesOnly" class="carousel container" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active" >
              <img class="d-block img-fluid" src="Images/carousel1.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="Images/carousel2.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="Images/carousel2.png" alt="Third slide">
            </div>
          </div>
         </div>
         <p>

         </p>
    <div class="container">
         <div class="row">
  <div class="col-sm">
    <div class="card">
          <img class="card-img-top" src="Images/gabinetesdefault.jpg" style="width:100%; height:250px" alt="Card image cap">

      <div class="card-body">
        <h5 class="card-title text-center">Gabinetes</h5>

      </div>
    </div>
  </div>
  <div class="col-sm">
    <div class="card">
          <img class="card-img-top" src="Images/perifericosdefault.jpg" style="width:100%; height:250px;"  alt="Card image cap">

      <div class="card-body">
        <h5 class="card-title text-center">Perifericos</h5>
      </div>
    </div>
  </div>
             <div class="col-sm">
    <div class="card">
          <img class="card-img-top" src="Images/monitoresdefault.jpg" style="width:100%; height:250px;"  alt="Card image cap">

      <div class="card-body">
        <h5 class="card-title text-center">Monitores</h5>
      </div>
    </div>
  </div>
</div>
</div>
</asp:Content>