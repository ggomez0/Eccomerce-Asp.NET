<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransaccionesAdmin.aspx.cs" Inherits="ShopGaspar.Admin.TransaccionesAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:gridview class="table thead-dark" CssClass="grid"
                                                            ID="tablatrans" runat="server" AutoGenerateColumns="false"
                                                            ShowHeaderWhenEmpty="true" BackColor="White"
                                                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                                            CellPadding="3">
                                                            <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
                                                     
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="ID">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%# Eval("OrderId") %>'
                                                                            runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Fecha">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%# Eval("OrderDate") %>'
                                                                            runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Usuario">
                                                                    <ItemTemplate>
                                                                        <asp:Label Text='<%# Eval("Username") %>'
                                                                            runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Detalles">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ValidationGroup="ordenesval"
                                                                            ImageUrl="~/Images/lupa.png" ID="imgordenes"
                                                                            runat="server"
                                                                            CommandArgument='<%#Eval("OrderId") %>'
                                                                            OnClick="imgordenes_Click" Width="20px"
                                                                            Height="20px" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>

                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>

</asp:Content>
