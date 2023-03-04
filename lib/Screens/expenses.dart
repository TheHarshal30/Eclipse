// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclipsis/Screens/Expenselist.dart';
import 'package:eclipsis/supabasehandler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../bar graphs/expenseSummary.dart';

// @TODO genrate mai jan.add
class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});
  @override
  State<ExpensePage> createState() => ExpensePageState();
}

class ExpensePageState extends State<ExpensePage> {
  SupaBaseHandler supaBaseHandler = SupaBaseHandler();
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
  // @TODO get last date from firebase after
  double k = 0;
  double expens = 0;
  double income = 0;
  // DateTime d = DateTime.parse('2023-02-26 00:00:00Z');
  RegExp regExp = new RegExp(
    "(?=.*[Aa]ccount.*|.*[Aa]/[Cc].*|.*[Aa][Cc][Cc][Tt].*|.*[Cc][Aa][Rr][Dd].*)(?=.*[Cc]redit.*|.*[Dd]ebit.*)(?=.*[Ii][Nn][Rr].*|.*[Rr][Ss].*)",
    caseSensitive: false,
    multiLine: false,
  );
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  List<double> p = [];

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














  @override
  void initState() {
    income = 0;
    supaBaseHandler.readData();
    getsmsvmbk();
    getsmsvm2bk();
    getsmsadbk();
    getsmsJDbk();
    getsmsBPbk();
    getsmsvkbk();
    getsmsaxbk();
    getsmsjmbk();
    getsmsjgbk();

    getsmsvm();
    getsmsvm2();
    getsmsad();
    getsmsJD();
    getsmsBP();
    getsmsvk();
    getsmsax();
    getsmsjm();
    getsmsjg();

    initialize();
    super.initState();
  }

