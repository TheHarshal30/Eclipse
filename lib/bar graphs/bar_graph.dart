// ignore_for_file: unused_local_variable, prefer_const_constructors, sort_child_properties_last

import 'package:app1/bar%20graphs/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final double janAmount;
  final double febAmount;
  final double marchAmount;
  final double aprilAmount;
  final double mayAmount;
  final double junAmount;
  final double julAmount;
  final double augAmount;
  final double septAmount;
  final double octAmount;
  final double novAmount;
  final double decAmount;
  final Color barColor;
  const MyBarGraph(
      {super.key,
      required this.janAmount,
      required this.febAmount,
      required this.marchAmount,
      required this.aprilAmount,
      required this.mayAmount,
      required this.junAmount,
      required this.julAmount,
      required this.augAmount,
      required this.septAmount,
      required this.octAmount,
      required this.novAmount,
      required this.decAmount,
      required this.barColor});
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        janAmount,
        febAmount,
        marchAmount,
        aprilAmount,
        mayAmount,
        junAmount,
        julAmount,
        augAmount,
        septAmount,
        octAmount,
        novAmount,
        decAmount);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
            barTouchData: BarTouchData(
                touchTooltipData:
                    BarTouchTooltipData(tooltipBgColor: Colors.white)),
            maxY: 100,
            minY: 0,
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
                show: true,
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true, getTitlesWidget: getBottomTitles))),
            gridData: FlGridData(show: false),
            barGroups: myBarData.barData
                .map((data) => BarChartGroupData(x: data.x, barRods: [
                      BarChartRodData(
                          toY: data.y,
                          color: barColor,
                          width: 30,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)))
                    ]))
                .toList())
// BarChartData
        ); // BarChart
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'Jan',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'Feb',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'March',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'April',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'May',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'Jun',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'Jul',
        style: style,
      );
      break;
    case 7:
      text = const Text(
        'Aug',
        style: style,
      );
      break;
    case 8:
      text = const Text(
        'Sept',
        style: style,
      );
      break;
    case 9:
      text = const Text(
        'Oct',
        style: style,
      );
      break;
    case 10:
      text = const Text(
        'Nov',
        style: style,
      );
      break;
    case 11:
      text = const Text(
        'Dec',
        style: style,
      );
      break;

    default:
      text = const Text(
        '',
        style: style,
      );
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}


// Color.fromRGBO(37, 47, 72, 1)