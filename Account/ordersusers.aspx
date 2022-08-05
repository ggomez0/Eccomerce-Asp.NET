<%@ Page Title="Ordenes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ordersusers.aspx.cs" Inherits="ShopGaspar.Account.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
         <h1>Ordenes realizadas</h1>
         <asp:GridView ID="gvorderuser" CssClass="grid" class="table thead-dark" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" Width="100%"  BorderStyle="None">
             
             <Columns>
                 <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lbl123" Text='<%# Eval("OrderId") %>' runat="server" />
                        </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("OrderDate") %>' runat="server" />
                        </ItemTemplate>
                </asp:TemplateField> 
               
                <asp:TemplateField HeaderText="Detalles">
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/lupa.png" ID="imgbtn" runat="server"  CommandArgument='<%#Eval("OrderId") %>' OnClick="imgbtnorderuser_Click" Width="20px" Height="20px"/>
                        </ItemTemplate>
                </asp:TemplateField>
                            
            </Columns>   
        </asp:GridView> 
    </div>
</asp:Content>