  void initialize() async {
    final snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      // jan = snap.data()?['january'];
      feb = snap['february'];
      mar = snap['march'];
      apr = snap['april'];
      may = snap['may'];
      june = snap['june'];
      july = snap['july'];
      august = snap['august'];
      september = snap['september'];
      october = snap['october'];
      september = snap['september'];
      november = snap['november'];
      december = snap['december'];
      expens = snap['totalex'];
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
                              child: ExpenseSummary(
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
                              MaterialPageRoute(builder: (context) => Expenselist()),
                            );
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child:
                                       Text("Expense List",
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
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15)),
                    //   elevation: 2,
                    //   child: Container(
                    //     decoration: BoxDecoration(color: Colors.grey.shade100),
                    //     height: MediaQuery.of(context).size.height / 15,
                    //     width: MediaQuery.of(context).size.width / 2.5,
                    //     child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 15.0),
                    //             child:
                    //                  Text("Add Expense",
                    //                     style: GoogleFonts.ubuntu(
                    //                         fontWeight: FontWeight.bold))
                    //           ),
                    //           Image(
                    //               image: AssetImage("assets/images/g.png"),
                    //               height:
                    //                   MediaQuery.of(context).size.height / 20)
                    //         ]),
                    //   ),
                    // ),
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
                            print("jan${jan}");
                            supaBaseHandler.updateData(FirebaseAuth.instance.currentUser!.uid.toString(),jan);
                            print(_messages.length);
                            setState(() {
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
                              for (int i = 0; i < jan.length; i++) {
                                if (double.parse(jan[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(jan[i].toString());
                                  janex =
                                      janex + double.parse(jan[i].toString());
                                } else {
                                  income =
                                      income + double.parse(jan[i].toString());
                                }
                              }
                              print(janex);
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .update({'janx': -janex});
                              for (int i = 0; i < feb.length; i++) {
                                if (double.parse(feb[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(feb[i].toString());
                                  febx = febx + double.parse(feb[i].toString());
                                } else {
                                  income =
                                      income + double.parse(feb[i].toString());
                                }
                              }
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set(
                                      {'febx': -febx}, SetOptions(merge: true));

                              for (int i = 0; i < mar.length; i++) {
                                if (double.parse(mar[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(mar[i].toString());
                                  marx = marx + double.parse(mar[i].toString());
                                } else {
                                  income =
                                      income + double.parse(mar[i].toString());
                                }
                              }

                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set(
                                      {'marx': -marx}, SetOptions(merge: true));

                              for (int i = 0; i < apr.length; i++) {
                                if (double.parse(apr[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(apr[i].toString());
                                  aprx = aprx + double.parse(apr[i].toString());
                                } else {
                                  income =
                                      income + double.parse(apr[i].toString());
                                }
                              }
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set(
                                      {'aprx': -aprx}, SetOptions(merge: true));

                              for (int i = 0; i < june.length; i++) {
                                if (double.parse(june[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(june[i].toString());
                                  junex =
                                      junex + double.parse(june[i].toString());
                                } else {
                                  income =
                                      income + double.parse(june[i].toString());
                                }
                              }
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set({'junex': -junex},
                                      SetOptions(merge: true));

                              for (int i = 0; i < july.length; i++) {
                                if (double.parse(july[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(july[i].toString());
                                  julyx =
                                      julyx + double.parse(july[i].toString());
                                } else {
                                  income =
                                      income + double.parse(july[i].toString());
                                }
                              }
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set({'julyx': -julyx},
                                      SetOptions(merge: true));

                              for (int i = 0; i < may.length; i++) {
                                if (double.parse(may[i].toString())
                                    .isNegative) {
                                  expens =
                                      expens + double.parse(may[i].toString());
                                  mayx = mayx + double.parse(may[i].toString());
                                } else {
                                  income =
                                      income + double.parse(may[i].toString());
                                }
                              }

                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set(
                                      {'mayx': -mayx}, SetOptions(merge: true));

                              for (int i = 0; i < august.length; i++) {
                                if (double.parse(august[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(august[i].toString());
                                  augustx = augustx +
                                      double.parse(august[i].toString());
                                } else {
                                  income = income +
                                      double.parse(august[i].toString());
                                }
                              }
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set({'augustx': -augustx},
                                      SetOptions(merge: true));

                              for (int i = 0; i < september.length; i++) {
                                if (double.parse(september[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(september[i].toString());
                                  septx = septx +
                                      double.parse(september[i].toString());
                                } else {
                                  income = income +
                                      double.parse(september[i].toString());
                                }
                              }

                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set({'septx': -septx},
                                      SetOptions(merge: true));

                              for (int i = 0; i < october.length; i++) {
                                if (double.parse(october[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(october[i].toString());
                                  octx = octx +
                                      double.parse(october[i].toString());
                                } else {
                                  income = income +
                                      double.parse(october[i].toString());
                                }
                              }

                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set(
                                      {'octx': -octx}, SetOptions(merge: true));

                              for (int i = 0; i < november.length; i++) {
                                if (double.parse(november[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(november[i].toString());
                                  novx = novx +
                                      double.parse(november[i].toString());
                                } else {
                                  income = income +
                                      double.parse(november[i].toString());
                                }
                              }
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set(
                                      {'novx': -novx}, SetOptions(merge: true));

                              for (int i = 0; i < december.length; i++) {
                                if (double.parse(december[i].toString())
                                    .isNegative) {
                                  expens = expens +
                                      double.parse(december[i].toString());
                                  decx = decx +
                                      double.parse(december[i].toString());
                                } else {
                                  income = income +
                                      double.parse(december[i].toString());
                                }
                              }

                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set(
                                      {'decx': -decx}, SetOptions(merge: true));
                              income = income.roundToDouble();
                              expens = -expens.roundToDouble();
                              initialize();
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set({'totalex': expens},
                                      SetOptions(merge: true));
                              selected = 1;
                              Future.delayed(const Duration(seconds: 1), () {
                                setState(() {
                                  selected = 2;
                                });
                              });
                              // jan = [];
                              // feb = [];
                              // mar = [];
                              // apr = [];
                              // may = [];
                              // june = [];
                              // july = [];
                              // august = [];
                              // september = [];
                              // october = [];
                              // november = [];
                              // december = [];
                            });
                          },
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
                      height: MediaQuery.of(context).size.height / 1.8,
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
                                    p.add(rek);
                                    break;
                                  } else if (message.body.toString()[j + 1] ==
                                      'C') {
                                    // rek*=10;
                                    // final chars = rek.toString().split('');
                                    // rek = double.parse(chars.reversed.join());
                                    rek *= 1;
                                    p.add(rek);
                                    break;
                                  }
                                }
                              }}
                              if(message.sender?.indexOf('HDFCBK')!=-1) {
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
                                        print(rek);
                                        p.add(rek);

                                        break;
                                      } else
                                      if (_messages[i].body.toString().indexOf(
                                          'debited') != -1) {
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
                                        p.add(rek);

                                        break;
                                      } else
                                      if (_messages[i].body.toString().indexOf(
                                          'debited') != -1) {
                                        // rek*=10;
                                        // final chars = rek.toString().split('');
                                        // rek = double.parse(chars.reversed.join());
                                        rek *= -1;
                                        // print(rek);
                                        p.add(rek);
                                        break;
                                      }
                                    }
                                  }
                                }
                              }
                              if (message.date?.month == DateTime.january) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'january': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.february) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'february': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.march) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'march': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.april) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'april': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.may) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'may': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.june) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'june': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.july) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'july': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.august) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'august': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.september) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'september': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.october) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'october': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.november) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'november': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              if (message.date?.month == DateTime.december) {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'december': FieldValue.arrayUnion([rek])
                                }, SetOptions(merge: true));
                              }
                              return
                                (i < 5) && p.length>5
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            'Merchant'),
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
                            return Divider(
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
  print("axa ${jn}");
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