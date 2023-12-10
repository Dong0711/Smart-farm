import 'package:farm/config/theme/AppColor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget2 {
  Color? leftBarColor = AppColor.primary[90];
  Color? rightBarColor = AppColor.sub[50];
  double width = 7;

  // ignore: non_constant_identifier_names
  BarChart LineChart(List value) {
    List<BarChartGroupData> rawBarGroups = RawBarGroups(value);
    List<BarChartGroupData> showingBarGroups = rawBarGroups;
    return BarChart(
      BarChartData(
        maxY: 20,
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomTitles,
              reservedSize: 42,
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(
            show: true, border: Border.all(color: const Color(0xff37434d))),
        barGroups: showingBarGroups,
        gridData: const FlGridData(show: true),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  List<BarChartGroupData> RawBarGroups(List value) {
    List<BarChartGroupData> items = [];
    for (var i = 0; i < value.length; i++) {
      var barGroup = makeGroupData(i, value[i][0], value[i][1]);
      items.add(barGroup);
    }
    return items;
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12'
    ];
    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: rightBarColor,
          width: width,
        ),
      ],
    );
  }
}
