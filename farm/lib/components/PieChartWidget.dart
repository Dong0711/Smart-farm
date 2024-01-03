// ignore_for_file: file_names

import 'package:farm/config/theme/AppColor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget {
  List<PieChartSectionData> showingSections(List<int> value) {
    int count = value.reduce((a, b) => a + b);
    return List.generate(3, (i) {
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColor.primary[90],
            value: value[i].toDouble(),
            title: '${((value[i] / count * 100) * 100).round() / 100}%',
            radius: 80,
            titleStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFFFFC300),
            value: value[i].toDouble(),
            title: '${((value[i] / count * 100) * 100).round() / 100}%',
            radius: 85,
            titleStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red,
            value: value[i].toDouble(),
            title: '${((value[i] / count * 100) * 100).round() / 100}%',
            radius: 90,
            titleStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  PieChartData pieChartData(List<int> value) {
    return PieChartData(
        startDegreeOffset: -90,
        borderData: FlBorderData(
            show: true,
            border: Border.all(
                width: 10, color: Colors.black, style: BorderStyle.solid)),
        sectionsSpace: 0,
        centerSpaceRadius: 0,
        sections: showingSections(value));
  }
}
