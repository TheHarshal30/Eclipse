// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_contains, avoid_print

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:app1/bar%20graphs/expenseSummary.dart';
import 'package:app1/screens/dashboard.dart';
import 'package:app1/screens/monthyl.dart';
import 'package:app1/screens/navigator.dart' as nav;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pie_chart/pie_chart.dart';

import '../main.dart';

StreamController<int> streamController = StreamController<int>.broadcast();
String? userrr;
Future getUsername() async {
  Map<String, dynamic>? temp = await FirebaseFirestore.instance
      .collection("personal expense")
      .doc(nav.curruserID)
      .get()
      .then((value) => value.data());
  userrr = temp?["username"].toString();
}

bool details = false;
Route _createRoute(value) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => value,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Future addPersonalTotal(
    double jan,
    double feb,
    double mar,
    double apr,
    double may,
    double jun,
    double jul,
    double aug,
    double sep,
    double oct,
    double nov,
    double dec,
    double total,
    String? username) async {
  await FirebaseFirestore.instance
      .collection("personal expense")
      .doc(nav.curruserID)
      .update({
    "jan": jan,
    "feb": feb,
    "mar": mar,
    "apr": apr,
    "may": may,
    "jun": jun,
    "jul": jul,
    "aug": aug,
    "sep": sep,
    "oct": oct,
    "nov": nov,
    "dec": dec,
    "total": total,
    "username": username
  });
}

/*
double jan = 100;
double feb = 100;
double mar = 100;
double apr = 100;
double may = 100;
double jun = 100;
double jul = 100;
double aug = 100;

double sep = 100;
double oct = 100;
double nov = 100;
double dec = 100;
double total = 1200;
*/
double jant = 100;
double febt = 100;
double mart = 100;
double aprt = 100;
double mayt = 100;
double junt = 100;
double jult = 100;
double augt = 100;

double sept = 100;
double octt = 100;
double novt = 100;
double dect = 100;
double totalt = 00;

Future addFamily(
    double jan,
    double feb,
    double mar,
    double apr,
    double may,
    double jun,
    double jul,
    double aug,
    double sep,
    double oct,
    double nov,
    double dec,
    double total,
    String username) async {
  await FirebaseFirestore.instance
      .collection("username")
      .doc(nav.curruserID)
      .set({
    "jan": jan,
    "feb": feb,
    "mar": mar,
    "apr": apr,
    "may": may,
    "jun": jun,
    "jul": jul,
    "aug": aug,
    "sep": sep,
    "oct": oct,
    "nov": nov,
    "dec": dec,
    "total": total,
    "username": username,
  });
}

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => ExpensePageState();
}

class ExpensePageState extends State<ExpensePage> {
  int state = 0;
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
  var selected = 1;
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Map<String, double> dataMap = {
    "January": 5,
    "Feb": 3,
    "March": 2,
    "April": 2,
    "May": 3,
    "June": 6,
    "July": 4,
    "August": 4,
    "September": 3,
    "October": 4,
    "November": 4,
    "December": 3,
  };
  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        streamController.stream.listen((event) {
          if (event == 1) {
            Navigator.of(context).pop();
            addPersonalTotal(jant, febt, mart, aprt, mayt, junt, jult, augt,
                sept, octt, novt, dect, totalt, userrr);
          }
        });
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please wait",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Anderson',
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "While we invade your privacy!",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontFamily: 'Neo',
                    fontWeight: FontWeight.w500),
              ),
              Image(image: AssetImage("assets/images/loading.gif")),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(""),
            ),
          ],
        );
      },
    );
  }

  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  List<double> p = [];
  Future<void> trial() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: '+917517086884',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      debugPrint(messages[0].body);
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialcp() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'CP-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialqp() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'QP-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialbw() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BW-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialbx() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BX-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialbz() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BZ-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialbv() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BV-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialgs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JG-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialbrs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BR-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialms() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JM-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialaxs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AX-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialJDs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JD-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialBPs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BP-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialvks() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VK-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialads() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AD-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  Future<void> trialvms() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VM-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialvm2s() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VD-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void trialvk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VK-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  Future<void> trialba() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BA-ICICIB',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

