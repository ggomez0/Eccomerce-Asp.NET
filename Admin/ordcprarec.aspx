<%@ Page Title="Ordenes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ordcprarec.aspx.cs" Inherits="ShopGaspar.Admin.ordcprarec" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
         <p></p>
        <h1>Ordenes en estado borrador</h1>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvordcprarec" 
            ShowHeaderWhenEmpty="true" AutoGenerateColumns="true" OnRowUpdating="gvordcprarec_RowUpdating" DataKeyNames="idcomp, ProvID"> 
            <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Ver" CssClass="btn btn-success rounded-3" ID="btnvermasordcpraenv" CommandName="Update"   OnClick="btnvermasordcpraenv_Click" 
                            CommandArgument='<%#Eval("idcomp") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <%-- idcomp,descripcion,datetime,provid <---,  stringn(pedido de reposicion) activo--%>
    </div>
</asp:Content>
