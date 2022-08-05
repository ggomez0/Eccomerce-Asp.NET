<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="ShopGaspar.Account.OpenAuthProviders" %>

<div id="socialLoginList">
          <div>
    <h4>Utilice otro servicio para iniciar sesión.</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>            
            <p>
                <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>">
                    <img style="margin-right:10px"; height="50px"  alt="Inicie sesión con su cuenta de <%#: Item %>" src="../Images/<%#: Item %>.png" />
                     <%#: Item %>
                </button>
            </p>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>No existen servicios de autenticación externos configurados. Consulte <a href="https://go.microsoft.com/fwlink/?LinkId=252803">este artículo</a> para obtener información sobre cómo configurar esta aplicación ASP.NET para admitir el inicio de sesión a través de servicios externos.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>
    </div>
