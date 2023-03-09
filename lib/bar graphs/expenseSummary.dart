// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'bar_graph.dart';

class ExpenseSummary extends StatefulWidget {
  final Color barColor;
  double janx ;
  double febx ;
  double marx ;
  double mayx ;
  double aprx ;
  double junex ;
  double julyx ;
  double augustx ;
  double septx ;
  double octx ;
  double novx ;
  double decx ;
  double total;

  ExpenseSummary({super.key,
     required this.barColor,required this.janx,required this.febx,required this.marx,required this.mayx,required this.aprx,required this.junex,required this.julyx ,required this.augustx,
    required this.septx,required this.octx,required this.novx,required this.decx,required this.total
  });
  @override
  State<ExpenseSummary> createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> {
   // dynamic total =100;
   // double janx = 0;
   // double febx = 0;
   // double marx = 0;
   // double mayx = 0;
   // double aprx = 0;
   // double junex = 0;
   // double julyx = 0;
   // double augustx = 0;
   // double septx = 0;
   // double octx = 0;
   // double novx = 0;
   // double decx = 0;
   int chek = 0;
   @override
  void initState() {
     print(widget.janx==0?1:(widget.janx*100/widget.total).roundToDouble());
     print(widget.febx==0?1:(widget.febx*100/widget.total).roundToDouble());
    initialize();
    super.initState();
  }

  void initialize() async {
    final snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
    //   total = snap['totalex'];
    //   janx = snap['janx'];
    //   febx = snap['febx'];
    //   marx = snap['marx'];
    //   mayx = snap['mayx'];
    //   aprx = snap['aprx'];
    //   junex = snap['junex'];
    //   julyx = snap['julyx'];
    // augustx = snap['augustx'];
    // septx = snap['septx'];
    // octx = snap['octx'];
    // novx = snap['novx'];
    // decx = snap['decx'];
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
          janAmount: widget.janx==0?1:(widget.janx*100/widget.total).roundToDouble()<0?-1*(widget.janx*100/widget.total).roundToDouble():(widget.janx*100/widget.total).roundToDouble(),
          febAmount: widget.febx==0?1:(widget.febx*100/widget.total).roundToDouble()<0?-1*(widget.febx*100/widget.total).roundToDouble():(widget.febx*100/widget.total).roundToDouble(),
          marchAmount: widget.marx==0?1:(widget.marx*100/widget.total).roundToDouble()<0?-1*(widget.marx*100/widget.total).roundToDouble():(widget.marx*100/widget.total).roundToDouble(),
          mayAmount: widget.mayx==0?1:(widget.mayx*100/widget.total).roundToDouble()<0?-1*(widget.mayx*100/widget.total).roundToDouble():(widget.mayx*100/widget.total).roundToDouble(),
          aprilAmount: widget.aprx==0?1:(widget.aprx*100/widget.total).roundToDouble()<0?-1*(widget.aprx*100/widget.total).roundToDouble():(widget.aprx*100/widget.total).roundToDouble(),
          junAmount: widget.junex==0?1:(widget.junex*100/widget.total).roundToDouble()<0?-1*(widget.junex*100/widget.total).roundToDouble():(widget.junex*100/widget.total).roundToDouble(),
          julAmount: widget.julyx==0?1:(widget.julyx*100/widget.total).roundToDouble()<0?-1*(widget.julyx*100/widget.total).roundToDouble():(widget.julyx*100/widget.total).roundToDouble(),
          augAmount: widget.augustx==0?1:(widget.augustx*100/widget.total).roundToDouble()<0?-1*(widget.augustx*100/widget.total).roundToDouble():(widget.augustx*100/widget.total).roundToDouble(),
          septAmount: widget.septx==0?1:(widget.septx*100/widget.total).roundToDouble()<0?-1*(widget.septx*100/widget.total).roundToDouble():(widget.septx*100/widget.total).roundToDouble(),
          octAmount: widget.octx==0?1:(widget.octx*100/widget.total).roundToDouble()<0?-1*(widget.octx*100/widget.total).roundToDouble():(widget.octx*100/widget.total).roundToDouble(),
          novAmount: widget.novx==0?1:(widget.novx*100/widget.total).roundToDouble()<0?-1*(widget.novx*100/widget.total).roundToDouble():(widget.novx*100/widget.total).roundToDouble(),
          decAmount: widget.decx==0?1:(widget.decx*100/widget.total).roundToDouble()<0?-1*(widget.decx*100/widget.total).roundToDouble():(widget.decx*100/widget.total).roundToDouble(),
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
