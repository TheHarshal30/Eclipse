// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'dart:math';
import 'package:eclipsis/Screens/homepage.dart';

import 'welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclipsis/Screens/Expenselist.dart';
import 'package:eclipsis/supabasehandler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../bar graphs/expenseSummary.dart';
import 'package:eclipsis/main.dart';// @TODO genrate mai jan.add
class ExpensePage extends StatefulWidget {
  int bank;
  ExpensePage({super.key,required this.bank});
  @override
  State<ExpensePage> createState() => ExpensePageState();
}

class ExpensePageState extends State<ExpensePage> {
  bool temppp = false;
  SupaBaseHandler supaBaseHandler = SupaBaseHandler();
  bool gen1 = true;
  List<dynamic> jan = [];
  List<dynamic> feb = [];
  List<dynamic> mar = [];
  List<dynamic> apr = [];
  List<dynamic> may = [];
  List<dynamic> june = [];
  List<dynamic> july = [];
  List<dynamic> august = [];
  List<dynamic> september = [];
  List<dynamic> october = [];
  List<dynamic> november = [];
  List<dynamic> december = [];
  List<dynamic> alle = [];
  double janex = 0;
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
  double k = 0;
  double expens = 0;
  double income = 0;
  RegExp regExp = RegExp(
    "(?=.*[Aa]ccount.*|.*[Aa]/[Cc].*|.*[Aa][Cc][Cc][Tt].*|.*[Cc][Aa][Rr][Dd].*)(?=.*[Cc]redit.*|.*[Dd]ebit.*)(?=.*[Ii][Nn][Rr].*|.*[Rr][Ss].*)",
    caseSensitive: false,
    multiLine: false,
  );
                    //@TODO 2/7/2023 move firebase-add from the message cal to generators
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  List<double> p = [];


  void getsmsjgsbp() async {
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

  void getsmsvm2sba() async {
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







  void getsmsjg() async {
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





  void getsmsjgbk() async {
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
        address: 'BX-v',
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

  void getsmsvm2boi() async {
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



  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () {
      showDialog(
      barrierDismissible: false
      ,context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 30), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              // title: Center(child:Text('Enter Code')),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: Colors.grey[100],
                elevation: 0.0,
                content: StreamBuilder<int>(
                    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                      return Container(
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 15),
                                child: Text(
                                  'Please wait while we are calculating expenses....',
                                  style: TextStyle(
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 15),
                                child: Text(
                                  'This will take only 30 seconds',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )),
                              ],
                            ), //new column child
                        );
                    }),
            );
    });});

    income = 0;

    supaBaseHandler.readData();


    print(widget.bank);


    if(widget.bank==0){
      getsmsvmbk();
      getsmsvm2bk();
      getsmsadbk();
      getsmsJDbk();
      getsmsBPbk();
      getsmsvkbk();
      getsmsaxbk();
      getsmsjmbk();
      getsmsjgbk();
      getsmsvm2svk();

      getsmsvm();
      getsmsvm2();
      getsmsad();
      getsmsJD();
      getsmsBP();
      getsmsvk();
      getsmsax();
      getsmsjm();
      getsmsjg();


      getsmsvm2sba();
      getsmsJDs();
      getsmsjgsbp();
      getsmsjgbk();
      getsmsjgbx();
      getsmsjgscp();
      getsmsjgsqp();
      getsmsvms();
      getsmsvm2s();
      getsmsads();
      getsmsBPs();
      getsmsvks();
      getsmsaxs();
      getsmsjms();
      getsmsjgs();
    }

