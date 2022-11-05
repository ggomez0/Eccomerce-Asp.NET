<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ShopGaspar.Admin.Reportes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        
        
        <h3>Reportes</h3>

        <hr />

        <h6>Ingresos</h6>
        
 
        <div style="width:100%;overflow-x:auto; border-style:none">
            <cc1:BarChart ID="BarChart2" runat="server" ChartHeight="400" ChartType="Column" visible="true" BorderColor="White" BorderStyle="None" BorderWidth="0px" >
            </cc1:BarChart>
            
        
        </div>
        <p></p>

        <h6>Egresos</h6>
     <div style="width:100%;overflow-x:auto; border-style:none">
            <cc1:BarChart ID="BarChart1" runat="server" ChartHeight="400" ChartType="Column" visible="true" BorderColor="White" BorderStyle="None" BorderWidth="0px" >
            </cc1:BarChart>
            </div>
        
        </div>
 
        
</asp:Content>
