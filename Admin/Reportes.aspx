<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ShopGaspar.Admin.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        google.charts.setOnLoadCallback(drawChart1);
        google.charts.setOnLoadCallback(drawChart2);

        function drawChart() {

            var data = new google.visualization.arrayToDataTable(<%=this.datosql1()%>);
            var options = {
                title: 'Balance GAMERSALTA',
                backgroundColor: { fill: "white" },
                legend: { position: "labeled", textStyle: { color: "black", fontSize: 12 } },
                tooltip: { textStyle: { color: "black" }, showColorCode: true },
                colors: ["blue", "red", "yellow"],   
                bar: { groupWidth: "15%" },
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chart3'));
            chart.draw(data, options);

        }

        function drawChart1() {

            var data1 = new google.visualization.arrayToDataTable(<%=this.datosql2()%>);
            var options1 = {
                title: 'Ingresos',
                backgroundColor: { fill: "white" },
                legend: { position: "labeled", textStyle: { color: "black", fontSize: 12 } },
                tooltip: { textStyle: { color: "black" }, showColorCode: true },
                colors: ["blue"],
                bar: { groupWidth: "12%" },
            };

            var chart1 = new google.visualization.ColumnChart(document.getElementById('chart1'));
            chart1.draw(data1, options1);

        }

        function drawChart2() {

            var data3 = new google.visualization.arrayToDataTable(<%=this.datosql3()%>);
            var options3 = {
                title: 'Egresos',
                backgroundColor: { fill: "white" },
                legend: { position: "labeled", textStyle: { color: "black", fontSize: 12 } },
                tooltip: { textStyle: { color: "black" }, showColorCode: true },
                colors: ["red"],
                bar: { groupWidth: "12%" },
            };

            var chart3 = new google.visualization.ColumnChart(document.getElementById('chart2'));
            chart3.draw(data3, options3);

        }
    </script>
<%--////////////////////////////////////////////////////////////////--%>
    <div class="container">
        <h3 class="text-center">REPORTES</h3>
        <p></p>
  <div class="row">
    <div class="col-sm">
        <div class="card">
      <div class="card-body" style="margin-left: auto; margin-right: auto; text-align: center;">
        <h5 class="card-title text-center">Ingresos</h5><p></p>
        <asp:Label runat="server" ID="lbling" Text="+$" Font-Bold="true" Font-Size="3em" ForeColor="Green"></asp:Label>
      </div>
    </div>
     </div>
       <div class="col-sm">
           <div class="card">
      <div class="card-body" style="margin-left: auto; margin-right: auto; text-align: center;">
        <h5 class="card-title">Cantidad de pedidos realizados</h5>
        <asp:Label runat="server" ID="lblped" Text="N°"  Font-Bold="true" Font-Size="3em"></asp:Label>
      </div>
    </div>
    </div>
      <div class="col-sm">
           <div class="card">
      <div class="card-body" style="margin-left: auto; margin-right: auto; text-align: center;">
        <h5 class="card-title text-center">Egresos</h5>
        <asp:Label runat="server" ID="lblegr" Text="-$" forecolor="Red"  Font-Bold="true" Font-Size="3em"></asp:Label>
      </div>
    </div>
    </div>
  </div>

            <div id="chart1" style="width: 95%; height: 500px;"></div>
        <p></p>
            <div id="chart2" style="width: 95%; height: 500px;"></div>
        <p></p>
            <div id="chart3" style="width: 95%; height: 500px;"></div>
        </div>
</asp:Content>
