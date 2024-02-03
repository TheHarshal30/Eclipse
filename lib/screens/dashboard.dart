// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:app1/screens/expenses.dart';
import 'package:app1/screens/navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pie_chart/pie_chart.dart' as pie;
import 'dart:math' as math;

double total2 = 0;
String user2 = "";
double jan1 = 0;
double feb1 = 0;
double mar1 = 0;
double apr1 = 0;
double may1 = 0;
double jun1 = 0;
double jul1 = 0;
double aug1 = 0;
double sep1 = 0;
double oct1 = 0;
double nov1 = 0;
double dec1 = 0;
double total1 = 0;
String user1 = "";
TextEditingController usernmane = TextEditingController();
final userkey = TextEditingController();
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
void onAdd(String userkey) async {
  if (userkey.isNotEmpty) {
    Map<String, dynamic>? temp = await FirebaseFirestore.instance
        .collection("personal expense")
        .doc(userkey)
        .get()
        .then((value) => value.data());

    jan1 = temp!['jan'];
    feb1 = temp['feb'];
    mar1 = temp['mar'];
    apr1 = temp['apr'];
    may1 = temp['may'];
    jun1 = temp['jun'];
    jul1 = temp['jul'];
    aug1 = temp['aug'];
    sep1 = temp['sep'];
    oct1 = temp['oct'];
    nov1 = temp['nov'];
    dec1 = temp['dec'];
    total1 = temp['total'];
    user1 = temp['username'];
    Map<String, dynamic> connectData = {
      "jan": jan1,
      "feb": feb1,
      "mar": mar1,
      "apr": apr1,
      "may": may1,
      "jun": jun1,
      "jul": jul1,
      "aug": aug1,
      "sep": sep1,
      "oct": oct1,
      "nov": nov1,
      "dec": dec1,
      "total": total1,
      "usernsme": user1,
    };
    await _firestore.collection('family').doc(curruserID).set(connectData);

/*
    await _firestore
        .collection('family')
        .doc(userrr)
        .collection('connect')
        .doc(userkey)
        .set(connectData);
        */
  }
}

class Dashboard extends StatefulWidget {
  double jan2 = 10;
  double feb2 = 0;
  double mar2 = 0;
  double apr2 = 0;
  double may2 = 0;
  double jun2 = 0;
  double jul2 = 0;
  double aug2 = 0;
  double sep2 = 0;
  double oct2 = 0;
  double nov2 = 0;
  double dec2 = 0;
  bool isData = false;
  Dashboard(
      {super.key,
      required this.jan2,
      required this.feb2,
      required this.mar2,
      required this.apr2,
      required this.may2,
      required this.jun2,
      required this.jul2,
      required this.aug2,
      required this.sep2,
      required this.oct2,
      required this.nov2,
      required this.dec2,
      required this.isData});

  @override
  State<Dashboard> createState() => _DashboardState();
}

enum LegendShape { circle, rectangle }

class _DashboardState extends State<Dashboard> {
  /*
  double jan2 = 10;
  double feb2 = 0;
  double mar2 = 0;
  double apr2 = 0;
  double may2 = 0;
  double jun2 = 0;
  double jul2 = 0;
  double aug2 = 0;
  double sep2 = 0;
  double oct2 = 0;
  double nov2 = 0;
  double dec2 = 0;*/

  final double width = 7;
  bool isData = false;

