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

            //data.addColumn('date', 'Año');
            //data.addColumn('number', 'Java');
            //data.addColumn('number', 'Python');
            //data.addColumn('number', 'C#');
            //data.addColumn('number', 'JavaScript');


            data.addRows(<%=this.obtenerDatos()%>);

            // var options es como el css del chart
            // pero para ahorrar tiempo se puede ver este generador de codigo para la personalizacion del chart:
            // https://oscaruhp.github.io/GeneradorGraficos/
            var options = {
                "title": "Balance GAMERSALTA",
                //backgroundColor: { fill: "white" },
                //pieHole: 0.4,
                "fontSize": 12,
                "legend": { "position": "right", "textStyle": { "color": "#000000", "fontSize": 14 } }, //labeled: referncia con flechas
                //tooltip: { textStyle: { color: "#ff0000" }, showColorCode: true },
                "colors": ["#1352d1"],
                hAxis: { //valores horizontales
                    title: "Año"
                },
                vAxis: { //valores verticales
                    title: "Popularidad",
                    //minValue: 0,
                    //minValue: 21,
                    //format: '##,##%' //numero numero, numero numero % (porcentaje)

                }
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('barrachart'));
            var formato = new google.visualization.NumberFormat({ pattern: '##,##%' });
            formato.format(data, 1);
            chart.draw(data, options);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="barrachart" style="width: 900px; height: 500px;"></div>
        </div>
    </form>
</body>
</html>