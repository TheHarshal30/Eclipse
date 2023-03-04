// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'bar_graph.dart';

class ExpenseSummary extends StatefulWidget {
  final Color barColor;
   ExpenseSummary({super.key,
     required this.barColor});
  @override
  State<ExpenseSummary> createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> {
   dynamic total =100;
   double janx = 0;
   double febx = 0;
   double marx = 0;
   double mayx = 0;
   double aprx = 0;
   double junex = 0;
   double julyx = 0;
   double augustx = 0;
   double septx = 0;
   double octx = 0;
   double novx = 0;
   double decx = 0;
   int chek = 0;
   @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    final snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      total = snap['totalex'];
      janx = snap['janx'];
      febx = snap['febx'];
      marx = snap['marx'];
      mayx = snap['mayx'];
      aprx = snap['aprx'];
      junex = snap['junex'];
      julyx = snap['julyx'];
    augustx = snap['augustx'];
    septx = snap['septx'];
    octx = snap['octx'];
    novx = snap['novx'];
    decx = snap['decx'];
      Future.delayed(const Duration(seconds: 0), () {
        setState(() {
          chek =1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return chek==1?Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        child: MyBarGraph(
          janAmount: janx==0?1:(janx*100/total).roundToDouble(),
          febAmount: febx==0?1:(febx*100/total).roundToDouble(),
          marchAmount: marx==0?1:(marx*100/total).roundToDouble(),
          mayAmount: mayx==0?1:(mayx*100/total).roundToDouble(),
          aprilAmount: aprx==0?1:(aprx*100/total).roundToDouble(),
          junAmount: junex==0?1:(junex*100/total).roundToDouble(),
          julAmount: julyx==0?1:(julyx*100/total).roundToDouble(),
          augAmount: augustx==0?1:(augustx*100/total).roundToDouble(),
          septAmount: septx==0?1:(septx*100/total).roundToDouble(),
          octAmount: octx==0?1:(octx*100/total).roundToDouble(),
          novAmount: novx==0?1:(novx*100/total).roundToDouble(),
          decAmount: decx==0?1:(decx*100/total).roundToDouble(),
          barColor: widget.barColor,
        ),
      ),
    ):Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 400),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
