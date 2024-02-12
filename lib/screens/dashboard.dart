// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field, unnecessary_cast

import 'package:app1/main.dart';
import 'package:app1/models/firebaseCalls.dart';
import 'package:app1/screens/expenses.dart';
import 'package:app1/screens/homepage2.dart';
import 'package:app1/screens/navigator.dart' as nav;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
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
// void onAdd(String userkey) async {
//   if (userkey.isNotEmpty) {
//     Map<String, dynamic>? temp = await FirebaseFirestore.instance
//         .collection("personal expense")
//         .doc(userkey)
//         .get()
//         .then((value) => value.data());

//     jan1 = temp!['jan'];
//     feb1 = temp['feb'];
//     mar1 = temp['mar'];
//     apr1 = temp['apr'];
//     may1 = temp['may'];
//     jun1 = temp['jun'];
//     jul1 = temp['jul'];
//     aug1 = temp['aug'];
//     sep1 = temp['sep'];
//     oct1 = temp['oct'];
//     nov1 = temp['nov'];
//     dec1 = temp['dec'];
//     total1 = temp['total'];
//     user1 = temp['username'];
//     Map<String, dynamic> connectData = {
//       "jan": jan1,
//       "feb": feb1,
//       "mar": mar1,
//       "apr": apr1,
//       "may": may1,
//       "jun": jun1,
//       "jul": jul1,
//       "aug": aug1,
//       "sep": sep1,
//       "oct": oct1,
//       "nov": nov1,
//       "dec": dec1,
//       "total": total1,
//       "usernsme": user1,
//     };
//     await _firestore.collection('family').doc(curruserKey).set(connectData);

// /*
//     await _firestore
//         .collection('family')
//         .doc(userrr)
//         .collection('connect')
//         .doc(userkey)
//         .set(connectData);
//         */
//   }
// }

class Dashboard extends StatefulWidget {
  Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

enum LegendShape { circle, rectangle }

class _DashboardState extends State<Dashboard> {
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

  final double width = 7;
  bool isData = false;

