<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chart.aspx.cs" Inherits="ShopGaspar.Chart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });

        google.charts.setOnLoadCallback(drawChart);

       

        function drawChart() {

             

            var data = new google.visualization.DataTable();

            data.addColumn('date', 'Año');
            data.addColumn('number', 'Ingreso');
            data.addColumn('number', 'Egreso');


            data.addRows(<%=this.obtenerDatos()%>);
            var options = {
                "title": "Balance GAMERSALTA",
                "fontSize": 12,
                "legend": { "position": "right", "textStyle": { "color": "#000000", "fontSize": 14 } }, //labeled: referncia con flechas
                "colors": ["#1352d1", "#31c125", "#2343b7", "#d81ed1", "#77471a"],
                hAxis: { //valores horizontales
                    title: "Año"
                },
                vAxis: { //valores verticales
                    title: "Cantidad"

                }
            };

            var chart = new google.visualization.ColumnChart(document.getElementById("barrachart"));
            chart.draw(data, options);
        }
   
    </script>

</head>

<body>
    <h1>Reportes</h1>
    <div id="barrachart" style="width: 900px; height: 300px;"></div>  
    <h1>End</h1>
</body>
</html>

