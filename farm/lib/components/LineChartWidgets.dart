// ignore: file_names
import 'package:farm/config/theme/AppColor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidgets {
  List<Color> blueGradientColors = [const Color(0xFF50E4FF), const Color(0xFF2196F3)];
  List<Color> redGradientColors = [
    const Color.fromARGB(213, 255, 151, 151),
    const Color.fromARGB(124, 243, 33, 33)
  ];
  List<Color> greenGradientColors = [
    const Color.fromARGB(210, 75, 119, 73),
    const Color.fromARGB(219, 26, 131, 2)
  ];
  Color? leftColor = AppColor.primary[90];
  Color? rightColor = AppColor.sub[50];
  Widget rainSalaryLeftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black);
    String text;
    switch (value.toInt()) {
      case 2:
        text = '10%';
        break;
      case 4:
        text = '20%';
        break;
      case 6:
        text = '30%';
      case 8:
        text = '40%';
        break;

      default:
        return Container();
    }
    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget tempLeftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black);
    String text;
    switch (value.toInt()) {
      case 2:
        text = '10';
        break;

      case 4:
        text = '20';
        break;

      case 6:
        text = '30';
        break;

      case 8:
        text = '40';
        break;

      case 10:
        text = '50';
        break;
      default:
        return Container();
    }
    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('1', style: style);
        break;
      case 1:
        text = const Text('2', style: style);
        break;
      case 2:
        text = const Text('3', style: style);
        break;
      case 3:
        text = const Text('4', style: style);
        break;
      case 4:
        text = const Text('5', style: style);
        break;
      case 5:
        text = const Text('6', style: style);
        break;
      case 6:
        text = const Text('7', style: style);
        break;
      case 7:
        text = const Text('8', style: style);
        break;
      case 8:
        text = const Text('9', style: style);
        break;
      case 9:
        text = const Text('10', style: style);
        break;
      case 10:
        text = const Text('11', style: style);
        break;
      case 11:
        text = const Text('12', style: style);
        break;
      default:
        text = const Text('tháng', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData(List value, int type) {
    List<Color> color = blueGradientColors;
    if (type == 1) {
      color = redGradientColors;
    } else if (type == 2) {
      color = greenGradientColors;
    }
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget:
                (type == 1) ? tempLeftTitleWidgets : rainSalaryLeftTitleWidgets,
            reservedSize: (type == 1) ? 25 : 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: type == 1 ? 10 : 10,
      lineBarsData: [
        LineChartBarData(
          spots: listSports(value),
          isCurved: true,
          gradient: LinearGradient(
            colors: color,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: color.map((color) => color.withOpacity(0.5)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  List<FlSpot> listSports(List value) {
    List<FlSpot> sports = [];
    for (var i = 0; i < value.length; i++) {
      var item = FlSpot(i.toDouble(), value[i] / 5);
      sports.add(item);
    }
    return sports;
  }
}