if(widget.bank==3 ) {
  getsmsvmbk();
  getsmsvm2bk();
  getsmsadbk();
  getsmsJDbk();
  getsmsBPbk();
  getsmsvkbk();
  getsmsaxbk();
  getsmsjmbk();
  getsmsjgbk();
}
//
//
    if(widget.bank==1) {
      getsmsvm();
      getsmsvm2();
      getsmsad();
      getsmsJD();
      getsmsBP();
      getsmsvk();
      getsmsax();
      getsmsjm();
      getsmsjg();
    }

    if(widget.bank==2) {

      getsmsvm2sba();
      getsmsJDs();
      getsmsjgsbp();
      getsmsbrs();
      getsmsjgbk();
      getsmsjgbx();
      getsmsjgscp();
      getsmsjgsqp();
      getsmsjgsbw();
      getsmsjgsbw();
      getsmsvms();
      getsmsvm2s();
      getsmsads();
      getsmsBPs();
      getsmsvks();
      getsmsaxs();
      getsmsjms();
      getsmsbrs();
      getsmsjgsbv();
      getsmsjgs();
    }
    if(widget.bank==4){
       getsmsjgsbpboi() ;
       getsmsjgscpboi() ;
       getsmsjgsqpboi() ;
       getsmsjgsboi();
       getsmsjgboi() ;
       getsmsjsboi();
       getsmjgsboi() ;
       getmsjgboi() ;
       getsmsbrboi() ;
       getsmsjmboi();
       getsmsaxboi() ;
       getsmsJDboi();
       getsmsboi() ;
       getsmsvksboi() ;
       getsmsadsboi() ;
       getsmsvmsboi() ;
      getsmsvm2sboi() ;
       getsmsvmboi();
     getsmsvm2boi() ;
    }
    super.initState();
    initialize();
  }

  void initialize() async {
    final snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
       janex = 0;
       febx = 0;
      marx = 0;
       mayx = 0;
       aprx = 0;
       junex = 0;
       julyx = 0;
       augustx = 0;
       septx = 0;
       octx = 0;
       novx = 0;
       decx = 0;
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
      // jan = snap.data()?['january'];
      // feb = snap['february'];
      // mar = snap['march'];
      // apr = snap['april'];
      // may = snap['may'];
      // june = snap['june'];
      // july = snap['july'];
      // august = snap['august'];
      // september = snap['september'];
      // october = snap['october'];
      // september = snap['september'];
      // november = snap['november'];
      // december = snap['december'];
      // expens = snap['totalex'];
    });
  }

  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
        leading: BackButton(color:Colors.black),
        title:Text("Eclipse Tracking", style: GoogleFonts.ubuntu(color:Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Text(
                                "Total Expense",
                                style: GoogleFonts.ubuntu(fontSize: 15),
                              ),
                            Text(
                                "${expens}",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  ],
                ),
              ),
              selected == 2
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, top: 30, right: 18),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.8,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.shade50,
                            borderRadius: BorderRadius.circular(5)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                              width: 800,
                              child: ExpenseSummary(janx: janex,febx: febx,marx: marx,aprx: aprx,mayx: mayx,junex: junex,julyx: julyx,augustx: augustx, septx: septx,octx: octx,novx: novx,decx: decx,total: expens,
                                barColor: Color.fromRGBO(37, 47, 72, 1),
                              )),
                        ),
                      ),
                    ):selected ==1?Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator(),),
                    )
                  : Divider(
                      height: 0,
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width-50 ,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Expenselist(janx: janex,febx: febx,marx: marx,aprx: aprx,mayx: mayx,junex: junex,julyx: julyx,augustx: augustx, septx: septx,octx: octx,novx: novx,decx: decx,jan: jan,feb: feb,mar: mar,apr: apr,may: may,june: june,july: july,august: august,september: september,october: october,november: november,december: december,)),
                            );
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child:
                                       Text("Monthly Expense",
                                          style: GoogleFonts.ubuntu(
                                              fontWeight: FontWeight.bold))
                                ),
                                Image(
                                    image: AssetImage("assets/images/g.png"),
                                    height:
                                        MediaQuery.of(context).size.height / 20)
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        child: GestureDetector(
                          onTap: () {
                            if(gen1==true){
                              gen1 = false;
                            Future.delayed(Duration.zero, () {
                              showDialog(
                                  barrierDismissible: false
                                  ,context: context,
                                  builder: (context) {
                                    Future.delayed(Duration(seconds: 3), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return AlertDialog(
                                      // title: Center(child:Text('Enter Code')),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                      backgroundColor: Colors.grey[100],
                                      elevation: 0.0,
                                      content: StreamBuilder<int>(
                                          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                                            return Container(
                                              height: 150,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 10, left: 10, right: 10, bottom: 15),
                                                      child: Text(
                                                        'Please wait while we are calculating expenses....',
                                                        style: TextStyle(
                                                            color: Colors.green[800],
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 16),
                                                      )),
                                                  Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 10, left: 10, right: 10, bottom: 15),
                                                      child: Text(
                                                        'This will take only take a moment',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12),
                                                      )),
                                                ],
                                              ), //new column child
                                            );
                                          }),
                                    );
                                  });});
                            setState(() {
                                // FirebaseFirestore.instance
                                //     .collection("Users")
                                //     .doc(FirebaseAuth.instance.currentUser!.uid)
                                //     .set({
                                //   'january': jan
                                // }, SetOptions(merge: true));
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'february':feb
                                //   }, SetOptions(merge: true));
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'march': mar
                                //   }, SetOptions(merge: true));
                                //
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'april': apr
                                //   }, SetOptions(merge: true));
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'may': may
                                //   }, SetOptions(merge: true));
                                //
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'june': june
                                //   }, SetOptions(merge: true));
                                //
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'july': july
                                //   }, SetOptions(merge: true));
                                //
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'august': august
                                //   }, SetOptions(merge: true));
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'september': september
                                //   }, SetOptions(merge: true));
                                //
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'october': october
                                //   }, SetOptions(merge: true));
                                //
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'november': november
                                //   }, SetOptions(merge: true));
                                //
                                //   FirebaseFirestore.instance
                                //       .collection("Users")
                                //       .doc(FirebaseAuth.instance.currentUser!.uid)
                                //       .set({
                                //     'december': december
                                //   }, SetOptions(merge: true));
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
                                if (double.parse(jan[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(jan[i].toString());
                                  janex =
                                      janex + double.parse(jan[i].toString());
                                }
                              }
                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update({'janx': -janex});
                              for (int i = 0; i < feb.length; i++) {
                                if (double.parse(feb[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(feb[i].toString());
                                  febx = febx + double.parse(feb[i].toString());
                                }
                              }
                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update(
                              //         {'febx': -febx});

                              for (int i = 0; i < mar.length; i++) {
                                if (double.parse(mar[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(mar[i].toString());
                                  marx = marx + double.parse(mar[i].toString());
                                }
                              }

                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update(
                              //         {'marx': -marx});

                              for (int i = 0; i < apr.length; i++) {
                                if (double.parse(apr[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(apr[i].toString());
                                  aprx = aprx + double.parse(apr[i].toString());
                                }
                              }
                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update(
                              //         {'aprx': -aprx});

                              for (int i = 0; i < june.length; i++) {
                                if (double.parse(june[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(june[i].toString());
                                  junex =
                                      junex + double.parse(june[i].toString());
                                }
                              }
                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update({'junex': -junex},);

                              for (int i = 0; i < july.length; i++) {
                                if (double.parse(july[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(july[i].toString());
                                  julyx =
                                      julyx + double.parse(july[i].toString());
                                }
                              }
                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update({'julyx': -julyx});

                              for (int i = 0; i < may.length; i++) {
                                if (double.parse(may[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(may[i].toString());
                                  mayx = mayx + double.parse(may[i].toString());
                                }
                              }

                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update(
                              //         {'mayx': -mayx});

                              for (int i = 0; i < august.length; i++) {
                                if (double.parse(august[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(august[i].toString());
                                  augustx = augustx +
                                      double.parse(august[i].toString());
                                }
                              }
                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update({'augustx': -augustx});

                              for (int i = 0; i < september.length; i++) {
                                if (double.parse(september[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(september[i].toString());
                                  septx = septx +
                                      double.parse(september[i].toString());
                                }
                              }

                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update({'septx': -septx});

                              for (int i = 0; i < october.length; i++) {
                                if (double.parse(october[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(october[i].toString());
                                  octx = octx +
                                      double.parse(october[i].toString());
                                }
                              }

                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update(
                              //         {'octx': -octx});

                              for (int i = 0; i < november.length; i++) {
                                if (double.parse(november[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(november[i].toString());
                                  novx = novx +
                                      double.parse(november[i].toString());
                                }
                              }
                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update(
                              //         {'novx': -novx});

                              for (int i = 0; i < december.length; i++) {
                                if (double.parse(december[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(december[i].toString());
                                  decx = decx +
                                      double.parse(december[i].toString());
                                }
                              }

                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update(
                              //         {'decx': -decx});
                              income = income.roundToDouble();
                              expens = -expens.roundToDouble();
                              // FirebaseFirestore.instance
                              //     .collection("Users")
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .update({'totalex': expens}
                              //         );
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
                            });
                          }},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightGreen.shade100),
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Calculate Expense ",
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.bold)),
                                ]),
                          ),
                        ),
                      ),
                    ),
              _messages.length!=0?
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Transactions:",
                      style: GoogleFonts.ubuntu(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.9,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: _messages.length,
                          itemBuilder: (context, i) {
                            var message = _messages[i];
                            double rek = 0;
                            bool pp = true;
                            int dd = 1;
                            if (_messages[i].date?.year ==
                                DateTime.now().year) {
                              if(message.sender?.indexOf('BOBTXN')!=-1){
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
                              }}
                             else if(message.sender?.indexOf('HDFCBK')!=-1) {
                                if (_messages[i].body.toString().indexOf(
                                    'credited') != -1) {
                                  for (int j = _messages[i].body.toString()
                                      .indexOf('Rs') + 4; j < _messages[i].body
                                      .toString()
                                      .length; j++) {
                                    if (isNumeric(
                                        _messages[i].body.toString()[j])) {
                                      if (pp) {
                                        rek = rek * 10 +
                                            double.parse(_messages[i].body
                                                .toString()[j]);
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
                                    } else
                                    if (_messages[i].body.toString()[j] ==
                                        '.') {
                                      // if(message.body.toString()[j-1]=='s'){
                                      //   continue;
                                      // }else{
                                      pp = false;
                                      // }
                                    } else {
                                      if (_messages[i].body.toString().indexOf(
                                          'credited') != -1) {
                                        // rek*=10;
                                        //  final chars = rek.toString().split('');
                                        // rek = double.parse(chars.reversed.join());
                                        rek *= 1;
                                        p.add(rek.toDouble());
                                        print(rek);
                                        break;
                                      } else
                                      if (_messages[i].body.toString().indexOf(
                                          'debited') != -1) {
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
                                  for (int j = _messages[i].body.toString()
                                      .indexOf('Rs') + 3; j < _messages[i].body
                                      .toString()
                                      .length; j++) {
                                    if (isNumeric(
                                        _messages[i].body.toString()[j])) {
                                      if (pp) {
                                        rek = rek * 10 +
                                            double.parse(_messages[i].body
                                                .toString()[j]);
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
                                    } else
                                    if (_messages[i].body.toString()[j] ==
                                        '.') {
                                      // if(message.body.toString()[j-1]=='s'){
                                      //   continue;
                                      // }else{
                                      pp = false;
                                      // }
                                    } else {
                                      if (_messages[i].body.toString().indexOf(
                                          'credited') != -1) {
                                        // rek*=10;
                                        //  final chars = rek.toString().split('');
                                        // rek = double.parse(chars.reversed.join());
                                        rek *= 1;
                                        // print(rek);
                                        p.add(rek.toDouble());

                                        break;
                                      } else
                                      if (_messages[i].body.toString().indexOf(
                                          'debited') != -1) {
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
     else if(message.sender?.indexOf('SBIUPI')!=-1){
        // print(message.body.toString());
        if (message.body.toString().indexOf('credited') != -1) {
          for (int j = message.body.toString().indexOf('Rs') + 2;
          j < message.body.toString().length;
          j++) {
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
          for (int j = message.body.toString().indexOf('Rs') + 2;
          j < message.body.toString().length;
          j++) {
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
        }
      }
      else if(message.sender?.indexOf('BOIIND') != -1){
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


                              if (message.date?.month == DateTime.january &&!kk) {
                                jan.add(rek);
                              }
                              if (message.date?.month == DateTime.february &&!kk) {
                                feb.add(rek);
                              }
                              if (message.date?.month == DateTime.march &&!kk) {
                                mar.add(rek);
                              }
                              if (message.date?.month == DateTime.april&&!kk  ) {
                                apr.add(rek);
                              }
                              if (message.date?.month == DateTime.may   &&!kk ) {
                                may.add(rek);

                              }
                              if (message.date?.month == DateTime.june  &&!kk ) {
                                june.add(rek);

                              }
                              if (message.date?.month == DateTime.july  &&!kk) {
                                july.add(rek);
                              }
                              if (message.date?.month == DateTime.august  &&!kk ) {
                                august.add(rek);

                              }
                              if (message.date?.month == DateTime.september   &&!kk) {
                                september.add(rek);

                              }
                              if (message.date?.month == DateTime.october  &&!kk ) {
                                october.add(rek);

                              }
                              if (message.date?.month == DateTime.november &&!kk ) {
                                november.add(rek);

                              }
                              if (message.date?.month == DateTime.december  &&!kk) {
                                december.add(rek);
                              }
                              if(i==_messages.length-1){
                                kk=true;
                              }
                              return
                                (i < 4) && p.length>4
                                  ? Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      elevation: 1,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.10,
                                        decoration: BoxDecoration(
                                          /*border: Border.all(width: 1.5, color: Colors.black),*/
                                          color: Colors.transparent,
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.orange.shade50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      //  border: Border.all(color: Colors.black, width: 1)
                                                    ),
                                                    child: Image(
                                                        image: AssetImage(
                                                            "assets/images/learn2.png"),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            20),
                                                  ),
                                                ),

                                                    Padding(
                                                        padding:
                                                             EdgeInsets
                                                                .all(8.0),
                                                        child: p[i]<0?Text(
                                                            'Debited'):Text("Credited"),
                                                      )
                                              ],
                                            ),
                                                 Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: p[i]<0?Text(
                                                      "${p[i]}",
                                                      // 'check',
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 20,
                                                          color: Colors.red,
                                                         ),
                                                    ):Text(
                                                      "${p[i]}",
                                                      // 'check',
                                                      style: GoogleFonts.roboto(
                                                          fontSize:20,
                                                          color: Colors.green,
                                                          ),
                                                    ),
                                                  )
                                          ],
                                        ),
                                      ),
                                    )
                                  :
                                Divider(
                                      height: 0,
                                    );
                            }
                            return
                            Divider(
                              height: 0,
                            );
                          }),
                    ),
                  ],
                ),
              ):Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator(),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

int getjenx(List<dynamic> jn) {
  var sum = 0;
  sum = jn.reduce((value, element) => value + element < 0 ? element : 0);
  return sum;
}

double getex(
  List<dynamic> jan,
  List<dynamic> feb,
  List<dynamic> mar,
  List<dynamic> apr,
  List<dynamic> may,
  List<dynamic> june,
  List<dynamic> july,
  List<dynamic> august,
  List<dynamic> september,
  List<dynamic> october,
  List<dynamic> november,
  List<dynamic> december,
) {
  var sum = jan.reduce((value, element) => value + element < 0 ? element : 0);
  var sum1 = feb.reduce((value, element) => value + element < 0 ? element : 0);
  return sum + sum1;
}



