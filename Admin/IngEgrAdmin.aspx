<%@ Page Title="Movimientos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IngEgrAdmin.aspx.cs" Inherits="ShopGaspar.Admin.IngEgrAdmin" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
           <asp:UpdatePanel runat="server">
                                            <ContentTemplate>

                                                <h3>Realizar movimientos de stock</h3>
                                                <table>
                                                    <tr>
                                                        <td>

                                                            <asp:RadioButtonList ID="rblistlist" runat="server">

                                                                <asp:ListItem>Ingreso</asp:ListItem>
                                                                <asp:ListItem>Egreso</asp:ListItem>

                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server">Producto:</asp:Label>
                                                        </td>
                                                        <td>


                                                            <asp:TextBox ID="txtacproddep" runat="server"
                                                                AutoPostBack="true" AutoCompleteType="Search">
                                                            </asp:TextBox>
                                                            <cc1:AutoCompleteExtender ID="AutoCompleteExtender2"
                                                                runat="server" ServiceMethod="ProductSearch"
                                                                MinimumPrefixLength="1" CompletionInterval="100"
                                                                EnableCaching="false" CompletionSetCount="10"
                                                                TargetControlID="txtacproddep" FirstRowSelected="false"
                                                                ServicePath="dropdownlist.asmx">
                                                            </cc1:AutoCompleteExtender>


                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server">Cantidad:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtcantdep" runat="server" TextMode="Number"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14"
                                                                runat="server" Text="* campo requerido."
                                                                ControlToValidate="txtcantdep" ValidationGroup="VG21" SetFocusOnError="true"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                                                ControlToValidate="txtcantdep" ErrorMessage="Debe ser &gt; 0"
                                                                Operator="GreaterThan" Type="Integer" ValueToCompare="0" />
                                                            
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server">Deposito:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlistdep" runat="server"
                                                                ItemType="ShopGaspar.Models.depositos"
                                                                SelectMethod="GetDepositos" DataTextField="DepName"
                                                                DataValueField="DepID">
                                                            </asp:DropDownList>

                                                             
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server">Observaciones:
                                                            </asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtobsdep" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ValidationGroup="VG21"
                                                                ID="RequiredFieldValidator10" runat="server"
                                                                Text="* Observaciones requerida."
                                                                ControlToValidate="txtobsdep" SetFocusOnError="true"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>

                                                </table>
                                                <p></p>
                                                <p></p>

                                                <asp:Button ID="btndepexis" runat="server"
                                                    Text="Realizar movimiento de existencias"
                                                    OnClick="btndepexis_Click1" CausesValidation="true"
                                                    ValidationGroup="VG21" CssClass="btn btn-success rounded-3" />
                                                <asp:Label ID="lblprodendep" runat="server" Text=""></asp:Label>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>

    </div>
</asp:Content>