  void data() async {
    Map<String, dynamic>? temp = await FirebaseFirestore.instance
        .collection("personal expense")
        .doc(curruserID)
        .get()
        .then((value) => value.data());
    if (temp == null) {
      setState(() {
        isData = false;
      });
    } else {
      setState(() {
        isData = true;
      });
    }
  }

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  /*
  void getData() async {
    Map<String, dynamic>? temp1 = await FirebaseFirestore.instance
        .collection("family")
        .doc(curruserID)
        .get()
        .then((value) => value.data());
    print(temp1);
    if (temp1 == null) {
      setState(() {
        isData = false;
      });
    } else {
      setState(() {
        jan2 = temp1['jan'];
        feb2 = temp1['feb'];
        mar2 = temp1['mar'];
        apr2 = temp1['apr'];
        may2 = temp1['may'];
        jun2 = temp1['jun'];
        jul2 = temp1['jul'];
        aug2 = temp1['aug'];
        sep2 = temp1['sep'];
        oct2 = temp1['oct'];
        nov2 = temp1['nov'];
        dec2 = temp1['dec'];
        total2 = temp1['total'];
        user2 = temp1['usernsme'];
        print(jan2);
        print(feb2);
        print(mar2);
        isData = true;
      });
    }
  }*/

  int touchedGroupIndex = -1;
  List<dynamic> log = [
    jant,
    febt,
    mart,
    aprt,
    mayt,
    junt,
    jult,
    augt,
    sept,
    octt,
    novt,
    dect
  ];
  List<dynamic> fire = [];
  @override
  void initState() {
    super.initState();
    /*
    final barGroup1 = makeGroupData(0, 20, 8);
    final barGroup2 = makeGroupData(1, 7, 9);
    final barGroup3 = makeGroupData(2, 3, 20);
    final barGroup4 = makeGroupData(3, 9, 5);
    final barGroup5 = makeGroupData(4, 20, 16);
    final barGroup6 = makeGroupData(5, 9, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);
    final barGroup8 = makeGroupData(7, 10, 1.5);
    final barGroup9 = makeGroupData(8, 10, 1.5);
    final barGroup10 = makeGroupData(9, 10, 1.5);
    final barGroup11 = makeGroupData(10, 10, 1.5);
    final barGroup12 = makeGroupData(11, 10, 1.5);
    */
    getUsername();
    data();
    //getData();
    fire.add(widget.jan2);
    fire.add(widget.feb2);
    fire.add(widget.mar2);
    fire.add(widget.apr2);
    fire.add(widget.may2);
    fire.add(widget.jun2);
    fire.add(widget.jul2);
    fire.add(widget.aug2);
    fire.add(widget.sep2);
    fire.add(widget.oct2);
    fire.add(widget.nov2);
    fire.add(widget.dec2);

    var barGroup1 = makeGroupData(
        0, (jant / (totalt)) * 100, (widget.jan2 / (totalt)) * 100);
    var barGroup2 = makeGroupData(
        1, (febt / (totalt)) * 100, (widget.feb2 / (total2)) * 100);
    var barGroup3 = makeGroupData(
        2, (mart / (totalt)) * 100, (widget.mar2 / (total2)) * 100);
    var barGroup4 = makeGroupData(
        3, (aprt / (totalt)) * 100, (widget.apr2 / (total2)) * 100);
    var barGroup5 = makeGroupData(
        4, (mayt / (totalt)) * 100, (widget.may2 / (total2)) * 100);
    var barGroup6 = makeGroupData(
        5, (junt / (totalt)) * 100, (widget.jun2 / (total2)) * 100);
    var barGroup7 = makeGroupData(
        6, (jult / (totalt)) * 100, (widget.jul2 / (total2)) * 100);
    var barGroup8 = makeGroupData(
        7, (augt / (totalt)) * 100, (widget.aug2 / (total2)) * 100);
    var barGroup9 = makeGroupData(
        8, (sept / (totalt)) * 100, (widget.sep2 / (total2)) * 100);
    var barGroup10 = makeGroupData(
        9, (octt / (totalt)) * 100, (widget.oct2 / (total2)) * 100);
    var barGroup11 = makeGroupData(
        10, (novt / (totalt)) * 100, (widget.nov2 / (total2)) * 100);
    var barGroup12 = makeGroupData(
        11, (dect / (totalt)) * 100, (widget.dec2 / (total2)) * 100);

    /*
    var barGroup2 = makeGroupData(1, febt, widget.feb2);
    var barGroup3 = makeGroupData(2, mart, widget.mar2);
    var barGroup4 = makeGroupData(3, aprt, widget.apr2);
    var barGroup5 = makeGroupData(4, mayt, widget.may2);
    var barGroup6 = makeGroupData(5, junt, widget.jun2);
    var barGroup7 = makeGroupData(6, jult, widget.jul2);
    var barGroup8 = makeGroupData(7, augt, widget.aug2);
    var barGroup9 = makeGroupData(8, sept, widget.sep2);
    var barGroup10 = makeGroupData(9, octt, widget.oct2);
    var barGroup11 = makeGroupData(10, novt, widget.nov2);
    var barGroup12 = makeGroupData(11, dect, widget.dec2);
*/
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
      barGroup12,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  final dataMap = <String, double>{
    userrr.toString(): totalt,
    user2: (total2),
  };
  final legendLabels = <String, String>{
    "Flutter": "Flutter legend",
    "React": "React legend",
    "Xamarin": "Xamarin legend",
  };
  final colorList = <Color>[
    const Color.fromRGBO(186, 201, 255, 1),
    const Color.fromRGBO(117, 114, 255, 0.3),
    const Color(0xff6c5ce7),
  ];
  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  pie.ChartType? _chartType = pie.ChartType.ring;
  bool _showCenterText = false;
  double? _ringStrokeWidth = 20;
  double? _chartLegendSpacing = 80;

  bool _showLegendsInRow = false;
  bool _showLegends = true;
  bool _showLegendLabel = false;

  bool _showChartValueBackground = true;
  bool _showChartValues = false;
  bool _showChartValuesInPercentage = false;
  bool _showChartValuesOutside = false;

  bool _showGradientColors = false;

  LegendShape? _legendShape = LegendShape.circle;
  pie.LegendPosition? _legendPosition = pie.LegendPosition.left;

  int key = 0;
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please enter userkey",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Anderson',
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: usernmane,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter userkey",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Neo',
                    ),
                  ),
                  onSubmitted: (value) {
                    onAdd(usernmane.text);
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          actions: [],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white)),
          elevation: 0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(186, 201, 255, 1),
              fontFamily: 'AndersonB',
            ),
          ),
          actions: [],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: (widget.isData)
              ? Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              const Color.fromRGBO(161, 128, 255, 0.5),
                              const Color.fromRGBO(117, 114, 255, 0.3),
                              const Color.fromRGBO(132, 112, 255, 0.2),
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userrr.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'Anderson',
                                    )),
                                Row(
                                  children: [
                                    Text("₹ ",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontFamily: 'Neo',
                                            fontWeight: FontWeight.w400)),
                                    Text(totalt.toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontFamily: 'Neo',
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user2,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'Anderson',
                                    )),
                                Row(
                                  children: [
                                    Text("₹ ",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontFamily: 'Neo',
                                            fontWeight: FontWeight.w400)),
                                    Text((total2).toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontFamily: 'Neo',
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 3.5,
                          width: MediaQuery.of(context).size.width / 1.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(186, 201, 255, 0.1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Overview",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: 'AndersonB',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: pie.PieChart(
                                  key: ValueKey(key),
                                  dataMap: dataMap,
                                  animationDuration:
                                      const Duration(milliseconds: 800),
                                  chartLegendSpacing: _chartLegendSpacing!,
                                  chartRadius: math.min(
                                      MediaQuery.of(context).size.width / 3.2,
                                      300),
                                  colorList: colorList,
                                  initialAngleInDegree: 0,
                                  chartType: _chartType!,
                                  centerText: _showCenterText
                                      ? dataMap[0].toString()
                                      : null,
                                  legendLabels:
                                      _showLegendLabel ? legendLabels : {},
                                  legendOptions: pie.LegendOptions(
                                    showLegendsInRow: _showLegendsInRow,
                                    legendPosition: _legendPosition!,
                                    showLegends: _showLegends,
                                    legendShape:
                                        _legendShape == LegendShape.circle
                                            ? BoxShape.circle
                                            : BoxShape.rectangle,
                                    legendTextStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'Neo',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  chartValuesOptions: pie.ChartValuesOptions(
                                    showChartValueBackground:
                                        _showChartValueBackground,
                                    showChartValues: _showChartValues,
                                    showChartValuesInPercentage:
                                        _showChartValuesInPercentage,
                                    showChartValuesOutside:
                                        _showChartValuesOutside,
                                  ),
                                  ringStrokeWidth: _ringStrokeWidth!,
                                  emptyColor: Colors.grey,
                                  gradientList:
                                      _showGradientColors ? gradientList : null,
                                  emptyColorGradient: const [
                                    Color(0xff6c5ce7),
                                    Colors.blue,
                                  ],
                                  baseChartColor: Colors.transparent,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, bottom: 30),
                            child: Container(
                              child: Text(
                                "Monthly Comparision",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontFamily: 'AndersonB',
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 50.0, right: 50),
                              child: Container(
                                decoration: BoxDecoration(),
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                width: MediaQuery.of(context).size.width * 2.1,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      child: BarChart(
                                        BarChartData(
                                          maxY: 100,
                                          groupsSpace: 40,
                                          alignment: BarChartAlignment.center,
                                          barTouchData: BarTouchData(
                                            touchTooltipData:
                                                BarTouchTooltipData(
                                              tooltipBgColor: Colors.white,
                                              getTooltipItem: (group,
                                                  groupIndex, rod, rodIndex) {
                                                String weekDay;
                                                int index;
                                                double val = double.parse(
                                                    rod.toY.toString());
                                                double temp = double.parse(
                                                    val.toStringAsFixed(1));
                                                double ans;
                                                if (rodIndex == 0) {
                                                  ans = ((rod.toY / 100) *
                                                      (totalt));
                                                } else {
                                                  ans = ((rod.toY / 100) *
                                                      (total2));
                                                }

                                                double temp2 = double.parse(
                                                    ans.toString());
                                                double ans2 = double.parse(
                                                    temp2.toStringAsFixed(1));
                                                return BarTooltipItem(
                                                  ans2.toString(),
                                                  TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Neo',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          titlesData: FlTitlesData(
                                            show: true,
                                            rightTitles: AxisTitles(
                                              sideTitles:
                                                  SideTitles(showTitles: false),
                                            ),
                                            topTitles: AxisTitles(
                                              sideTitles:
                                                  SideTitles(showTitles: false),
                                            ),
                                            bottomTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: true,
                                                getTitlesWidget: bottomTitles,
                                                reservedSize: 42,
                                              ),
                                            ),
                                            leftTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: false,
                                                reservedSize: 28,
                                                interval: 1,
                                                getTitlesWidget: leftTitles,
                                              ),
                                            ),
                                          ),
                                          borderData: FlBorderData(
                                            show: false,
                                          ),
                                          barGroups: showingBarGroups,
                                          gridData: FlGridData(show: false),
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
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Center(
                  child: Text("Coming Soon!",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: 'Neo',
                          fontWeight: FontWeight.w500)),
                ),
        )));
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(
    barsSpace: 10,
    x: x,
    barRods: [
      BarChartRodData(
        toY: y1,
        color: Color.fromRGBO(161, 128, 255, 0.5),
        width: 10,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      BarChartRodData(
        toY: y2,
        color: Colors.red,
        width: 10,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    ],
  );
}

Widget bottomTitles(double value, TitleMeta meta) {
  final titles = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final Widget text = Text(
    titles[value.toInt()],
    style: const TextStyle(
      color: Color(0xff7589a2),
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

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  if (value == 0) {
    text = '1K';
  } else if (value == 10) {
    text = '5K';
  } else if (value == 19) {
    text = '10K';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}
