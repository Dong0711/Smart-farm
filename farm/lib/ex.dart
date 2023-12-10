import 'package:farm/config/theme/AppColor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});
  final Color? leftBarColor = AppColor.primary[90];
  final Color? rightBarColor = AppColor.sub[50];

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 2, 1);
    final barGroup2 = makeGroupData(1, 2, 5);
    final barGroup3 = makeGroupData(2, 2, 5);
    final barGroup4 = makeGroupData(3, 2, 4);
    final barGroup5 = makeGroupData(4, 2, 6);
    final barGroup6 = makeGroupData(5, 2, 1.5);
    final barGroup7 = makeGroupData(6, 2, 1.5);
    final barGroup8 = makeGroupData(7, 2, 3);
    final barGroup9 = makeGroupData(8, 2, 4);
    final barGroup10 = makeGroupData(9, 2, 1.5);
    final barGroup11 = makeGroupData(10, 2, 1.5);
    final barGroup12 = makeGroupData(11, 2, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
      barGroup12
    ];
    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 200,
          width: 400,
          // color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 38,
              ),
              SizedBox(
                height: 200,
                child: Expanded(
                  child: BarChart(
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
                          show: true,
                          border: Border.all(
                              color: Colors.black38,
                              style: BorderStyle.solid,
                              width: 2)),
                      barGroups: showingBarGroups,
                      gridData: const FlGridData(show: true),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
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
        color: Color.fromARGB(255, 0, 0, 0),
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
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }
}