//main 4
  void getsmsjgsbp() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BP-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgscp() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'CP-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgsqp() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'QP-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgsbw() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BW-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgbx() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BX-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgsbz() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BZ-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgsbv() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BV-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JG-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsbrs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BR-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjms() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JM-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsaxs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AX-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsJDs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JD-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsBPs() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BP-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvks() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VK-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsads() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AD-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvms() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VM-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvm2s() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VD-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvm2svk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VK-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  Future<void> getsmsvm2sba() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BA-SBIUPI',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  Future<void> getsmsjg() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JG-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsbr() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BR-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjm() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JM-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsax() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AX-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsJD() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JD-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsBP() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BP-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VK-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsad() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AD-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvm() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VM-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvm2() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VD-BOBTXN',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  Future<void> getsmsjgbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JG-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsbrbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BR-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjxbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JX-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjmbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JM-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsaxbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AX-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsJDbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JD-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsBPbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BP-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvkbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VK-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsadbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AD-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvmbk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VM-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvm2bk() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VD-HDFCBK',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgsbpboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BP-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgscpboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'CP-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgsqpboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'QP-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgsboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BW-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjgboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BX-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjsboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BZ-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmjgsboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BV-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getmsjgboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JG-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsbrboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BR-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsjmboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JM-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsaxboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AX-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsJDboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'JD-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BP-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvksboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VK-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsadsboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'AD-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvmsboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VM-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvm2sboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VD-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void getsmsvmboi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'VK-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  Future<void> getsmsvm2boi() async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        address: 'BA-BOIIND',
      );
      debugPrint('sms inbox messages: ${messages.length}');
      setState(() => _messages.addAll(messages));
    } else {
      await Permission.sms.request();
    }
  }

  void _showBank(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: StreamBuilder<int>(
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      HapticFeedback.heavyImpact();
                      print(1);
                      Navigator.of(context).pop();
                      _showDialog(context);
                      state = 1;
                      _messages = [];
                      getsmsvm2();
                      getsmsvm();
                      getsmsad();
                      getsmsvk();
                      getsmsBP();
                      getsmsJD();
                      getsmsax();
                      getsmsjm();
                      getsmsbr();
                      janex = 0;
                      febx = 0;
                      marx = 0;
                      aprx = 0;
                      junex = 0;
                      julyx = 0;
                      mayx = 0;
                      augustx = 0;
                      octx = 0;
                      septx = 0;
                      novx = 0;
                      decx = 0;
                      expens = 0;
                      jan = [];
                      feb = [];
                      mar = [];
                      apr = [];
                      may = [];
                      june = [];
                      july = [];
                      august = [];
                      september = [];
                      october = [];
                      november = [];
                      december = [];
                      await getsmsjg().then((value) {
                        for (int i = 0; i < _messages.length; i++) {
                          var message = _messages[i];
                          double rek = 0;
                          bool pp = true;
                          int dd = 1;
                          if (_messages[i].date?.year == DateTime.now().year) {
                            if (message.sender?.indexOf('BOBTXN') != -1) {
                              for (int j = 3; j < 15; j++) {
                                // print(message.body.toString()[j]);
                                if (isNumeric(message.body.toString()[j])) {
                                  if (pp) {
                                    rek = rek * 10 +
                                        double.parse(
                                            message.body.toString()[j]);
                                  } else {
                                    dd = dd + 1;
                                    double temp = double.parse(
                                        message.body.toString()[j]);
                                    int ne = dd;
                                    while (ne > 1) {
                                      ne--;
                                      temp = temp / 10;
                                    }
                                    rek = rek + temp;
                                  }
                                } else if (message.body.toString()[j] == '.') {
                                  // if(message.body.toString()[j-1]=='s'){
                                  //   continue;
                                  // }else{
                                  pp = false;
                                  // }
                                } else {
                                  if (message.body.toString()[j + 1] == 't') {
                                    // rek*=10;
                                    //  final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= -1;
                                    p.add(rek.toDouble());
                                    break;
                                  } else if (message.body.toString()[j + 1] ==
                                      'C') {
                                    // rek*=10;
                                    // final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= 1;
                                    p.add(rek.toDouble());
                                    break;
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('HDFCBK') !=
                                -1) {
                              if (_messages[i]
                                      .body
                                      .toString()
                                      .indexOf('credited') !=
                                  -1) {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        4;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    } else if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        3;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('SBIUPI') !=
                                -1) {
                              // print(message.body.toString());
                              if (message.body.toString().indexOf('credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            2;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('by') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                      // ignore: dead_code
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      break;
                                    } else if (message.body
                                            ?.indexOf('debited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('BOIIND') !=
                                -1) {
                              if (message.body.toString().indexOf('Credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('Credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            }
                            if (message.date?.month == DateTime.january) {
                              jan.add(rek);
                            }
                            if (message.date?.month == DateTime.february) {
                              feb.add(rek);
                            }
                            if (message.date?.month == DateTime.march) {
                              mar.add(rek);
                            }
                            if (message.date?.month == DateTime.april) {
                              apr.add(rek);
                            }
                            if (message.date?.month == DateTime.may) {
                              may.add(rek);
                            }
                            if (message.date?.month == DateTime.june) {
                              june.add(rek);
                            }
                            if (message.date?.month == DateTime.july) {
                              july.add(rek);
                            }
                            if (message.date?.month == DateTime.august) {
                              august.add(rek);
                            }
                            if (message.date?.month == DateTime.september) {
                              september.add(rek);
                            }
                            if (message.date?.month == DateTime.october) {
                              october.add(rek);
                            }
                            if (message.date?.month == DateTime.november) {
                              november.add(rek);
                            }
                            if (message.date?.month == DateTime.december) {
                              december.add(rek);
                            }
                          }
                        }
                        for (int i = 0; i < jan.length; i++) {
                          if (double.parse(jan[i].toString()).isNegative) {
                            expens = expens + double.parse(jan[i].toString());
                            janex = janex + double.parse(jan[i].toString());
                          }
                        }
                        for (int i = 0; i < feb.length; i++) {
                          if (double.parse(feb[i].toString()).isNegative) {
                            expens = expens + double.parse(feb[i].toString());
                            febx = febx + double.parse(feb[i].toString());
                          }
                        }

                        for (int i = 0; i < mar.length; i++) {
                          if (double.parse(mar[i].toString()).isNegative) {
                            expens = expens + double.parse(mar[i].toString());
                            marx = marx + double.parse(mar[i].toString());
                          }
                        }

                        for (int i = 0; i < apr.length; i++) {
                          if (double.parse(apr[i].toString()).isNegative) {
                            expens = expens + double.parse(apr[i].toString());
                            aprx = aprx + double.parse(apr[i].toString());
                          }
                        }

                        for (int i = 0; i < june.length; i++) {
                          if (double.parse(june[i].toString()).isNegative) {
                            expens = expens + double.parse(june[i].toString());
                            junex = junex + double.parse(june[i].toString());
                          }
                        }

                        for (int i = 0; i < july.length; i++) {
                          if (double.parse(july[i].toString()).isNegative) {
                            expens = expens + double.parse(july[i].toString());
                            julyx = julyx + double.parse(july[i].toString());
                          }
                        }

                        for (int i = 0; i < may.length; i++) {
                          if (double.parse(may[i].toString()).isNegative) {
                            expens = expens + double.parse(may[i].toString());
                            mayx = mayx + double.parse(may[i].toString());
                          }
                        }

                        for (int i = 0; i < august.length; i++) {
                          if (double.parse(august[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(august[i].toString());
                            augustx =
                                augustx + double.parse(august[i].toString());
                          }
                        }

                        for (int i = 0; i < september.length; i++) {
                          if (double.parse(september[i].toString())
                              .isNegative) {
                            expens =
                                expens + double.parse(september[i].toString());
                            septx =
                                septx + double.parse(september[i].toString());
                          }
                        }

                        for (int i = 0; i < october.length; i++) {
                          if (double.parse(october[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(october[i].toString());
                            octx = octx + double.parse(october[i].toString());
                          }
                        }
                        for (int i = 0; i < november.length; i++) {
                          if (double.parse(november[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(november[i].toString());
                            novx = novx + double.parse(november[i].toString());
                          }
                        }
                        for (int i = 0; i < december.length; i++) {
                          if (double.parse(december[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(december[i].toString());
                            decx = decx + double.parse(december[i].toString());
                          }
                        }
                        income = income.roundToDouble();
                        expens = -expens.roundToDouble();
                        print("jan total $janex");
                        setState(() {
                          state = 2;
                          streamController.add(1);
                          jant = -janex;
                          febt = -febx;
                          mart = -marx;
                          aprt = -aprx;
                          mayt = -mayx;
                          junt = -junex;
                          jult = -julyx;
                          augt = -augustx;
                          sept = -septx;
                          octt = -octx;
                          novt = -novx;
                          dect = -decx;
                          totalt = expens;
                        });
                      });
                      HapticFeedback.heavyImpact();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(186, 201, 255, 0.05),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        height: MediaQuery.of(context).size.height / 12,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(186, 201, 255, 0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Image(
                                    image: AssetImage("assets/images/bob.png"),
                                    height:
                                        MediaQuery.of(context).size.height / 25,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Bank of Baroda",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'AndersonB',
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // bank =2;
                      HapticFeedback.heavyImpact();
                      Navigator.of(context).pop();
                      _showDialog(context);
                      _messages = [];
                      state = 1;
                      getsmsjgsbp();
                      getsmsjgscp();
                      getsmsjgsqp();
                      getsmsjgsbw();
                      getsmsjgbx();
                      getsmsjgsbz();
                      getsmsjgsbv();
                      getsmsjgs();
                      getsmsbrs();
                      getsmsjms();
                      getsmsaxs();
                      getsmsJDs();
                      getsmsBPs();
                      getsmsvks();
                      getsmsads();
                      getsmsvms();
                      getsmsvm2s();
                      getsmsvm2svk();
                      janex = 0;
                      febx = 0;
                      marx = 0;
                      aprx = 0;
                      junex = 0;
                      julyx = 0;
                      mayx = 0;
                      augustx = 0;
                      octx = 0;
                      septx = 0;
                      novx = 0;
                      decx = 0;
                      expens = 0;
                      jan = [];
                      feb = [];
                      mar = [];
                      apr = [];
                      may = [];
                      june = [];
                      july = [];
                      august = [];
                      september = [];
                      october = [];
                      november = [];
                      december = [];
                      await getsmsvm2sba().then((value) {
                        for (int i = 0; i < _messages.length; i++) {
                          var message = _messages[i];
                          double rek = 0;
                          bool pp = true;
                          int dd = 1;
                          if (_messages[i].date?.year == DateTime.now().year) {
                            if (message.sender?.indexOf('BOBTXN') != -1) {
                              for (int j = 3; j < 15; j++) {
                                // print(message.body.toString()[j]);
                                if (isNumeric(message.body.toString()[j])) {
                                  if (pp) {
                                    rek = rek * 10 +
                                        double.parse(
                                            message.body.toString()[j]);
                                  } else {
                                    dd = dd + 1;
                                    double temp = double.parse(
                                        message.body.toString()[j]);
                                    int ne = dd;
                                    while (ne > 1) {
                                      ne--;
                                      temp = temp / 10;
                                    }
                                    rek = rek + temp;
                                  }
                                } else if (message.body.toString()[j] == '.') {
                                  // if(message.body.toString()[j-1]=='s'){
                                  //   continue;
                                  // }else{
                                  pp = false;
                                  // }
                                } else {
                                  if (message.body.toString()[j + 1] == 't') {
                                    // rek*=10;
                                    //  final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= -1;
                                    p.add(rek.toDouble());
                                    break;
                                  } else if (message.body.toString()[j + 1] ==
                                      'C') {
                                    // rek*=10;
                                    // final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= 1;
                                    p.add(rek.toDouble());
                                    break;
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('HDFCBK') !=
                                -1) {
                              if (_messages[i]
                                      .body
                                      .toString()
                                      .indexOf('credited') !=
                                  -1) {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        4;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    } else if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        3;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('SBIUPI') !=
                                -1) {
                              // print(message.body.toString());
                              if (message.body.toString().indexOf('credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            2;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('by') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                      // ignore: dead_code
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      break;
                                    } else if (message.body
                                            ?.indexOf('debited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('BOIIND') !=
                                -1) {
                              if (message.body.toString().indexOf('Credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('Credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            }
                            if (message.date?.month == DateTime.january) {
                              jan.add(rek);
                            }
                            if (message.date?.month == DateTime.february) {
                              feb.add(rek);
                            }
                            if (message.date?.month == DateTime.march) {
                              mar.add(rek);
                            }
                            if (message.date?.month == DateTime.april) {
                              apr.add(rek);
                            }
                            if (message.date?.month == DateTime.may) {
                              may.add(rek);
                            }
                            if (message.date?.month == DateTime.june) {
                              june.add(rek);
                            }
                            if (message.date?.month == DateTime.july) {
                              july.add(rek);
                            }
                            if (message.date?.month == DateTime.august) {
                              august.add(rek);
                            }
                            if (message.date?.month == DateTime.september) {
                              september.add(rek);
                            }
                            if (message.date?.month == DateTime.october) {
                              october.add(rek);
                            }
                            if (message.date?.month == DateTime.november) {
                              november.add(rek);
                            }
                            if (message.date?.month == DateTime.december) {
                              december.add(rek);
                            }
                          }
                        }
                        for (int i = 0; i < jan.length; i++) {
                          if (double.parse(jan[i].toString()).isNegative) {
                            expens = expens + double.parse(jan[i].toString());
                            janex = janex + double.parse(jan[i].toString());
                          }
                        }
                        for (int i = 0; i < feb.length; i++) {
                          if (double.parse(feb[i].toString()).isNegative) {
                            expens = expens + double.parse(feb[i].toString());
                            febx = febx + double.parse(feb[i].toString());
                          }
                        }

                        for (int i = 0; i < mar.length; i++) {
                          if (double.parse(mar[i].toString()).isNegative) {
                            expens = expens + double.parse(mar[i].toString());
                            marx = marx + double.parse(mar[i].toString());
                          }
                        }

                        for (int i = 0; i < apr.length; i++) {
                          if (double.parse(apr[i].toString()).isNegative) {
                            expens = expens + double.parse(apr[i].toString());
                            aprx = aprx + double.parse(apr[i].toString());
                          }
                        }

                        for (int i = 0; i < june.length; i++) {
                          if (double.parse(june[i].toString()).isNegative) {
                            expens = expens + double.parse(june[i].toString());
                            junex = junex + double.parse(june[i].toString());
                          }
                        }

                        for (int i = 0; i < july.length; i++) {
                          if (double.parse(july[i].toString()).isNegative) {
                            expens = expens + double.parse(july[i].toString());
                            julyx = julyx + double.parse(july[i].toString());
                          }
                        }

                        for (int i = 0; i < may.length; i++) {
                          if (double.parse(may[i].toString()).isNegative) {
                            expens = expens + double.parse(may[i].toString());
                            mayx = mayx + double.parse(may[i].toString());
                          }
                        }

                        for (int i = 0; i < august.length; i++) {
                          if (double.parse(august[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(august[i].toString());
                            augustx =
                                augustx + double.parse(august[i].toString());
                          }
                        }

                        for (int i = 0; i < september.length; i++) {
                          if (double.parse(september[i].toString())
                              .isNegative) {
                            expens =
                                expens + double.parse(september[i].toString());
                            septx =
                                septx + double.parse(september[i].toString());
                          }
                        }

                        for (int i = 0; i < october.length; i++) {
                          if (double.parse(october[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(october[i].toString());
                            octx = octx + double.parse(october[i].toString());
                          }
                        }
                        for (int i = 0; i < november.length; i++) {
                          if (double.parse(november[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(november[i].toString());
                            novx = novx + double.parse(november[i].toString());
                          }
                        }
                        for (int i = 0; i < december.length; i++) {
                          if (double.parse(december[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(december[i].toString());
                            decx = decx + double.parse(december[i].toString());
                          }
                        }
                        income = income.roundToDouble();
                        expens = -expens.roundToDouble();
                        print("jan total $janex");
                        setState(() {
                          state = 2;
                          streamController.add(1);
                          jant = -janex;
                          febt = -febx;
                          mart = -marx;
                          aprt = -aprx;
                          mayt = -mayx;
                          junt = -junex;
                          jult = -julyx;
                          augt = -augustx;
                          sept = -septx;
                          octt = -octx;
                          novt = -novx;
                          dect = -decx;
                          totalt = expens;
                        });
                      });
                      HapticFeedback.heavyImpact();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(186, 201, 255, 0.05),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        height: MediaQuery.of(context).size.height / 12,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(186, 201, 255, 0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Image(
                                    image: AssetImage("assets/images/sbi.jpg"),
                                    height:
                                        MediaQuery.of(context).size.height / 22,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "SBI",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'AndersonB',
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      HapticFeedback.heavyImpact();
                      // bank = 3
                      Navigator.of(context).pop();
                      _showDialog(context);
                      _messages = [];
                      state = 1;
                      getsmsvmbk();
                      getsmsvm2bk();
                      getsmsadbk();
                      getsmsJDbk();
                      getsmsBPbk();
                      getsmsvkbk();
                      getsmsaxbk();
                      getsmsjmbk();
                      getsmsjxbk();
                      janex = 0;
                      febx = 0;
                      marx = 0;
                      aprx = 0;
                      junex = 0;
                      julyx = 0;
                      mayx = 0;
                      augustx = 0;
                      octx = 0;
                      septx = 0;
                      novx = 0;
                      decx = 0;
                      expens = 0;
                      jan = [];
                      feb = [];
                      mar = [];
                      apr = [];
                      may = [];
                      june = [];
                      july = [];
                      august = [];
                      september = [];
                      october = [];
                      november = [];
                      december = [];
                      await getsmsjgbk().then((value) {
                        for (int i = 0; i < _messages.length; i++) {
                          var message = _messages[i];
                          double rek = 0;
                          bool pp = true;
                          int dd = 1;
                          if (_messages[i].date?.year == DateTime.now().year) {
                            if (message.sender?.indexOf('BOBTXN') != -1) {
                              for (int j = 3; j < 15; j++) {
                                // print(message.body.toString()[j]);
                                if (isNumeric(message.body.toString()[j])) {
                                  if (pp) {
                                    rek = rek * 10 +
                                        double.parse(
                                            message.body.toString()[j]);
                                  } else {
                                    dd = dd + 1;
                                    double temp = double.parse(
                                        message.body.toString()[j]);
                                    int ne = dd;
                                    while (ne > 1) {
                                      ne--;
                                      temp = temp / 10;
                                    }
                                    rek = rek + temp;
                                  }
                                } else if (message.body.toString()[j] == '.') {
                                  // if(message.body.toString()[j-1]=='s'){
                                  //   continue;
                                  // }else{
                                  pp = false;
                                  // }
                                } else {
                                  if (message.body.toString()[j + 1] == 't') {
                                    // rek*=10;
                                    //  final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= -1;
                                    p.add(rek.toDouble());
                                    break;
                                  } else if (message.body.toString()[j + 1] ==
                                      'C') {
                                    // rek*=10;
                                    // final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= 1;
                                    p.add(rek.toDouble());
                                    break;
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('HDFCBK') !=
                                -1) {
                              if (_messages[i]
                                      .body
                                      .toString()
                                      .indexOf('credited') !=
                                  -1) {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        4;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    } else if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        3;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('SBIUPI') !=
                                -1) {
                              // print(message.body.toString());
                              if (message.body.toString().indexOf('credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            2;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('by') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                      // ignore: dead_code
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      break;
                                    } else if (message.body
                                            ?.indexOf('debited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('BOIIND') !=
                                -1) {
                              if (message.body.toString().indexOf('Credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('Credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            }
                            if (message.date?.month == DateTime.january) {
                              jan.add(rek);
                            }
                            if (message.date?.month == DateTime.february) {
                              feb.add(rek);
                            }
                            if (message.date?.month == DateTime.march) {
                              mar.add(rek);
                            }
                            if (message.date?.month == DateTime.april) {
                              apr.add(rek);
                            }
                            if (message.date?.month == DateTime.may) {
                              may.add(rek);
                            }
                            if (message.date?.month == DateTime.june) {
                              june.add(rek);
                            }
                            if (message.date?.month == DateTime.july) {
                              july.add(rek);
                            }
                            if (message.date?.month == DateTime.august) {
                              august.add(rek);
                            }
                            if (message.date?.month == DateTime.september) {
                              september.add(rek);
                            }
                            if (message.date?.month == DateTime.october) {
                              october.add(rek);
                            }
                            if (message.date?.month == DateTime.november) {
                              november.add(rek);
                            }
                            if (message.date?.month == DateTime.december) {
                              december.add(rek);
                            }
                          }
                        }
                        for (int i = 0; i < jan.length; i++) {
                          if (double.parse(jan[i].toString()).isNegative) {
                            expens = expens + double.parse(jan[i].toString());
                            janex = janex + double.parse(jan[i].toString());
                          }
                        }
                        for (int i = 0; i < feb.length; i++) {
                          if (double.parse(feb[i].toString()).isNegative) {
                            expens = expens + double.parse(feb[i].toString());
                            febx = febx + double.parse(feb[i].toString());
                          }
                        }

                        for (int i = 0; i < mar.length; i++) {
                          if (double.parse(mar[i].toString()).isNegative) {
                            expens = expens + double.parse(mar[i].toString());
                            marx = marx + double.parse(mar[i].toString());
                          }
                        }

                        for (int i = 0; i < apr.length; i++) {
                          if (double.parse(apr[i].toString()).isNegative) {
                            expens = expens + double.parse(apr[i].toString());
                            aprx = aprx + double.parse(apr[i].toString());
                          }
                        }

                        for (int i = 0; i < june.length; i++) {
                          if (double.parse(june[i].toString()).isNegative) {
                            expens = expens + double.parse(june[i].toString());
                            junex = junex + double.parse(june[i].toString());
                          }
                        }

                        for (int i = 0; i < july.length; i++) {
                          if (double.parse(july[i].toString()).isNegative) {
                            expens = expens + double.parse(july[i].toString());
                            julyx = julyx + double.parse(july[i].toString());
                          }
                        }

                        for (int i = 0; i < may.length; i++) {
                          if (double.parse(may[i].toString()).isNegative) {
                            expens = expens + double.parse(may[i].toString());
                            mayx = mayx + double.parse(may[i].toString());
                          }
                        }

                        for (int i = 0; i < august.length; i++) {
                          if (double.parse(august[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(august[i].toString());
                            augustx =
                                augustx + double.parse(august[i].toString());
                          }
                        }

                        for (int i = 0; i < september.length; i++) {
                          if (double.parse(september[i].toString())
                              .isNegative) {
                            expens =
                                expens + double.parse(september[i].toString());
                            septx =
                                septx + double.parse(september[i].toString());
                          }
                        }

                        for (int i = 0; i < october.length; i++) {
                          if (double.parse(october[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(october[i].toString());
                            octx = octx + double.parse(october[i].toString());
                          }
                        }
                        for (int i = 0; i < november.length; i++) {
                          if (double.parse(november[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(november[i].toString());
                            novx = novx + double.parse(november[i].toString());
                          }
                        }
                        for (int i = 0; i < december.length; i++) {
                          if (double.parse(december[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(december[i].toString());
                            decx = decx + double.parse(december[i].toString());
                          }
                        }
                        income = income.roundToDouble();
                        expens = -expens.roundToDouble();
                        print("jan total $janex");
                        setState(() {
                          streamController.add(1);
                          state = 2;
                          jant = -janex;
                          febt = -febx;
                          mart = -marx;
                          aprt = -aprx;
                          mayt = -mayx;
                          junt = -junex;
                          jult = -julyx;
                          augt = -augustx;
                          sept = -septx;
                          octt = -octx;
                          novt = -novx;
                          dect = -decx;
                          totalt = expens;
                        });
                      });
                      HapticFeedback.heavyImpact();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(186, 201, 255, 0.05),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        height: MediaQuery.of(context).size.height / 12,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(186, 201, 255, 0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Image(
                                    image: AssetImage("assets/images/hdfc.png"),
                                    height:
                                        MediaQuery.of(context).size.height / 22,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "HDFC",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'AndersonB',
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.heavyImpact();
                      // bank=4;
                      Navigator.of(context).pop();
                      _showDialog(context);
                      state = 1;
                      _messages = [];
                      getsmsjgsbpboi();
                      getsmsjgscpboi();
                      getsmsjgsqpboi();
                      getsmsjgsboi();
                      getsmsjgboi();
                      getsmsjsboi();
                      getsmjgsboi();
                      getmsjgboi();
                      getsmsbrboi();
                      getsmsjmboi();
                      getsmsaxboi();
                      getsmsJDboi();
                      getsmsboi();
                      getsmsvksboi();
                      getsmsadsboi();
                      getsmsvmsboi();
                      getsmsvm2sboi();
                      getsmsvmboi();
                      janex = 0;
                      febx = 0;
                      marx = 0;
                      aprx = 0;
                      junex = 0;
                      julyx = 0;
                      mayx = 0;
                      augustx = 0;
                      octx = 0;
                      septx = 0;
                      novx = 0;
                      decx = 0;
                      expens = 0;
                      jan = [];
                      feb = [];
                      mar = [];
                      apr = [];
                      may = [];
                      june = [];
                      july = [];
                      august = [];
                      september = [];
                      october = [];
                      november = [];
                      december = [];
                      getsmsvm2boi().then((value) {
                        for (int i = 0; i < _messages.length; i++) {
                          var message = _messages[i];
                          double rek = 0;
                          bool pp = true;
                          int dd = 1;
                          if (_messages[i].date?.year == DateTime.now().year) {
                            if (message.sender?.indexOf('BOBTXN') != -1) {
                              for (int j = 3; j < 15; j++) {
                                // print(message.body.toString()[j]);
                                if (isNumeric(message.body.toString()[j])) {
                                  if (pp) {
                                    rek = rek * 10 +
                                        double.parse(
                                            message.body.toString()[j]);
                                  } else {
                                    dd = dd + 1;
                                    double temp = double.parse(
                                        message.body.toString()[j]);
                                    int ne = dd;
                                    while (ne > 1) {
                                      ne--;
                                      temp = temp / 10;
                                    }
                                    rek = rek + temp;
                                  }
                                } else if (message.body.toString()[j] == '.') {
                                  // if(message.body.toString()[j-1]=='s'){
                                  //   continue;
                                  // }else{
                                  pp = false;
                                  // }
                                } else {
                                  if (message.body.toString()[j + 1] == 't') {
                                    // rek*=10;
                                    //  final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= -1;
                                    p.add(rek.toDouble());
                                    break;
                                  } else if (message.body.toString()[j + 1] ==
                                      'C') {
                                    // rek*=10;
                                    // final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= 1;
                                    p.add(rek.toDouble());
                                    break;
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('HDFCBK') !=
                                -1) {
                              if (_messages[i]
                                      .body
                                      .toString()
                                      .indexOf('credited') !=
                                  -1) {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        4;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    } else if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        3;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('SBIUPI') !=
                                -1) {
                              // print(message.body.toString());
                              if (message.body.toString().indexOf('credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            2;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('by') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                      // ignore: dead_code
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      break;
                                    } else if (message.body
                                            ?.indexOf('debited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('BOIIND') !=
                                -1) {
                              if (message.body.toString().indexOf('Credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('Credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            }
                            if (message.date?.month == DateTime.january) {
                              jan.add(rek);
                            }
                            if (message.date?.month == DateTime.february) {
                              feb.add(rek);
                            }
                            if (message.date?.month == DateTime.march) {
                              mar.add(rek);
                            }
                            if (message.date?.month == DateTime.april) {
                              apr.add(rek);
                            }
                            if (message.date?.month == DateTime.may) {
                              may.add(rek);
                            }
                            if (message.date?.month == DateTime.june) {
                              june.add(rek);
                            }
                            if (message.date?.month == DateTime.july) {
                              july.add(rek);
                            }
                            if (message.date?.month == DateTime.august) {
                              august.add(rek);
                            }
                            if (message.date?.month == DateTime.september) {
                              september.add(rek);
                            }
                            if (message.date?.month == DateTime.october) {
                              october.add(rek);
                            }
                            if (message.date?.month == DateTime.november) {
                              november.add(rek);
                            }
                            if (message.date?.month == DateTime.december) {
                              december.add(rek);
                            }
                          }
                        }
                        for (int i = 0; i < jan.length; i++) {
                          if (double.parse(jan[i].toString()).isNegative) {
                            expens = expens + double.parse(jan[i].toString());
                            janex = janex + double.parse(jan[i].toString());
                          }
                        }
                        for (int i = 0; i < feb.length; i++) {
                          if (double.parse(feb[i].toString()).isNegative) {
                            expens = expens + double.parse(feb[i].toString());
                            febx = febx + double.parse(feb[i].toString());
                          }
                        }

                        for (int i = 0; i < mar.length; i++) {
                          if (double.parse(mar[i].toString()).isNegative) {
                            expens = expens + double.parse(mar[i].toString());
                            marx = marx + double.parse(mar[i].toString());
                          }
                        }

                        for (int i = 0; i < apr.length; i++) {
                          if (double.parse(apr[i].toString()).isNegative) {
                            expens = expens + double.parse(apr[i].toString());
                            aprx = aprx + double.parse(apr[i].toString());
                          }
                        }

                        for (int i = 0; i < june.length; i++) {
                          if (double.parse(june[i].toString()).isNegative) {
                            expens = expens + double.parse(june[i].toString());
                            junex = junex + double.parse(june[i].toString());
                          }
                        }

                        for (int i = 0; i < july.length; i++) {
                          if (double.parse(july[i].toString()).isNegative) {
                            expens = expens + double.parse(july[i].toString());
                            julyx = julyx + double.parse(july[i].toString());
                          }
                        }

                        for (int i = 0; i < may.length; i++) {
                          if (double.parse(may[i].toString()).isNegative) {
                            expens = expens + double.parse(may[i].toString());
                            mayx = mayx + double.parse(may[i].toString());
                          }
                        }

                        for (int i = 0; i < august.length; i++) {
                          if (double.parse(august[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(august[i].toString());
                            augustx =
                                augustx + double.parse(august[i].toString());
                          }
                        }

                        for (int i = 0; i < september.length; i++) {
                          if (double.parse(september[i].toString())
                              .isNegative) {
                            expens =
                                expens + double.parse(september[i].toString());
                            septx =
                                septx + double.parse(september[i].toString());
                          }
                        }

                        for (int i = 0; i < october.length; i++) {
                          if (double.parse(october[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(october[i].toString());
                            octx = octx + double.parse(october[i].toString());
                          }
                        }
                        for (int i = 0; i < november.length; i++) {
                          if (double.parse(november[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(november[i].toString());
                            novx = novx + double.parse(november[i].toString());
                          }
                        }
                        for (int i = 0; i < december.length; i++) {
                          if (double.parse(december[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(december[i].toString());
                            decx = decx + double.parse(december[i].toString());
                          }
                        }
                        income = income.roundToDouble();
                        expens = -expens.roundToDouble();
                        print("jan total $janex");
                        setState(() {
                          streamController.add(1);
                          state = 2;
                          jant = -janex;
                          febt = -febx;
                          mart = -marx;
                          aprt = -aprx;
                          mayt = -mayx;
                          junt = -junex;
                          jult = -julyx;
                          augt = -augustx;
                          sept = -septx;
                          octt = -octx;
                          novt = -novx;
                          dect = -decx;
                          totalt = expens;
                        });
                      });
                      HapticFeedback.heavyImpact();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(186, 201, 255, 0.05),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      height: MediaQuery.of(context).size.height / 12,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(186, 201, 255, 0.1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image(
                                  image: AssetImage("assets/images/boi.jpg"),
                                  height:
                                      MediaQuery.of(context).size.height / 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Bank of India",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'AndersonB',
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // bank=4;
                      HapticFeedback.heavyImpact();
                      Navigator.of(context).pop();
                      _showDialog(context);
                      state = 1;
                      _messages = [];
                      trialBPs();
                      trialJDs();
                      trialads();
                      trialaxs();
                      trialba();
                      trialbrs();
                      trialbv();
                      trialbw();
                      trialbx();
                      trialbz();
                      trialcp();
                      trialgs();
                      trialms();
                      trialqp();
                      trialvk();
                      trialvks();
                      trialvm2s();

                      janex = 0;
                      febx = 0;
                      marx = 0;
                      aprx = 0;
                      junex = 0;
                      julyx = 0;
                      mayx = 0;
                      augustx = 0;
                      octx = 0;
                      septx = 0;
                      novx = 0;
                      decx = 0;
                      expens = 0;
                      jan = [];
                      feb = [];
                      mar = [];
                      apr = [];
                      may = [];
                      june = [];
                      july = [];
                      august = [];
                      september = [];
                      october = [];
                      november = [];
                      december = [];
                      trialvms().then((value) {
                        for (int i = 0; i < _messages.length; i++) {
                          var message = _messages[i];
                          double rek = 0;
                          bool pp = true;
                          int dd = 1;
                          if (_messages[i].date?.year == DateTime.now().year) {
                            if (message.sender?.indexOf('BOBTXN') != -1) {
                              for (int j = 3; j < 15; j++) {
                                // print(message.body.toString()[j]);
                                if (isNumeric(message.body.toString()[j])) {
                                  if (pp) {
                                    rek = rek * 10 +
                                        double.parse(
                                            message.body.toString()[j]);
                                  } else {
                                    dd = dd + 1;
                                    double temp = double.parse(
                                        message.body.toString()[j]);
                                    int ne = dd;
                                    while (ne > 1) {
                                      ne--;
                                      temp = temp / 10;
                                    }
                                    rek = rek + temp;
                                  }
                                } else if (message.body.toString()[j] == '.') {
                                  // if(message.body.toString()[j-1]=='s'){
                                  //   continue;
                                  // }else{
                                  pp = false;
                                  // }
                                } else {
                                  if (message.body.toString()[j + 1] == 't') {
                                    // rek*=10;
                                    //  final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= -1;
                                    p.add(rek.toDouble());
                                    break;
                                  } else if (message.body.toString()[j + 1] ==
                                      'C') {
                                    // rek*=10;
                                    // final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= 1;
                                    p.add(rek.toDouble());
                                    break;
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('HDFCBK') !=
                                -1) {
                              if (_messages[i]
                                      .body
                                      .toString()
                                      .indexOf('credited') !=
                                  -1) {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        4;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    } else if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      print(rek);
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j = _messages[i]
                                            .body
                                            .toString()
                                            .indexOf('Rs') +
                                        3;
                                    j < _messages[i].body.toString().length;
                                    j++) {
                                  if (isNumeric(
                                      _messages[i].body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              _messages[i].body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(_messages[i].body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (_messages[i].body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (_messages[i]
                                            .body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('SBIUPI') !=
                                -1) {
                              // print(message.body.toString());
                              if (message.body.toString().indexOf('credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            2;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('by') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  print(message.body?[j]);
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                      // ignore: dead_code
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('credited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      p.add(rek.toDouble());
                                      break;
                                    } else if (message.body
                                            ?.indexOf('debited') !=
                                        -1) {
                                      // rek *= 10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('BOIIND') !=
                                -1) {
                              if (message.body.toString().indexOf('Credited') !=
                                  -1) {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('Credited') !=
                                        -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      // print(rek);
                                      p.add(rek.toDouble());

                                      break;
                                    } else if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp = double.parse(
                                          message.body.toString()[j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                            .toString()
                                            .indexOf('debited') !=
                                        -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      // print(rek);
                                      p.add(rek.toDouble());
                                      break;
                                    }
                                  }
                                }
                              }
                            } else if (message.sender?.indexOf('ICICIB') !=
                                -1) {
                              print("inside ${message.body}");
                              if (message.body.toString().indexOf('credited') !=
                                      -1 &&
                                  message.body.toString().indexOf('debited') !=
                                      -1) {
                                print("inside if");
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                                .toString()
                                                .indexOf('credited') !=
                                            -1 &&
                                        message.body
                                                .toString()
                                                .indexOf('debited') !=
                                            -1) {
                                      // rek*=10;
                                      //  final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      print(rek);
                                      p.add(rek);
                                      break;
                                    } else {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= 1;
                                      print(rek);
                                      p.add(rek);
                                      break;
                                    }
                                  }
                                }
                              } else {
                                for (int j =
                                        message.body.toString().indexOf('Rs') +
                                            3;
                                    j < message.body.toString().length;
                                    j++) {
                                  if (isNumeric(message.body.toString()[j])) {
                                    if (pp) {
                                      rek = rek * 10 +
                                          double.parse(
                                              message.body.toString()[j]);
                                    } else {
                                      dd = dd + 1;
                                      double temp =
                                          double.parse(message.body![j]);
                                      int ne = dd;
                                      while (ne > 1) {
                                        ne--;
                                        temp = temp / 10;
                                      }
                                      rek = rek + temp;
                                    }
                                  } else if (message.body.toString()[j] ==
                                      '.') {
                                    // if(message.body.toString()[j-1]=='s'){
                                    //   continue;
                                    // }else{
                                    pp = false;
                                    // }
                                  } else {
                                    if (message.body
                                                .toString()
                                                .indexOf('debited') !=
                                            -1 &&
                                        message.body
                                                .toString()
                                                .indexOf('debited') !=
                                            -1) {
                                      // rek*=10;
                                      // final chars = rek.toString().split('');
                                      // rek = double.parse(chars.reversed.join());
                                      rek *= -1;
                                      print(rek);
                                      p.add(rek);
                                      break;
                                    }
                                  }
                                }
                              }
                            }
                            if (message.date?.month == DateTime.january) {
                              jan.add(rek);
                            }
                            if (message.date?.month == DateTime.february) {
                              feb.add(rek);
                            }
                            if (message.date?.month == DateTime.march) {
                              mar.add(rek);
                            }
                            if (message.date?.month == DateTime.april) {
                              apr.add(rek);
                            }
                            if (message.date?.month == DateTime.may) {
                              may.add(rek);
                            }
                            if (message.date?.month == DateTime.june) {
                              june.add(rek);
                            }
                            if (message.date?.month == DateTime.july) {
                              july.add(rek);
                            }
                            if (message.date?.month == DateTime.august) {
                              august.add(rek);
                            }
                            if (message.date?.month == DateTime.september) {
                              september.add(rek);
                            }
                            if (message.date?.month == DateTime.october) {
                              october.add(rek);
                            }
                            if (message.date?.month == DateTime.november) {
                              november.add(rek);
                            }
                            if (message.date?.month == DateTime.december) {
                              december.add(rek);
                            }
                          }
                        }
                        for (int i = 0; i < jan.length; i++) {
                          if (double.parse(jan[i].toString()).isNegative) {
                            expens = expens + double.parse(jan[i].toString());
                            janex = janex + double.parse(jan[i].toString());
                          }
                        }
                        for (int i = 0; i < feb.length; i++) {
                          if (double.parse(feb[i].toString()).isNegative) {
                            expens = expens + double.parse(feb[i].toString());
                            febx = febx + double.parse(feb[i].toString());
                          }
                        }

                        for (int i = 0; i < mar.length; i++) {
                          if (double.parse(mar[i].toString()).isNegative) {
                            expens = expens + double.parse(mar[i].toString());
                            marx = marx + double.parse(mar[i].toString());
                          }
                        }

                        for (int i = 0; i < apr.length; i++) {
                          if (double.parse(apr[i].toString()).isNegative) {
                            expens = expens + double.parse(apr[i].toString());
                            aprx = aprx + double.parse(apr[i].toString());
                          }
                        }

                        for (int i = 0; i < june.length; i++) {
                          if (double.parse(june[i].toString()).isNegative) {
                            expens = expens + double.parse(june[i].toString());
                            junex = junex + double.parse(june[i].toString());
                          }
                        }

                        for (int i = 0; i < july.length; i++) {
                          if (double.parse(july[i].toString()).isNegative) {
                            expens = expens + double.parse(july[i].toString());
                            julyx = julyx + double.parse(july[i].toString());
                          }
                        }

                        for (int i = 0; i < may.length; i++) {
                          if (double.parse(may[i].toString()).isNegative) {
                            expens = expens + double.parse(may[i].toString());
                            mayx = mayx + double.parse(may[i].toString());
                          }
                        }

                        for (int i = 0; i < august.length; i++) {
                          if (double.parse(august[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(august[i].toString());
                            augustx =
                                augustx + double.parse(august[i].toString());
                          }
                        }

                        for (int i = 0; i < september.length; i++) {
                          if (double.parse(september[i].toString())
                              .isNegative) {
                            expens =
                                expens + double.parse(september[i].toString());
                            septx =
                                septx + double.parse(september[i].toString());
                          }
                        }

                        for (int i = 0; i < october.length; i++) {
                          if (double.parse(october[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(october[i].toString());
                            octx = octx + double.parse(october[i].toString());
                          }
                        }
                        for (int i = 0; i < november.length; i++) {
                          if (double.parse(november[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(november[i].toString());
                            novx = novx + double.parse(november[i].toString());
                          }
                        }
                        for (int i = 0; i < december.length; i++) {
                          if (double.parse(december[i].toString()).isNegative) {
                            expens =
                                expens + double.parse(december[i].toString());
                            decx = decx + double.parse(december[i].toString());
                          }
                        }
                        income = income.roundToDouble();
                        expens = -expens.roundToDouble();
                        print("may total $mayx");
                        setState(() {
                          streamController.add(1);
                          state = 2;
                          jant = -janex;
                          febt = -febx;
                          mart = -marx;
                          aprt = -aprx;
                          mayt = -mayx;
                          junt = -junex;
                          jult = -julyx;
                          augt = -augustx;
                          sept = -septx;
                          octt = -octx;
                          novt = -novx;
                          dect = -decx;
                          totalt = expens;
                        });
                      });
                      HapticFeedback.heavyImpact();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(186, 201, 255, 0.05),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      height: MediaQuery.of(context).size.height / 12,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(186, 201, 255, 0.1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image(
                                  image: AssetImage("assets/images/icici.jpg"),
                                  height:
                                      MediaQuery.of(context).size.height / 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "ICICI",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'AndersonB',
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              );
            },
            stream: null,
          ),
        );
      },
    );
  }

  void getData() async {
    Map<String, dynamic>? temp1 = await FirebaseFirestore.instance
        .collection("personal expense")
        .doc(nav.curruserID)
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
        user2 = temp1['username'];
        print(jan2);
        print(feb2);
        print(mar2);
        isData = true;
      });
    }
  }

  void getperms() async {
    var status = await Permission.sms.status;
    await Permission.sms.request();
    if (status.isDenied) {
      await Permission.sms.request();
    }
  }

  @override
  void initState() {
    super.initState();
    getUsername();
    getData();
    getperms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WillPopScope(
        onWillPop: () async {
          return await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => nav.NavPage(
                        pageIndex: 0,
                      )));
        },
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color.fromRGBO(161, 128, 255, 0.5),
                              const Color.fromRGBO(117, 114, 255, 0.3),
                              const Color.fromRGBO(132, 112, 255, 0.01),
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Total Expense",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'AndersonB',
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  children: [
                                    Text("₹ ",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontFamily: 'Neo')),
                                    Text(totalt.abs().toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontFamily: 'Neo',
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Chart(layers: layers()),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Monthly(
                                          december: december,
                                          november: november,
                                          october: october,
                                          september: september,
                                          august: august,
                                          july: july,
                                          june: june,
                                          may: may,
                                          apr: apr,
                                          mar: mar,
                                          feb: feb,
                                          jan: jan,
                                          janx: janex,
                                          febx: febx,
                                          marx: marx,
                                          mayx: mayx,
                                          aprx: aprx,
                                          junex: junex,
                                          julyx: julyx,
                                          augustx: augustx,
                                          septx: septx,
                                          octx: octx,
                                          novx: novx,
                                          decx: decx)));
                              HapticFeedback.heavyImpact();
                            },
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Center(
                                child: Text(
                                  (details)
                                      ? "Get Details"
                                      : ("Click Calculate"),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'Neo',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, right: 25, left: 25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      _createRoute(Dashboard(
                                        jan2: jan2,
                                        feb2: feb2,
                                        mar2: mar2,
                                        apr2: apr2,
                                        may2: may2,
                                        jun2: jun2,
                                        jul2: jul2,
                                        aug2: aug2,
                                        sep2: sep2,
                                        oct2: oct2,
                                        nov2: nov2,
                                        dec2: dec2,
                                        isData: isData,
                                      )));
                                  HapticFeedback.heavyImpact();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(186, 201, 255, 0.1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Connect",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: 'AndersonB',
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      _createRoute(Monthly(
                                          december: december,
                                          november: november,
                                          october: october,
                                          september: september,
                                          august: august,
                                          july: july,
                                          june: june,
                                          may: may,
                                          apr: apr,
                                          mar: mar,
                                          feb: feb,
                                          jan: jan,
                                          janx: janex,
                                          febx: febx,
                                          marx: marx,
                                          mayx: mayx,
                                          aprx: aprx,
                                          junex: junex,
                                          julyx: julyx,
                                          augustx: augustx,
                                          septx: septx,
                                          octx: octx,
                                          novx: novx,
                                          decx: decx)));
                                  HapticFeedback.heavyImpact();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(186, 201, 255, 0.1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Text(
                                              "Monthly",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontFamily: 'AndersonB',
                                              ),
                                            )),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                _showBank(context);
                                setState(() {
                                  details = true;
                                });
                                HapticFeedback.heavyImpact();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(186, 201, 255, 0.1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                height: MediaQuery.of(context).size.height / 15,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Calculate",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontFamily: 'AndersonB',
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 0, right: 0, bottom: 20),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          //color: Color.fromRGBO(186, 201, 255, 0.1),
                          // color: Color.fromRGBO(186, 201, 255, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: MediaQuery.of(context).size.width / 1.05,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12.0, left: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 20),
                                          child: Text(
                                            "Connect with others",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueGrey,
                                              fontFamily: 'AndersonB',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 20),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.9,
                                            child: Text(
                                              "Add another member from settings and compare.\nGet userkey from settings to share with others",
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.white60,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, right: 0),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/connect.gif"),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    )
                    /*Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(186, 201, 255, 0.1),
                          // color: Color.fromRGBO(186, 201, 255, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12.0, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 5),
                                      child: Text(
                                        "Get your Userkey",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontFamily: 'AndersonB',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.75,
                                        child: Text(
                                          "Get userkey from settings to share with others",
                                          style: GoogleFonts.ubuntu(
                                              color: Colors.grey.shade800,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25.0, right: 5),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/userkey.png"),
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    */ /*
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Recent Transactions:",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontFamily: 'AndersonB',
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: ListView.builder(
                                itemCount: 10,
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
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 8,
                                                    top: 8),
                                                child: Text(
                                                  "Merchant",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontFamily: 'Anderson',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "-₹ 100",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red,
                                                fontFamily: 'AndersonB',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    )*/
                    /*
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                          ),
                          Card(
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                          )
                        ],
                      ),
                    )*/
                  ],
                ),
              ),
              Visibility(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 2)),
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Please wait",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Anderson',
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "While we invade your privacy!",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontFamily: 'Neo',
                                  fontWeight: FontWeight.w500),
                            ),
                            Image(
                                image: AssetImage("assets/images/loading.gif")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  visible: _isLoading)
            ],
          ),
        ),
      ),
    );
  }

  void calculate(List<SmsMessage> _message) {
    print("insidde cal");
    double rek = 0;
    bool pp = true;
    int dd = 1;
    for (int i = 0; i < _message.length; i++) {
      if (_message[i].date?.year == DateTime.now().year) {
        var message = _message[i];
        if (message.sender?.indexOf('BOBTXN') != -1) {
          for (int j = 3; j < 15; j++) {
            // print(message.body.toString()[j]);
            if (isNumeric(message.body.toString()[j])) {
              if (pp) {
                rek = rek * 10 + double.parse(message.body.toString()[j]);
              } else {
                dd = dd + 1;
                double temp = double.parse(message.body.toString()[j]);
                int ne = dd;
                while (ne > 1) {
                  ne--;
                  temp = temp / 10;
                }
                rek = rek + temp;
              }
            } else if (message.body.toString()[j] == '.') {
              // if(message.body.toString()[j-1]=='s'){
              //   continue;
              // }else{
              pp = false;
              // }
            } else {
              if (message.body.toString()[j + 1] == 't') {
                // rek*=10;
                //  final chars = rek.toString().split('');
                // rek = double.parse(chars.reversed.join());
                rek *= -1;
                p.add(rek.toDouble());
                break;
              } else if (message.body.toString()[j + 1] == 'C') {
                // rek*=10;
                // final chars = rek.toString().split('');
                // rek = double.parse(chars.reversed.join());
                rek *= 1;
                p.add(rek.toDouble());
                break;
              }
            }
          }
        } else if (message.sender?.indexOf('HDFCBK') != -1) {
          if (_messages[i].body.toString().indexOf('credited') != -1) {
            for (int j = _messages[i].body.toString().indexOf('Rs') + 4;
                j < _messages[i].body.toString().length;
                j++) {
              if (isNumeric(_messages[i].body.toString()[j])) {
                if (pp) {
                  rek =
                      rek * 10 + double.parse(_messages[i].body.toString()[j]);
                } else {
                  dd = dd + 1;
                  double temp = double.parse(_messages[i].body![j]);
                  int ne = dd;
                  while (ne > 1) {
                    ne--;
                    temp = temp / 10;
                  }
                  rek = rek + temp;
                }
              } else if (_messages[i].body.toString()[j] == '.') {
                // if(message.body.toString()[j-1]=='s'){
                //   continue;
                // }else{
                pp = false;
                // }
              } else {
                if (_messages[i].body.toString().indexOf('credited') != -1) {
                  // rek*=10;
                  //  final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= 1;
                  p.add(rek.toDouble());
                  print(rek);
                  break;
                } else if (_messages[i].body.toString().indexOf('debited') !=
                    -1) {
                  // rek*=10;
                  // final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= -1;
                  p.add(rek.toDouble());
                  print(rek);
                  break;
                }
              }
            }
          } else {
            for (int j = _messages[i].body.toString().indexOf('Rs') + 3;
                j < _messages[i].body.toString().length;
                j++) {
              if (isNumeric(_messages[i].body.toString()[j])) {
                if (pp) {
                  rek =
                      rek * 10 + double.parse(_messages[i].body.toString()[j]);
                } else {
                  dd = dd + 1;
                  double temp = double.parse(_messages[i].body![j]);
                  int ne = dd;
                  while (ne > 1) {
                    ne--;
                    temp = temp / 10;
                  }
                  rek = rek + temp;
                }
              } else if (_messages[i].body.toString()[j] == '.') {
                // if(message.body.toString()[j-1]=='s'){
                //   continue;
                // }else{
                pp = false;
                // }
              } else {
                if (_messages[i].body.toString().indexOf('credited') != -1) {
                  // rek*=10;
                  //  final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= 1;
                  // print(rek);
                  p.add(rek.toDouble());

                  break;
                } else {
                  // rek*=10;
                  // final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= -1;
                  // print(rek);
                  p.add(rek.toDouble());
                  break;
                }
              }
            }
          }
        } else if (message.sender?.indexOf('SBIUPI') != -1) {
          // print(message.body.toString());
          if (message.body.toString().indexOf('credited') != -1) {
            for (int j = message.body.toString().indexOf('Rs') + 2;
                j < message.body.toString().length;
                j++) {
              print(message.body?[j]);
              if (isNumeric(message.body.toString()[j])) {
                if (pp) {
                  rek = rek * 10 + double.parse(message.body.toString()[j]);
                } else {
                  dd = dd + 1;
                  double temp = double.parse(message.body![j]);
                  int ne = dd;
                  while (ne > 1) {
                    ne--;
                    temp = temp / 10;
                  }
                  rek = rek + temp;
                }
              } else if (message.body.toString()[j] == '.') {
                // if(message.body.toString()[j-1]=='s'){
                //   continue;
                // }else{
                pp = false;
                // }
              } else {
                if (message.body.toString().indexOf('credited') != -1) {
                  // rek*=10;
                  //  final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= 1;
                  p.add(rek.toDouble());

                  break;
                } else if (message.body.toString().indexOf('debited') != -1) {
                  // rek*=10;
                  // final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= -1;
                  p.add(rek.toDouble());
                  break;
                }
              }
            }
          } else {
            for (int j = message.body.toString().indexOf('by') + 3;
                j < message.body.toString().length;
                j++) {
              print(message.body?[j]);
              if (isNumeric(message.body.toString()[j])) {
                if (pp) {
                  rek = rek * 10 + double.parse(message.body.toString()[j]);
                  // ignore: dead_code
                } else {
                  dd = dd + 1;
                  double temp = double.parse(message.body![j]);
                  int ne = dd;
                  while (ne > 1) {
                    ne--;
                    temp = temp / 10;
                  }
                  rek = rek + temp;
                }
              } else {
                if (message.body.toString().indexOf('credited') != -1) {
                  // rek *= 10;
                  // final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= 1;
                  p.add(rek.toDouble());
                  break;
                } else if (message.body?.indexOf('debited') != -1) {
                  // rek *= 10;
                  // final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= -1;
                  p.add(rek.toDouble());
                  break;
                }
              }
            }
          }
        } else if (message.sender?.indexOf('BOIIND') != -1) {
          if (message.body.toString().indexOf('Credited') != -1) {
            for (int j = message.body.toString().indexOf('Rs') + 3;
                j < message.body.toString().length;
                j++) {
              if (isNumeric(message.body.toString()[j])) {
                if (pp) {
                  rek = rek * 10 + double.parse(message.body.toString()[j]);
                } else {
                  dd = dd + 1;
                  double temp = double.parse(message.body.toString()[j]);
                  int ne = dd;
                  while (ne > 1) {
                    ne--;
                    temp = temp / 10;
                  }
                  rek = rek + temp;
                }
              } else if (message.body.toString()[j] == '.') {
                // if(message.body.toString()[j-1]=='s'){
                //   continue;
                // }else{
                pp = false;
                // }
              } else {
                if (message.body.toString().indexOf('Credited') != -1) {
                  // rek*=10;
                  //  final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= 1;
                  // print(rek);
                  p.add(rek.toDouble());

                  break;
                } else if (message.body.toString().indexOf('debited') != -1) {
                  // rek*=10;
                  // final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= -1;
                  // print(rek);
                  p.add(rek.toDouble());
                  break;
                }
              }
            }
          } else {
            for (int j = message.body.toString().indexOf('Rs') + 3;
                j < message.body.toString().length;
                j++) {
              if (isNumeric(message.body.toString()[j])) {
                if (pp) {
                  rek = rek * 10 + double.parse(message.body.toString()[j]);
                } else {
                  dd = dd + 1;
                  double temp = double.parse(message.body.toString()[j]);
                  int ne = dd;
                  while (ne > 1) {
                    ne--;
                    temp = temp / 10;
                  }
                  rek = rek + temp;
                }
              } else if (message.body.toString()[j] == '.') {
                // if(message.body.toString()[j-1]=='s'){
                //   continue;
                // }else{
                pp = false;
                // }
              } else {
                if (message.body.toString().indexOf('debited') != -1) {
                  // rek*=10;
                  // final chars = rek.toString().split('');
                  // rek = double.parse(chars.reversed.join());
                  rek *= -1;
                  // print(rek);
                  p.add(rek.toDouble());
                  break;
                }
              }
            }
          }
        }

        if (message.date?.month == DateTime.january) {
          jan.add(rek);
        }
        if (message.date?.month == DateTime.february) {
          feb.add(rek);
        }
        if (message.date?.month == DateTime.march) {
          mar.add(rek);
        }
        if (message.date?.month == DateTime.april) {
          apr.add(rek);
        }
        if (message.date?.month == DateTime.may) {
          may.add(rek);
        }
        if (message.date?.month == DateTime.june) {
          june.add(rek);
        }
        if (message.date?.month == DateTime.july) {
          july.add(rek);
        }
        if (message.date?.month == DateTime.august) {
          august.add(rek);
        }
        if (message.date?.month == DateTime.september) {
          september.add(rek);
        }
        if (message.date?.month == DateTime.october) {
          october.add(rek);
        }
        if (message.date?.month == DateTime.november) {
          november.add(rek);
        }
        if (message.date?.month == DateTime.december) {
          december.add(rek);
        }
      }
    }
    // messages.forEach((message) {
    //   if (message.date?.year ==
    //       DateTime
    //           .now()
    //           .year) {
    //     if (message.sender?.indexOf('BOBTXN') != -1) {
    //       for (int j = 3; j < 15; j++) {
    //         // print(message.body.toString()[j]);
    //         if (isNumeric(message.body.toString()[j])) {
    //           if (pp) {
    //             rek = rek * 10 +
    //                 double.parse(
    //                     message.body.toString()[j]);
    //           } else {
    //             dd = dd + 1;
    //             double temp = double.parse(
    //                 message.body.toString()[j]);
    //             int ne = dd;
    //             while (ne > 1) {
    //               ne--;
    //               temp = temp / 10;
    //             }
    //             rek = rek + temp;
    //           }
    //         } else if (message.body.toString()[j] == '.') {
    //           // if(message.body.toString()[j-1]=='s'){
    //           //   continue;
    //           // }else{
    //           pp = false;
    //           // }
    //         } else {
    //           if (message.body.toString()[j + 1] == 't') {
    //             // rek*=10;
    //             //  final chars = rek.toString().split('');
    //             // rek = double.parse(chars.reversed.join());
    //             rek *= -1;
    //             p.add(rek.toDouble());
    //             break;
    //           } else if (message.body.toString()[j + 1] ==
    //               'C') {
    //             // rek*=10;
    //             // final chars = rek.toString().split('');
    //             // rek = double.parse(chars.reversed.join());
    //             rek *= 1;
    //             p.add(rek.toDouble());
    //             break;
    //           }
    //         }
    //       }
    //     }
    //     else if (message.sender?.indexOf('HDFCBK') != -1) {
    //       if (message.body.toString().indexOf(
    //           'credited') != -1) {
    //         for (int j = message.body.toString()
    //             .indexOf('Rs') + 4; j < message.body
    //             .toString()
    //             .length; j++) {
    //           if (isNumeric(
    //               message.body.toString()[j])) {
    //             if (pp) {
    //               rek = rek * 10 +
    //                   double.parse(message.body
    //                       .toString()[j]);
    //             } else {
    //               dd = dd + 1;
    //               double temp =
    //               double.parse(message.body![j]);
    //               int ne = dd;
    //               while (ne > 1) {
    //                 ne--;
    //                 temp = temp / 10;
    //               }
    //               rek = rek + temp;
    //             }
    //           } else if (message.body.toString()[j] ==
    //               '.') {
    //             // if(message.body.toString()[j-1]=='s'){
    //             //   continue;
    //             // }else{
    //             pp = false;
    //             // }
    //           } else {
    //             if (message.body.toString().indexOf(
    //                 'credited') != -1) {
    //               // rek*=10;
    //               //  final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= 1;
    //               p.add(rek.toDouble());
    //               print(rek);
    //               break;
    //             } else if (message.body.toString().indexOf(
    //                 'debited') != -1) {
    //               // rek*=10;
    //               // final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= -1;
    //               p.add(rek.toDouble());
    //               print(rek);
    //               break;
    //             }
    //           }
    //         }
    //       } else {
    //         for (int j = message.body.toString()
    //             .indexOf('Rs') + 3; j < message.body
    //             .toString()
    //             .length; j++) {
    //           if (isNumeric(
    //               message.body.toString()[j])) {
    //             if (pp) {
    //               rek = rek * 10 +
    //                   double.parse(message.body
    //                       .toString()[j]);
    //             } else {
    //               dd = dd + 1;
    //               double temp =
    //               double.parse(message.body![j]);
    //               int ne = dd;
    //               while (ne > 1) {
    //                 ne--;
    //                 temp = temp / 10;
    //               }
    //               rek = rek + temp;
    //             }
    //           } else if (message.body.toString()[j] ==
    //               '.') {
    //             // if(message.body.toString()[j-1]=='s'){
    //             //   continue;
    //             // }else{
    //             pp = false;
    //             // }
    //           } else {
    //             if (message.body.toString().indexOf(
    //                 'credited') != -1) {
    //               // rek*=10;
    //               //  final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= 1;
    //               // print(rek);
    //               p.add(rek.toDouble());
    //
    //               break;
    //             } else if (message.body.toString().indexOf(
    //                 'debited') != -1) {
    //               // rek*=10;
    //               // final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= -1;
    //               // print(rek);
    //               p.add(rek.toDouble());
    //               break;
    //             }
    //           }
    //         }
    //       }
    //     }

    //       // print(message.body.toString());
    //       if (message.body.toString().indexOf('credited') != -1) {
    //         for (int j = message.body.toString().indexOf('Rs') + 2;
    //         j < message.body
    //             .toString()
    //             .length;
    //         j++) {
    //           if (isNumeric(message.body.toString()[j])) {
    //             if (pp) {
    //               rek = rek * 10 + double.parse(message.body.toString()[j]);
    //             } else {
    //               dd = dd + 1;
    //               double temp = double.parse(message.body![j]);
    //               int ne = dd;
    //               while (ne > 1) {
    //                 ne--;
    //                 temp = temp / 10;
    //               }
    //               rek = rek + temp;
    //             }
    //           } else if (message.body.toString()[j] == '.') {
    //             // if(message.body.toString()[j-1]=='s'){
    //             //   continue;
    //             // }else{
    //             pp = false;
    //             // }
    //           } else {
    //             if (message.body.toString().indexOf('credited') != -1) {
    //               // rek*=10;
    //               //  final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= 1;
    //               p.add(rek.toDouble());
    //
    //               break;
    //             } else if (message.body.toString().indexOf('debited') != -1) {
    //               // rek*=10;
    //               // final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= -1;
    //               p.add(rek.toDouble());
    //               break;
    //             }
    //           }
    //         }
    //       } else {
    //         for (int j = message.body.toString().indexOf('Rs') + 2;
    //         j < message.body
    //             .toString()
    //             .length;
    //         j++) {
    //           if (isNumeric(message.body.toString()[j])) {
    //             if (pp) {
    //               rek = rek * 10 + double.parse(message.body.toString()[j]);
    //             } else {
    //               dd = dd + 1;
    //               double temp = double.parse(message.body![j]);
    //               int ne = dd;
    //               while (ne > 1) {
    //                 ne--;
    //                 temp = temp / 10;
    //               }
    //               rek = rek + temp;
    //             }
    //           } else if (message.body.toString()[j] == '.') {
    //             // if(message.body.toString()[j-1]=='s'){
    //             //   continue;
    //             // }else{
    //             pp = false;
    //             // }
    //           } else {
    //             if (message.body.toString().indexOf('credited') != -1) {
    //               // rek*=10;
    //               //  final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= 1;
    //               p.add(rek.toDouble());
    //
    //               break;
    //             } else if (message.body.toString().indexOf('debited') != -1) {
    //               // rek*=10;
    //               // final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= -1;
    //               p.add(rek.toDouble());
    //               break;
    //             }
    //           }
    //         }
    //       }
    //     }
    //     else if (message.sender?.indexOf('BOIIND') != -1) {
    //       if (message.body.toString().indexOf('Credited') != -1) {
    //         for (int j = message.body.toString().indexOf('Rs') + 3;
    //         j < message.body
    //             .toString()
    //             .length;
    //         j++) {
    //           if (isNumeric(message.body.toString()[j])) {
    //             if (pp) {
    //               rek = rek * 10 + double.parse(message.body.toString()[j]);
    //             } else {
    //               dd = dd + 1;
    //               double temp = double.parse(message.body.toString()[j]);
    //               int ne = dd;
    //               while (ne > 1) {
    //                 ne--;
    //                 temp = temp / 10;
    //               }
    //               rek = rek + temp;
    //             }
    //           } else if (message.body.toString()[j] == '.') {
    //             // if(message.body.toString()[j-1]=='s'){
    //             //   continue;
    //             // }else{
    //             pp = false;
    //             // }
    //           } else {
    //             if (message.body.toString().indexOf('Credited') != -1) {
    //               // rek*=10;
    //               //  final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= 1;
    //               // print(rek);
    //               p.add(rek.toDouble());
    //
    //               break;
    //             } else if (message.body.toString().indexOf('debited') != -1) {
    //               // rek*=10;
    //               // final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= -1;
    //               // print(rek);
    //               p.add(rek.toDouble());
    //               break;
    //             }
    //           }
    //         }
    //       } else {
    //         for (int j = message.body.toString().indexOf('Rs') + 3;
    //         j < message.body
    //             .toString()
    //             .length;
    //         j++) {
    //           if (isNumeric(message.body.toString()[j])) {
    //             if (pp) {
    //               rek = rek * 10 + double.parse(message.body.toString()[j]);
    //             } else {
    //               dd = dd + 1;
    //               double temp = double.parse(message.body.toString()[j]);
    //               int ne = dd;
    //               while (ne > 1) {
    //                 ne--;
    //                 temp = temp / 10;
    //               }
    //               rek = rek + temp;
    //             }
    //           } else if (message.body.toString()[j] == '.') {
    //             // if(message.body.toString()[j-1]=='s'){
    //             //   continue;
    //             // }else{
    //             pp = false;
    //             // }
    //           } else {
    //             if (message.body.toString().indexOf('debited') != -1) {
    //               // rek*=10;
    //               // final chars = rek.toString().split('');
    //               // rek = double.parse(chars.reversed.join());
    //               rek *= -1;
    //               // print(rek);
    //               p.add(rek.toDouble());
    //               break;
    //             }
    //           }
    //         }
    //       }
    //     }
    //     if (message.date?.month == DateTime.january) {
    //       print("rek $rek");
    //       print(jan.length);
    //       jan.add(rek);
    //     }
    //     if (message.date?.month == DateTime.february) {
    //       feb.add(rek);
    //     }
    //     if (message.date?.month == DateTime.march) {
    //       mar.add(rek);
    //     }
    //     if (message.date?.month == DateTime.april) {
    //       apr.add(rek);
    //     }
    //     if (message.date?.month == DateTime.may) {
    //       may.add(rek);
    //     }
    //     if (message.date?.month == DateTime.june) {
    //       june.add(rek);
    //     }
    //     if (message.date?.month == DateTime.july) {
    //       july.add(rek);
    //     }
    //     if (message.date?.month == DateTime.august) {
    //       august.add(rek);
    //     }
    //     if (message.date?.month == DateTime.september) {
    //       september.add(rek);
    //     }
    //     if (message.date?.month == DateTime.october) {
    //       october.add(rek);
    //     }
    //     if (message.date?.month == DateTime.november) {
    //       november.add(rek);
    //     }
    //     if (message.date?.month == DateTime.december) {
    //       december.add(rek);
    //     }
    //   }
    // });
    janex = 0;
    febx = 0;
    marx = 0;
    aprx = 0;
    junex = 0;
    julyx = 0;
    mayx = 0;
    augustx = 0;
    octx = 0;
    septx = 0;
    novx = 0;
    decx = 0;
    expens = 0;
    for (int i = 0; i < jan.length; i++) {
      if (double.parse(jan[i].toString()).isNegative) {
        expens = expens + double.parse(jan[i].toString());
        janex = janex + double.parse(jan[i].toString());
        print("jan ${double.parse(jan[i].toString())}");
      }
    }
    for (int i = 0; i < feb.length; i++) {
      if (double.parse(feb[i].toString()).isNegative) {
        expens = expens + double.parse(feb[i].toString());
        febx = febx + double.parse(feb[i].toString());
      }
    }

    for (int i = 0; i < mar.length; i++) {
      if (double.parse(mar[i].toString()).isNegative) {
        expens = expens + double.parse(mar[i].toString());
        marx = marx + double.parse(mar[i].toString());
      }
    }

    for (int i = 0; i < apr.length; i++) {
      if (double.parse(apr[i].toString()).isNegative) {
        expens = expens + double.parse(apr[i].toString());
        aprx = aprx + double.parse(apr[i].toString());
      }
    }

    for (int i = 0; i < june.length; i++) {
      if (double.parse(june[i].toString()).isNegative) {
        expens = expens + double.parse(june[i].toString());
        junex = junex + double.parse(june[i].toString());
      }
    }

    for (int i = 0; i < july.length; i++) {
      if (double.parse(july[i].toString()).isNegative) {
        expens = expens + double.parse(july[i].toString());
        julyx = julyx + double.parse(july[i].toString());
      }
    }

    for (int i = 0; i < may.length; i++) {
      if (double.parse(may[i].toString()).isNegative) {
        expens = expens + double.parse(may[i].toString());
        mayx = mayx + double.parse(may[i].toString());
      }
    }

    for (int i = 0; i < august.length; i++) {
      if (double.parse(august[i].toString()).isNegative) {
        expens = expens + double.parse(august[i].toString());
        augustx = augustx + double.parse(august[i].toString());
      }
    }

    for (int i = 0; i < september.length; i++) {
      if (double.parse(september[i].toString()).isNegative) {
        expens = expens + double.parse(september[i].toString());
        septx = septx + double.parse(september[i].toString());
      }
    }

    for (int i = 0; i < october.length; i++) {
      if (double.parse(october[i].toString()).isNegative) {
        expens = expens + double.parse(october[i].toString());
        octx = octx + double.parse(october[i].toString());
      }
    }

    for (int i = 0; i < november.length; i++) {
      if (double.parse(november[i].toString()).isNegative) {
        expens = expens + double.parse(november[i].toString());
        novx = novx + double.parse(november[i].toString());
      }
    }

    for (int i = 0; i < december.length; i++) {
      if (double.parse(december[i].toString()).isNegative) {
        expens = expens + double.parse(december[i].toString());
        decx = decx + double.parse(december[i].toString());
      }
    }

    income = income.roundToDouble();
    expens = -expens.roundToDouble();

    selected = 1;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        selected = 2;
      });
    });
    // janex = 0;
    // febx = 0;
    // marx = 0;
    // aprx = 0;
    // junex = 0;
    // julyx = 0;
    // mayx = 0;
    // augustx = 0;
    // octx = 0;
    // septx = 0;
    // novx = 0;
    // decx = 0;
    //   jan = [];
    //   feb = [];
    //   mar = [];
    //   apr = [];
    //   may = [];
    //   june = [];
    //   july = [];
    //   august = [];
    //   september = [];
    //   october = [];
    //   november = [];
    //   december = [];
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}

List<ChartLayer> layers() {
  return [
    ChartGroupPieLayer(
      items: List.generate(
        2,
        (index1) => List.generate(
          6,
          (index) => ChartGroupPieDataItem(
              amount: [
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

                /* 1000,
                200,
                3000,
                400,
                5000,
                600,
                1000,
                200,
                3000,
                400,
                5000,
                600*/
              ][(index1 == 0) ? index : index + 6]
                  .toDouble(),
              color: [
                Colors.orangeAccent,
                Colors.pinkAccent,
                Colors.redAccent,
                Colors.blueAccent,
                Colors.cyanAccent,
                Colors.tealAccent,
                Colors.orangeAccent,
                Colors.pinkAccent,
                Colors.redAccent,
                Colors.blueAccent,
                Colors.cyanAccent,
                Colors.tealAccent,
              ][(index1 == 0) ? index : index + 6],
              label: [
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
                'Dec',
              ][(index1 == 0) ? index : index + 6]),
        ),
      ),
      settings: const ChartGroupPieSettings(),
    ),
    ChartTooltipLayer(
      shape: () => ChartTooltipPieShape<ChartGroupPieDataItem>(
        onTextName: (item) => item.label,
        onTextValue: (item) => '₹${item.amount.toString()}',
        radius: 10.0,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(12.0),
        nameTextStyle: const TextStyle(
          color: Color(0xFF8043F9),
          fontWeight: FontWeight.w700,
          height: 1.47,
          fontSize: 12.0,
        ),
        valueTextStyle: const TextStyle(
          color: Color(0xFF1B0E41),
          fontWeight: FontWeight.w700,
          fontSize: 12.0,
        ),
      ),
    )
  ];
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
