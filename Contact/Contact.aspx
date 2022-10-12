<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ShopGaspar.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

         
        <div class="container">          
          <div class="row align-items-center">
            <div class="col-lg-7 mb-5 mb-lg-0"><br>
              <h2 class="mb-5">Contactanos. <br> Rellene el formulario.</h2>
              <form class="border-right pr-5 mb-5" method="post" id="contactForm" name="contactForm">
                <div class="row">
                  <div class="col-md-6 form-group">
                    
                      <asp:TextBox runat="server" type="text" class="form-control" name="txtNombre" id="txtNombre" placeholder="Nombre"/>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Requerido" ControlToValidate="txtNombre"/>
                  </div>
                  <div class="col-md-6 form-group">
                     <asp:TextBox runat="server" type="text" class="form-control" name="txtApe" id="txtApe" placeholder="Apellido"/>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Requerido" ControlToValidate="txtApe"/><br>                      
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 form-group">
                     <asp:TextBox runat="server" type="text" class="form-control" name="txtemail" id="txtemail" placeholder="Email"/>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Requerido" ControlToValidate="txtemail"/><br>
                  </div>
                </div>

                <div class="row" style="margin-right:15%;">
                  <div class="col-md-12 form-group" >
                     <asp:TextBox  runat="server" class="form-control" name="txtmessage" id="txtmessage" cols="30" rows="7" placeholder="Escriba su mensaje" TextMode="MultiLine"/>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Requerido" ControlToValidate="txtmessage"/><br>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <asp:button runat="server" text="ENVIAR MENSAJE" OnClick="Unnamed_Click" class="btn btn-primary rounded-0 py-2 px-4"/><br>
                  </div>
                </div>
              </form> <br>
              <asp:label runat="server" name="lblConfirmacion" id="lblConfirmacion"/><br>
             

            </div>
            <div class="col-lg-4 ml-auto " >
              <h3 class="mb-4">Otras formas de contactarnos...</h3>
                <a href="https://wa.me/3876291369" style="text-decoration:none">
                    <img src="../Images/whatsapp.png" style="height:60px; width:60px;" />
                 
                </a> Mandanos un Whatsapp
                <p></p>
             
                    <img src="../Images/phone.png" style="height:60px; width:60px; "  />
               &nbsp +54 (387)6291369
                 <p></p>
                
                    <img src="../Images/email.png" style="height:70px; width:70px;" />
                 admin@gamersalta.com
             
            </div>
          </div>
            </div>
</asp:Content>
