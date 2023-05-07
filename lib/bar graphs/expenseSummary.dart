// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:app1/bar%20graphs/bar_graph.dart';
import 'package:flutter/material.dart';

class ExpenseSummary extends StatelessWidget {
  final Color barColor;
  const ExpenseSummary({super.key, required this.barColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        child: MyBarGraph(
          janAmount: 80,
          febAmount: 30,
          marchAmount: 50,
          mayAmount: 40,
          aprilAmount: 30,
          junAmount: 50,
          julAmount: 10,
          augAmount: 50,
          septAmount: 70,
          octAmount: 80,
          novAmount: 90,
          decAmount: 60,
          barColor: barColor,
        ),
      ),
    );
  }
}
