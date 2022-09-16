<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientesAdmin.aspx.cs" Inherits="ShopGaspar.Admin.ClientesAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>
                                                            <asp:GridView class="table thead-dark" ID="tablausers"
                                                                runat="server" CssClass="grid"
                                                                AutoGenerateColumns="false" BorderStyle="None"
                                                                BorderWidth="1px" CellPadding="3"
                                                                ShowHeaderWhenEmpty="true" BackColor="White"
                                                                BorderColor="#CCCCCC">
                                                                <HeaderStyle BackColor="black" Font-Bold="True"
                                                                ForeColor="White"  />
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Usuario">
                                                                        <ItemTemplate>
                                                                            <asp:Label Text='<%# Eval("Username") %>'
                                                                                runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Email">
                                                                        <ItemTemplate>
                                                                            <asp:Label Text='<%# Eval("Email") %>'
                                                                                runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Detalles">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ValidationGroup="valord1"
                                                                                ImageUrl="~/Images/lupa.png" ID="imgord"
                                                                                runat="server"
                                                                                CommandArgument='<%#Eval("Username") %>'
                                                                                OnClick="imgord_Click" Width="20px"
                                                                                Height="20px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                </Columns>

                                                            </asp:GridView>

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
</asp:Content>