  void data() async {
    String friendID = await FirebaseCalls().getFriendID(curruserKey.toString());
    dashboardData =
        await FirebaseCalls().getDashBoardData(friendID, curruserKey.toString())
            as Map<String, double>;
    jan1 = (dashboardData['friendJan']!);
    feb1 = (dashboardData['friendFeb']!);
    mar1 = (dashboardData['friendMar']!);
    apr1 = (dashboardData['friendApr']!);
    may1 = (dashboardData['friendMay']!);
    jun1 = (dashboardData['friendJun']!);
    jul1 = (dashboardData['friendJul']!);
    aug1 = (dashboardData['friendAug']!);
    sep1 = (dashboardData['friendSep']!);
    oct1 = (dashboardData['friendOct']!);
    nov1 = (dashboardData['friendNov']!);
    dec1 = (dashboardData['friendDec']!);
    total1 = (dashboardData['friendTotal']!);
    user1 = friendName;
    jan2 = (dashboardData['userJan']!);
    feb2 = (dashboardData['userFeb']!);
    mar2 = (dashboardData['userMar']!);
    apr2 = (dashboardData['userApr']!);
    may2 = (dashboardData['userMay']!);
    jun2 = (dashboardData['userJun']!);
    jul2 = (dashboardData['userJul']!);
    aug2 = (dashboardData['userAug']!);
    sep2 = (dashboardData['userSep']!);
    oct2 = (dashboardData['userOct']!);
    nov2 = (dashboardData['userNov']!);
    dec2 = (dashboardData['userDec']!);
    total2 = (dashboardData['userTotal']!);
    user2 = userName;

    setState(() {
      isData = true;
    });

    print(dashboardData);
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

  Map<String, double> dashboardData = {};
  @override
  void initState() {
    super.initState();

    data();
    var total = (total1 > total2) ? total1 : total2;
    var barGroup1 =
        makeGroupData(0, (jan1 / (total)) * 100, (jan2 / (total)) * 100);
    var barGroup2 =
        makeGroupData(1, (feb1 / (total)) * 100, (feb2 / (total)) * 100);
    var barGroup3 =
        makeGroupData(2, (mar1 / (total)) * 100, (mar2 / (total)) * 100);
    var barGroup4 =
        makeGroupData(3, (apr1 / (total)) * 100, (apr2 / (total)) * 100);
    var barGroup5 =
        makeGroupData(4, (may1 / (total)) * 100, (may2 / (total)) * 100);
    var barGroup6 =
        makeGroupData(5, (jun1 / (total)) * 100, (jun2 / (total)) * 100);
    var barGroup7 =
        makeGroupData(6, (jul1 / (total)) * 100, (jul2 / (total)) * 100);
    var barGroup8 =
        makeGroupData(7, (aug1 / (total)) * 100, (aug2 / (total)) * 100);
    var barGroup9 =
        makeGroupData(8, (sep1 / (total)) * 100, (sep2 / (total)) * 100);
    var barGroup10 =
        makeGroupData(9, (oct1 / (total)) * 100, (oct2 / (total)) * 100);
    var barGroup11 =
        makeGroupData(10, (nov1 / (total)) * 100, (nov2 / (total)) * 100);
    var barGroup12 =
        makeGroupData(11, (dec1 / (total)) * 100, (dec2 / (total)) * 100);

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
    dataMap = {
      userName: total1,
      friendName: (total2),
    };
  }

  Map<String, double> dataMap = {};
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
  // void _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.black,
  //         title: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               "Please enter userkey",
  //               style: TextStyle(
  //                   fontSize: 18,
  //                   color: Colors.white,
  //                   fontFamily: 'Anderson',
  //                   fontWeight: FontWeight.w500),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(top: 10.0),
  //               child: TextField(
  //                 controller: usernmane,
  //                 style: TextStyle(color: Colors.white),
  //                 decoration: InputDecoration(
  //                   hintText: "Enter userkey",
  //                   hintStyle: TextStyle(
  //                     color: Colors.grey,
  //                     fontFamily: 'Neo',
  //                   ),
  //                 ),
  //                 onSubmitted: (value) {
  //                   onAdd(usernmane.text);
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //         actions: [],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    final List<dynamic> expenses = [
      jan1,
      feb1,
      mar1,
      apr1,
      may1,
      jun1,
      jul1,
      aug1,
      sep1,
      oct1,
      nov1,
      dec1
    ];
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                      child: Container(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          width: MediaQuery.of(context).size.width / 1.11,
                          height: MediaQuery.of(context).size.height / 5.5,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color.fromRGBO(161, 128, 255, 0.25),
                                  const Color.fromRGBO(117, 114, 255, 0.1),
                                  const Color.fromRGBO(132, 112, 255, 0.01),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 0.2)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Statistics",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontFamily: 'AndersonB',
                                ),
                              ),
                              Text("Compare your expenses with a friend",
                                  style: GoogleFonts.exo(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white))
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width / 1.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(186, 201, 255, 0.1)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Total Expense",
                                              style: GoogleFonts.exo(
                                                  fontSize: 15,
                                                  color: Colors.white60),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text("₹ ",
                                                      style: GoogleFonts.exo(
                                                          fontSize: 18,
                                                          color: Colors.white)),
                                                ),
                                                Text(total1.toString(),
                                                    style: GoogleFonts.exo(
                                                        fontSize: 30,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 40),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.circle,
                                              size: 5, color: Colors.green),
                                          Text(" connected user",
                                              style: GoogleFonts.exo(
                                                  fontSize: 12,
                                                  color: Colors.white60)),
                                        ],
                                      ),
                                      Text(user1.toString(),
                                          style: GoogleFonts.exo(
                                              fontSize: 15,
                                              color: Colors.white60)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 0.0, bottom: 0),
                            child: Container(
                              child: Text(
                                "Monthly Breakdown",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontFamily: 'AndersonB',
                                ),
                              ),
                            ),
                          ),
// Text('${months[index % 12]}'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.5,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: BouncingScrollPhysics(),
                                itemCount: 12,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      width: MediaQuery.of(context).size.width /
                                          1.10,
                                      decoration: BoxDecoration(
                                        /*border: Border.all(width: 1.5, color: Colors.black),*/
                                        color:
                                            Color.fromRGBO(186, 201, 255, 0.1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        186, 201, 255, 0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    //  border: Border.all(color: Colors.black, width: 1)
                                                  ),
                                                  child: Image(
                                                      image: AssetImage(
                                                          "assets/images/rupee.jpg"),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              40),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20,
                                                          bottom: 8,
                                                          top: 8),
                                                  child: Text(
                                                      '${months[index % 12]}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Anderson',
                                                          fontWeight:
                                                              FontWeight.w700)))
                                            ],
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "₹ ${expenses[index % 12]} ",
                                                // 'check',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .lightGreen.shade700,
                                                  fontFamily: 'AndersonB',
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
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
