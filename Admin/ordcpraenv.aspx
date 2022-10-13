<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ordcpraenv.aspx.cs" Inherits="ShopGaspar.Admin.ordcpraenv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container">
        <asp:Label runat="server" Font-Size="2em" Font-Bold="true" ForeColor="Black" ID="lblord">Ordenes Enviadas</asp:Label>
        <asp:GridView runat="server" CssClass="grid" BorderStyle="None" ID="gvordcpraenv" ShowHeaderWhenEmpty="true" AutoGenerateColumns="true">
             <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
        <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Ver" CssClass="btn btn-success rounded-3" ID="btnvermasordcpra" OnClick="btnvermasordcpra_Click1" CommandArgument='<%#Eval("idcomp") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
