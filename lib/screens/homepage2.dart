// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, curly_braces_in_flow_control_structures, sort_child_properties_last, unused_field
import 'package:app1/main.dart';
import 'package:app1/models/firebaseCalls.dart';
import 'package:app1/models/llm.dart';
import 'package:app1/models/newsservices.dart';
import 'package:app1/models/remote_services.dart';
import 'package:app1/models/tipsmodel.dart';
import 'package:app1/pf/temp.dart';
import 'package:app1/screens/eclipseai.dart';
import 'package:app1/screens/expenses.dart';
import 'package:app1/screens/navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:http/http.dart' as http;

import '../models/fdmodel.dart';
import '../models/mfmodel3.dart';
import '../models/newsmodel.dart';

Future<FDs?> getPosts() async {
  var client = http.Client();

  var uri = Uri.parse('https://api.kuvera.in/fixed_deposit/api/v1/plans.json');
  var response = await client.get(uri);

  if (response.statusCode == 200) {
    var json = response.body;
    return FDsFromJson(json);
  }
  return null;
}

List<MFNAV>? mfnavlist;
FDs? fdlist;
News? market;
News? economy;
News? tech;
News? all;
var isFD = false;
var isMF = false;
var nMar = false;
var nEco = false;
var nTech = false;
var nAll = false;
getFDs() async {
  fdlist = (await RemoteService2.getPosts());

  if (fdlist != null) {
    print("Hello");
    isFD = true;
  }
}

getMFs() async {
  mfnavlist = (await RemoteService4.getPosts());
  if (mfnavlist != null) {
    isMF = true;
  }
}

getNAll() async {
  all = (await NewServiceAll.getPosts());
  nAll = true;
}

getNMar() async {
  market = (await NewServiceMarket.getPosts());
  nMar = true;
}

getNTech() async {
  tech = (await NewServiceTech.getPosts());
  nTech = true;
}

getNEco() async {
  economy = (await NewServiceEconomy.getPosts());
  nEco = true;
}

Future getFD() async {
  fdlist = (await RemoteService2.getPosts());
  return fdlist;
}

var curruserKey = FirebaseCalls().getCurrentUserKey();

class HomePage2 extends StatefulWidget {
  const HomePage2({
    super.key,
  });

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> with TickerProviderStateMixin {
  bool ursername = false;
  void get() async {
    print(curruserKey);
    Future<bool> result = FirebaseCalls().checkUsername(curruserKey);
    bool check = await result;
    print("check: $check");

    setState(() {
      if (check) {
        ursername = true;
      }
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late AnimationController _animationController;
  final _controller = PageController();
  /*
  bool isUserName = false;
  String? userrr;
  Future getUsername() async {
    Map<String, dynamic>? temp = await FirebaseFirestore.instance
        .collection("username")
        .doc(curruserID)
        .get()
        .then((value) => value.data());
    if (temp != null) {
      setState(() {
        userrr = temp["username"];
        isUserName = true;
      });
    } else {
      setState(() {
        isUserName = false;
      });
    }
  }
*/
  @override
  void initState() {
    super.initState();
    //Provider.of<FD>(context, listen: false).getPosts();
    //  Provider.of<FD>(context, listen: false).getUsername();
    get();

/*
    getFDs();
    getNAll();
    getMFs();
    getNEco();
    getNMar();
    getNTech();
    */
    getperms();
  }

  void getperms() async {
    var status = await Permission.sms.status;
    await Permission.sms.request();
    if (status.isDenied) {
      await Permission.sms.request();
    }
  }

  final Llm poemRepository = Llm();
  // Future addUsername(String username) async {
  //   await FirebaseFirestore.instance
  //       .collection("personal expense")
  //       .doc(curruserID)
  //       .set({
  //     "jan": 0.0,
  //     "feb": 0.0,
  //     "mar": 0.0,
  //     "apr": 0.0,
  //     "may": 0.0,
  //     "jun": 0.0,
  //     "jul": 0.0,
  //     "aug": 0.0,
  //     "sep": 0.0,
  //     "oct": 0.0,
  //     "nov": 0.0,
  //     "dec": 0.0,
  //     "total": 0.0,
  //     "username": username,
  //   });
  // }

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
                "Please enter username",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Anderson',
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Neo',
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      ursername = true;
                    });
                    FirebaseCalls().addOrUpdateUsername(value, curruserKey);

                    Navigator.of(context).pop();
                  },
                ),
              ),
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

  Route _createRoute(value) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => value,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            if (ursername) ...[
              GestureDetector(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(186, 201, 255, 0.05),
                        borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Welcome to FinTrack",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'AndersonB',
                              )),
                          Text("Build a head start to your finances",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontFamily: 'Anderson',
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ] else ...[
              GestureDetector(
                onTap: () {
                  _showDialog(context);
                  HapticFeedback.heavyImpact();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(186, 201, 255, 0.1),
                        borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Set a Username",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'AndersonB',
                              )),
                          Text("To track family expenses username is required",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: 'Anderson',
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
            /*
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, bottom: 10),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color.fromRGBO(161, 128, 255, 0.3),
                        const Color.fromRGBO(117, 114, 255, 0.2),
                        const Color.fromRGBO(132, 112, 255, 0.01),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5)),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                      "Take control of your expenses with Eclipse!",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontFamily: 'AndersonB',
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Image(
                                    color: Colors.white,
                                    image: AssetImage(
                                        "assets/images/expenses.png"),
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                  ),
                                )
                              ],
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Icon(Icons.arrow_forward,
                            color: Colors.white, size: 22),
                      )
                    ],
                  ),
                ),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Text("WHAT'S NEW ⚡",
                  style: GoogleFonts.exo2(
                    letterSpacing: 2,
                    color: Colors.grey.shade600,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  )),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 0),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height / 12,
            //     width: MediaQuery.of(context).size.width,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 "Eclipse Tracking",
            //                 style: TextStyle(
            //                     fontSize: 18,
            //                     color: Colors.white,
            //                     fontFamily: 'AndersonB'),
            //               ),
            //               Text(
            //                 "Track your money on the go",
            //                 style: TextStyle(
            //                     color: Colors.grey,
            //                     fontFamily: 'Anderson',
            //                     fontWeight: FontWeight.w500),
            //               )
            //             ]),
            //         Container(
            //           width: MediaQuery.of(context).size.width / 2.8,
            //           height: MediaQuery.of(context).size.height / 3.5,
            //           child: Image(
            //             image: AssetImage("assets/images/ex2.gif"),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
                height: MediaQuery.of(context).size.height / 3.5,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    width: MediaQuery.of(context).size.width / 1.11,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Container(
                            //   padding: EdgeInsets.all(8),
                            //   decoration: BoxDecoration(
                            //     color: Color.fromRGBO(186, 201, 255, 0.2),
                            //     borderRadius: BorderRadius.circular(5),
                            //     //  border: Border.all(color: Colors.black, width: 1)
                            //   ),
                            //   child: Image(
                            //       image: AssetImage("assets/images/invest.png"),
                            //       height:
                            //           MediaQuery.of(context).size.height / 20),
                            // ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // RichText(
                                    //   text: TextSpan(
                                    //     text: '',
                                    //     style: GoogleFonts.urbanist(
                                    //       textStyle: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: 20,
                                    //           fontFamily: 'Anderson',
                                    //           fontWeight: FontWeight.w700),
                                    //     ),
                                    //     children: <TextSpan>[
                                    //       TextSpan(
                                    //         text: ' ',
                                    //         style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontSize: 20,
                                    //             fontFamily: 'Anderson',
                                    //             fontWeight: FontWeight.bold),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    Text("track your money on the GO!",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: 'Anderson',
                                            fontWeight: FontWeight.w700)),
                                    Text(
                                      "for individuals and family!",
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(186, 201, 255, 0.2),
                                  borderRadius: BorderRadius.circular(5),
                                  //  border: Border.all(color: Colors.black, width: 1)
                                ),
                                child: Image(
                                    image: AssetImage("assets/images/skul.png"),
                                    height: MediaQuery.of(context).size.height /
                                        15),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Column(
                            //   children: [
                            //     Text(
                            //       "Interest Rate",
                            //       style: GoogleFonts.ubuntu(
                            //           color: Colors.grey.shade600,
                            //           fontSize: 12),
                            //     ),
                            //     Text(
                            //       "${100}%",
                            //       style: GoogleFonts.ubuntu(
                            //           color: Color.fromRGBO(186, 201, 255, 1),
                            //           fontSize: 18),
                            //     ),
                            //   ],
                            // ),
                            // Column(
                            //   children: [
                            //     Text(
                            //       "Min Amount",
                            //       style: GoogleFonts.ubuntu(
                            //           color: Colors.grey.shade600,
                            //           fontSize: 12),
                            //     ),
                            //     Text(
                            //       "₹${1500000}",
                            //       style: GoogleFonts.ubuntu(
                            //           color: Color.fromRGBO(186, 201, 255, 1),
                            //           fontSize: 18),
                            //     ),
                            //   ],
                            // ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    _createRoute(NavPage(pageIndex: 1)),
                                    (Route<dynamic> route) => false);
                                HapticFeedback.heavyImpact();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(186, 201, 255, 0.2),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    Text(
                                      "start now",
                                      style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ])),

            // Padding(
            //   padding: const EdgeInsets.only(
            //       bottom: 20.0, left: 8, right: 8),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width / 1.25,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(width: 0.5)),
            //     child: Stack(
            //       alignment: Alignment.center,
            //       children: [
            //         Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Text(
            //                   "Looking for more options,\ndifferent rates, returns?",
            //                   style: TextStyle(
            //                     fontSize: 17,
            //                     color: Colors.white,
            //                     fontFamily: 'Anderson',
            //                   )),
            //               GestureDetector(
            //                 onTap: () {
            //                   setState(() {
            //                     Navigator.of(context)
            //                         .pushAndRemoveUntil(
            //                             _createRoute(
            //                                 NavPage(pageIndex: 1)),
            //                             (Route<dynamic> route) =>
            //                                 false);
            //                   });
            //                 },
            //                 child: Padding(
            //                   padding:
            //                       const EdgeInsets.only(top: 15.0),
            //                   child: Container(
            //                     height: MediaQuery.of(context)
            //                             .size
            //                             .height /
            //                         18,
            //                     width: MediaQuery.of(context)
            //                             .size
            //                             .width /
            //                         4,
            //                     padding: EdgeInsets.all(10),
            //                     decoration: BoxDecoration(
            //                         borderRadius:
            //                             BorderRadius.circular(5),
            //                         border: Border.all(
            //                             color: Color.fromRGBO(
            //                                 186, 201, 255, 1))),
            //                     child: Center(
            //                       child: Text(
            //                         "Explore",
            //                         style: TextStyle(
            //                           fontSize: 18,
            //                           color: Color.fromRGBO(
            //                               186, 201, 255, 1),
            //                           fontFamily: 'AndersonB',
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ]),
            //         Align(
            //           alignment: Alignment.bottomRight,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               Image(
            //                 image: AssetImage(
            //                     "assets/images/income.png"),
            //                 height:
            //                     MediaQuery.of(context).size.height /
            //                         12,
            //               )
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // )

            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.of(context).pushAndRemoveUntil(
            //           _createRoute(NavPage(pageIndex: 2)),
            //           (Route<dynamic> route) => false);
            //     },
            //     child: Container(
            //       height: MediaQuery.of(context).size.height / 6,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(5),
            //           color: Colors.black),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left: 15.0),
            //             child: Container(
            //               width: MediaQuery.of(context).size.width / 2,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                       "Take control of your expenses with Eclipse!",
            //                       style: TextStyle(
            //                         fontSize: 17,
            //                         color: Colors.white,
            //                         fontFamily: 'AndersonB',
            //                       )),
            //                   Padding(
            //                     padding: const EdgeInsets.only(top: 15.0),
            //                     child: Icon(
            //                       Icons.arrow_forward,
            //                       color: Colors.white,
            //                       size: 18,
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //           Container(
            //             width: MediaQuery.of(context).size.width / 2.8,
            //             height: MediaQuery.of(context).size.height / 3.5,
            //             child: Image(
            //               image: AssetImage("assets/images/ex2.gif"),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            //   child: Container(
            //     padding: EdgeInsets.all(20),
            //     decoration: BoxDecoration(
            //         color: Color.fromRGBO(186, 201, 255, 0.1),
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           width: MediaQuery.of(context).size.width / 1.25,
            //           child: Text(
            //             "upcoming updates!",
            //             style: GoogleFonts.ubuntu(
            //               fontSize: 12,
            //               color: Colors.grey,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 10.0),
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 1.25,
            //             child: Text(
            //               "eclipse AI",
            //               style: GoogleFonts.ubuntu(
            //                 fontSize: 18,
            //                 color: Colors.blueGrey,
            //               ),
            //             ),
            //           ),
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               width: MediaQuery.of(context).size.width / 2,
            //               child: Text(
            //                 "eclipse ai will help you analyze current news and provide detalied strategy on how to act in markets",
            //                 style: GoogleFonts.ubuntu(
            //                   fontSize: 13,
            //                   color: Colors.white60,
            //                 ),
            //               ),
            //             ),
            //             Container(
            //               width: MediaQuery.of(context).size.width / 4,
            //               child: Lottie.asset(
            //                 "assets/images/ai.json",
            //               ),
            //             ),
            //           ],
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(top: 8.0),
            //           child: Container(
            //             width: MediaQuery.of(context).size.width / 1.5,
            //             child: Text(
            //               "for more info visit our socials!",
            //               style: GoogleFonts.ubuntu(
            //                 fontSize: 13,
            //                 color: Colors.white60,
            //               ),
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.push(context, _createRoute(EclipseAI()));
            //             HapticFeedback.heavyImpact();
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.only(top: 20.0),
            //             child: Row(
            //               children: [
            //                 Text(
            //                   "see more",
            //                   style: GoogleFonts.ubuntu(
            //                       fontSize: 12, color: Colors.grey),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 5.0),
            //                   child: Icon(
            //                     Icons.arrow_forward,
            //                     color: Colors.grey,
            //                     size: 12,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            //   child: Text("MORE ON ECLIPSE 🤖",
            //       style: GoogleFonts.exo2(
            //         letterSpacing: 2,
            //         color: Colors.grey.shade600,
            //         textStyle: TextStyle(
            //           fontSize: 16,
            //         ),
            //       )),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height / 12,
            //     width: MediaQuery.of(context).size.width,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 "Eclipse News",
            //                 style: TextStyle(
            //                   fontSize: 18,
            //                   color: Colors.white,
            //                   fontFamily: 'AndersonB',
            //                 ),
            //               ),
            //               Text(
            //                 "Read top news on Eclipse",
            //                 style: TextStyle(
            //                     color: Colors.grey,
            //                     fontFamily: 'Anderson',
            //                     fontWeight: FontWeight.w500),
            //               )
            //             ]),
            //         Image(
            //             image: AssetImage("assets/images/newsflash.png"),
            //             height: MediaQuery.of(context).size.height / 22)
            //       ],
            //     ),
            //   ),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   physics: BouncingScrollPhysics(),
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 20.0),
            //     child: Row(
            //       children: [
            //         Container(
            //           height: MediaQuery.of(context).size.height / 3,
            //           width: MediaQuery.of(context).size.width / 1.15,
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 40.0),
            //             child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(bottom: 20.0),
            //                     child: Container(
            //                       width:
            //                           MediaQuery.of(context).size.width / 1.5,
            //                       child: Text(
            //                         "hey there,\nread something new today",
            //                         style: GoogleFonts.ubuntu(
            //                             fontSize: 20,
            //                             color: Colors.white,
            //                             fontWeight: FontWeight.w500),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     width: MediaQuery.of(context).size.width / 2.3,
            //                     child: Text(
            //                       "read latest news and stay on top of trends",
            //                       style: GoogleFonts.ubuntu(
            //                           fontSize: 12, color: Colors.grey),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.only(top: 20.0),
            //                     child: Row(
            //                       children: [
            //                         Text(
            //                           "view more",
            //                           style: GoogleFonts.ubuntu(
            //                               fontSize: 12, color: Colors.grey),
            //                         ),
            //                         Padding(
            //                           padding:
            //                               const EdgeInsets.only(left: 10.0),
            //                           child: Icon(
            //                             Icons.arrow_forward,
            //                             color: Colors.grey,
            //                             size: 12,
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ]),
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).pushAndRemoveUntil(
            //                 _createRoute(NavPage(pageIndex: 2)),
            //                 (Route<dynamic> route) => false);
            //             HapticFeedback.heavyImpact();
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 20.0),
            //             child: Container(
            //               height: MediaQuery.of(context).size.height / 1.8,
            //               width: MediaQuery.of(context).size.width / 1.5,
            //               decoration: BoxDecoration(
            //                 // color: Color.fromRGBO(186, 201, 255, 0.1),
            //                 gradient: LinearGradient(
            //                   begin: Alignment.topCenter,
            //                   end: Alignment.bottomCenter,
            //                   colors: [
            //                     const Color.fromRGBO(161, 128, 255, 0.25),
            //                     const Color.fromRGBO(117, 114, 255, 0.1),
            //                     const Color.fromRGBO(132, 112, 255, 0.01),
            //                   ],
            //                 ),
            //                 borderRadius: BorderRadius.circular(5),
            //               ),
            //               child: Column(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         top: 20.0, bottom: 20),
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(10),
            //                       child: Image(
            //                         image:
            //                             AssetImage("assets/images/ecomar.png"),
            //                         height:
            //                             MediaQuery.of(context).size.height / 5,
            //                       ),
            //                     ),
            //                   ),
            //                   Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Padding(
            //                           padding:
            //                               const EdgeInsets.only(bottom: 10.0),
            //                           child: Container(
            //                             width:
            //                                 MediaQuery.of(context).size.width /
            //                                     2,
            //                             child: Text(
            //                               "get latest updates through news to plan your finances",
            //                               style: TextStyle(
            //                                   fontSize: 20,
            //                                   color: Colors.white,
            //                                   fontFamily: 'Anderson',
            //                                   fontWeight: FontWeight.w700),
            //                             ),
            //                           ),
            //                         ),
            //                         Container(
            //                           width:
            //                               MediaQuery.of(context).size.width / 2,
            //                           child: Text(
            //                             "Read latest news and stay on top of trends",
            //                             style: GoogleFonts.ubuntu(
            //                                 fontSize: 12, color: Colors.grey),
            //                           ),
            //                         ),
            //                         Container(
            //                           width:
            //                               MediaQuery.of(context).size.width / 2,
            //                           child: Padding(
            //                             padding: const EdgeInsets.only(
            //                               top: 40.0,
            //                             ),
            //                             child: Row(
            //                               children: [
            //                                 Text(
            //                                   "read more",
            //                                   style: GoogleFonts.ubuntu(
            //                                       fontSize: 14,
            //                                       color: Colors.grey),
            //                                 ),
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 10.0),
            //                                   child: Icon(
            //                                     Icons.arrow_forward,
            //                                     color: Colors.grey,
            //                                     size: 12,
            //                                   ),
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ])
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).pushAndRemoveUntil(
            //                 _createRoute(NavPage(pageIndex: 2)),
            //                 (Route<dynamic> route) => false);
            //             HapticFeedback.heavyImpact();
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 20.0),
            //             child: Container(
            //               height: MediaQuery.of(context).size.height / 1.8,
            //               width: MediaQuery.of(context).size.width / 1.5,
            //               decoration: BoxDecoration(
            //                 // color: Color.fromRGBO(186, 201, 255, 0.1),
            //                 gradient: LinearGradient(
            //                   begin: Alignment.topCenter,
            //                   end: Alignment.bottomCenter,
            //                   colors: [
            //                     const Color.fromRGBO(161, 128, 255, 0.25),
            //                     const Color.fromRGBO(117, 114, 255, 0.1),
            //                     const Color.fromRGBO(132, 112, 255, 0.01),
            //                   ],
            //                 ),
            //                 borderRadius: BorderRadius.circular(5),
            //               ),
            //               child: Column(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         top: 20.0, bottom: 20),
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(10),
            //                       child: Image(
            //                         image:
            //                             AssetImage("assets/images/newnews.png"),
            //                         height:
            //                             MediaQuery.of(context).size.height / 5,
            //                       ),
            //                     ),
            //                   ),
            //                   Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Padding(
            //                           padding:
            //                               const EdgeInsets.only(bottom: 10.0),
            //                           child: Container(
            //                             width:
            //                                 MediaQuery.of(context).size.width /
            //                                     2,
            //                             child: Text(
            //                               "see what's happening in the market",
            //                               style: TextStyle(
            //                                   fontSize: 20,
            //                                   color: Colors.white,
            //                                   fontFamily: 'Anderson',
            //                                   fontWeight: FontWeight.w700),
            //                             ),
            //                           ),
            //                         ),
            //                         Container(
            //                           width:
            //                               MediaQuery.of(context).size.width / 2,
            //                           child: Text(
            //                             "Read latest news and stay on top of trends",
            //                             style: GoogleFonts.ubuntu(
            //                                 fontSize: 12, color: Colors.grey),
            //                           ),
            //                         ),
            //                         Container(
            //                           width:
            //                               MediaQuery.of(context).size.width / 2,
            //                           child: Padding(
            //                             padding: const EdgeInsets.only(
            //                               top: 40.0,
            //                             ),
            //                             child: Row(
            //                               children: [
            //                                 Text(
            //                                   "read market news",
            //                                   style: GoogleFonts.ubuntu(
            //                                       fontSize: 14,
            //                                       color: Colors.grey),
            //                                 ),
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 10.0),
            //                                   child: Icon(
            //                                     Icons.arrow_forward,
            //                                     color: Colors.grey,
            //                                     size: 12,
            //                                   ),
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ])
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).pushAndRemoveUntil(
            //                 _createRoute(NavPage(pageIndex: 2)),
            //                 (Route<dynamic> route) => false);
            //             HapticFeedback.heavyImpact();
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 20.0),
            //             child: Container(
            //               height: MediaQuery.of(context).size.height / 1.8,
            //               width: MediaQuery.of(context).size.width / 1.5,
            //               decoration: BoxDecoration(
            //                 // color: Color.fromRGBO(186, 201, 255, 0.1),
            //                 gradient: LinearGradient(
            //                   begin: Alignment.topCenter,
            //                   end: Alignment.bottomCenter,
            //                   colors: [
            //                     const Color.fromRGBO(161, 128, 255, 0.25),
            //                     const Color.fromRGBO(117, 114, 255, 0.1),
            //                     const Color.fromRGBO(132, 112, 255, 0.01),
            //                   ],
            //                 ),
            //                 borderRadius: BorderRadius.circular(5),
            //               ),
            //               child: Column(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         top: 20.0, bottom: 20),
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(10),
            //                       child: Image(
            //                         image: AssetImage(
            //                             "assets/images/newnews1.png"),
            //                         height:
            //                             MediaQuery.of(context).size.height / 5,
            //                       ),
            //                     ),
            //                   ),
            //                   Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Padding(
            //                           padding:
            //                               const EdgeInsets.only(bottom: 10.0),
            //                           child: Container(
            //                             width:
            //                                 MediaQuery.of(context).size.width /
            //                                     2,
            //                             child: Text(
            //                               "read about latest trends in science and technology",
            //                               style: TextStyle(
            //                                   fontSize: 20,
            //                                   color: Colors.white,
            //                                   fontFamily: 'Anderson',
            //                                   fontWeight: FontWeight.w700),
            //                             ),
            //                           ),
            //                         ),
            //                         Container(
            //                           width:
            //                               MediaQuery.of(context).size.width / 2,
            //                           child: Text(
            //                             "Read latest news and stay on top of trends",
            //                             style: GoogleFonts.ubuntu(
            //                                 fontSize: 12, color: Colors.grey),
            //                           ),
            //                         ),
            //                         Container(
            //                           width:
            //                               MediaQuery.of(context).size.width / 2,
            //                           child: Padding(
            //                             padding: const EdgeInsets.only(
            //                               top: 40.0,
            //                             ),
            //                             child: Row(
            //                               children: [
            //                                 Text(
            //                                   "read tech news",
            //                                   style: GoogleFonts.ubuntu(
            //                                       fontSize: 14,
            //                                       color: Colors.grey),
            //                                 ),
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 10.0),
            //                                   child: Icon(
            //                                     Icons.arrow_forward,
            //                                     color: Colors.grey,
            //                                     size: 12,
            //                                   ),
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ])
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //
            //         // GestureDetector(
            //         //   onTap: () {
            //         //     Navigator.of(context).pushAndRemoveUntil(
            //         //         _createRoute(NavPage(pageIndex: 2)),
            //         //         (Route<dynamic> route) => false);
            //         //   },
            //         //   child: Padding(
            //         //     padding: const EdgeInsets.only(left: 20.0),
            //         //     child: Container(
            //         //       height: MediaQuery.of(context).size.height / 5,
            //         //       width: MediaQuery.of(context).size.width / 1.25,
            //         //       decoration: BoxDecoration(
            //         //         color: Color.fromRGBO(186, 201, 255, 0.1),
            //         //         borderRadius: BorderRadius.circular(10),
            //         //       ),
            //         //       child: Row(
            //         //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         //         children: [
            //         //           Padding(
            //         //             padding: const EdgeInsets.only(left: 8.0),
            //         //             child: ClipRRect(
            //         //               borderRadius: BorderRadius.circular(5),
            //         //               child: Image(
            //         //                 image: AssetImage("assets/images/techn.png"),
            //         //                 height:
            //         //                     MediaQuery.of(context).size.height / 7.5,
            //         //               ),
            //         //             ),
            //         //           ),
            //         //           Column(
            //         //               mainAxisAlignment: MainAxisAlignment.center,
            //         //               children: [
            //         //                 Padding(
            //         //                   padding:
            //         //                       const EdgeInsets.only(bottom: 20.0),
            //         //                   child: Container(
            //         //                     width: MediaQuery.of(context).size.width /
            //         //                         2.5,
            //         //                     child: Text(
            //         //                       "Technology News",
            //         //                       style: TextStyle(
            //         //                           fontSize: 20,
            //         //                           color: Colors.white,
            //         //                           fontFamily: 'Anderson',
            //         //                           fontWeight: FontWeight.w700),
            //         //                     ),
            //         //                   ),
            //         //                 ),
            //         //                 Container(
            //         //                   width:
            //         //                       MediaQuery.of(context).size.width / 2.5,
            //         //                   child: Text(
            //         //                     "Read latest news and stay on top of trends",
            //         //                     style: GoogleFonts.ubuntu(
            //         //                         fontSize: 14, color: Colors.grey),
            //         //                   ),
            //         //                 ),
            //         //               ])
            //         //         ],
            //         //       ),
            //         //     ),
            //         //   ),
            //         // ),
            //         // GestureDetector(
            //         //   onTap: () {
            //         //     Navigator.of(context).pushAndRemoveUntil(
            //         //         _createRoute(NavPage(pageIndex: 3)),
            //         //         (Route<dynamic> route) => false);
            //         //   },
            //         //   child: Padding(
            //         //     padding: const EdgeInsets.only(left: 20.0),
            //         //     child: Container(
            //         //       height: MediaQuery.of(context).size.height / 5,
            //         //       width: MediaQuery.of(context).size.width / 1.25,
            //         //       decoration: BoxDecoration(
            //         //         color: Color.fromRGBO(186, 201, 255, 0.1),
            //         //         borderRadius: BorderRadius.circular(5),
            //         //       ),
            //         //       child: Row(
            //         //         children: [
            //         //           Image(
            //         //             image: AssetImage("assets/images/news.png"),
            //         //             height: MediaQuery.of(context).size.height / 5,
            //         //           ),
            //         //           Column(
            //         //               mainAxisAlignment: MainAxisAlignment.center,
            //         //               children: [
            //         //                 Padding(
            //         //                   padding:
            //         //                       const EdgeInsets.only(bottom: 20.0),
            //         //                   child: Container(
            //         //                     width: MediaQuery.of(context).size.width /
            //         //                         2.5,
            //         //                     child: Text(
            //         //                       "Latest News",
            //         //                       style: TextStyle(
            //         //                           fontSize: 20,
            //         //                           color: Colors.white,
            //         //                           fontFamily: 'Anderson',
            //         //                           fontWeight: FontWeight.w700),
            //         //                     ),
            //         //                   ),
            //         //                 ),
            //         //                 Container(
            //         //                   width:
            //         //                       MediaQuery.of(context).size.width / 2.5,
            //         //                   child: Text(
            //         //                     "Read latest news and stay on top of trends",
            //         //                     style: GoogleFonts.ubuntu(
            //         //                         fontSize: 14, color: Colors.grey),
            //         //                   ),
            //         //                 ),
            //         //               ])
            //         //         ],
            //         //       ),
            //         //     ),
            //         //   ),
            //         // )
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 0.0),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height / 5,
            //     width: MediaQuery.of(context).size.width / 1.11,
            //     decoration: BoxDecoration(
            //       color: Color.fromRGBO(186, 201, 255, 0.01),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         // ClipRRect(
            //         //   borderRadius: BorderRadius.circular(10),
            //         //   child: Image(
            //         //     image: AssetImage("assets/images/allNews.png"),
            //         //     height: MediaQuery.of(context).size.height / 7.5,
            //         //   ),
            //         // ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 20.0),
            //           child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.only(bottom: 5.0),
            //                   child: Container(
            //                     width: MediaQuery.of(context).size.width / 2.4,
            //                     child: Text(
            //                       "hello, Bawe",
            //                       style: GoogleFonts.ubuntu(
            //                           fontSize: 20,
            //                           color: Colors.white,
            //                           fontWeight: FontWeight.w500),
            //                     ),
            //                   ),
            //                 ),
            //                 Container(
            //                   width: MediaQuery.of(context).size.width / 2.3,
            //                   child: Text(
            //                     "read latest news and stay on top of trends",
            //                     style: GoogleFonts.ubuntu(
            //                         fontSize: 12, color: Colors.grey),
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 20.0),
            //                   child: Row(
            //                     children: [
            //                       Text(
            //                         "view more",
            //                         style: GoogleFonts.ubuntu(
            //                             fontSize: 12, color: Colors.grey),
            //                       ),
            //                       Padding(
            //                         padding: const EdgeInsets.only(left: 10.0),
            //                         child: Icon(
            //                           Icons.arrow_forward,
            //                           color: Colors.grey,
            //                           size: 12,
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               ]),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 20),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(10),
            //             child: Image(
            //               image: AssetImage("assets/images/newss.gif"),
            //               height: MediaQuery.of(context).size.height / 7.5,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 15.0),
            //   child: Column(
            //     children: [
            //       Container(
            //         height: MediaQuery.of(context).size.height / 8,
            //         child: PageView(
            //           scrollDirection: Axis.horizontal,
            //           controller: _controller,
            //           children: [
            //             GestureDetector(
            //               onTap: (() {
            //                 Navigator.of(context).push(_createRoute(Swipe()));
            //                 HapticFeedback.heavyImpact();
            //               }),
            //               child: Padding(
            //                 padding: const EdgeInsets.only(left: 25, right: 25),
            //                 child: Container(
            //                   height: MediaQuery.of(context).size.height / 9,
            //                   decoration: BoxDecoration(
            //                     color: Color.fromRGBO(186, 201, 255, 1),
            //                     borderRadius: BorderRadius.circular(10),
            //                   ),
            //                   width: MediaQuery.of(context).size.width / 1.25,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(
            //                               top: 8.0, left: 8),
            //                           child: Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text(
            //                                 "Eclipse Education",
            //                                 style: TextStyle(
            //                                   fontSize: 18,
            //                                   color: Colors.black,
            //                                   fontFamily: 'AndersonB',
            //                                 ),
            //                               ),
            //                               Padding(
            //                                 padding:
            //                                     const EdgeInsets.only(top: 8.0),
            //                                 child: Container(
            //                                   width: MediaQuery.of(context)
            //                                           .size
            //                                           .width /
            //                                       2,
            //                                   child: Text(
            //                                     "Blogs and aricles by personal finance experts",
            //                                     style: GoogleFonts.ubuntu(
            //                                         color: Colors.grey.shade800,
            //                                         fontSize: 12),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         Image(
            //                           image:
            //                               AssetImage("assets/images/edu.png"),
            //                           height:
            //                               MediaQuery.of(context).size.height /
            //                                   7,
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             GestureDetector(
            //               onTap: () async {
            //                 Uri url = Uri(
            //                     scheme: "https",
            //                     host: "insidelibrary.weebly.com");
            //
            //                 if (!await launchUrl(
            //                   url,
            //                   mode: LaunchMode.externalApplication,
            //                 )) {
            //                   throw Exception('Could not launch $url');
            //                 }
            //                 HapticFeedback.heavyImpact();
            //               },
            //               child: Padding(
            //                 padding: const EdgeInsets.only(left: 25, right: 15),
            //                 child: Container(
            //                   height: MediaQuery.of(context).size.height / 9,
            //                   decoration: BoxDecoration(
            //                     color: Color.fromRGBO(186, 201, 255, 1),
            //                     borderRadius: BorderRadius.circular(10),
            //                   ),
            //                   width: MediaQuery.of(context).size.width / 1.25,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(
            //                               top: 8.0, left: 8),
            //                           child: Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text(
            //                                 "Write for Eclipse",
            //                                 style: TextStyle(
            //                                   fontSize: 18,
            //                                   color: Colors.black,
            //                                   fontFamily: 'AndersonB',
            //                                 ),
            //                               ),
            //                               Padding(
            //                                 padding:
            //                                     const EdgeInsets.only(top: 8.0),
            //                                 child: Container(
            //                                   width: MediaQuery.of(context)
            //                                           .size
            //                                           .width /
            //                                       1.9,
            //                                   child: Text(
            //                                     "We invite you to join our platform as writers",
            //                                     style: GoogleFonts.ubuntu(
            //                                         color: Colors.grey.shade800,
            //                                         fontSize: 12),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         Image(
            //                           image:
            //                               AssetImage("assets/images/edu.png"),
            //                           height:
            //                               MediaQuery.of(context).size.height /
            //                                   7,
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 15.0, bottom: 20),
            //         child: SmoothPageIndicator(
            //           controller: _controller,
            //           count: 2,
            //           effect: ExpandingDotsEffect(
            //             dotColor: Colors.grey,
            //             activeDotColor:
            //                 const Color.fromRGBO(117, 114, 255, 0.8),
            //             dotHeight: 4,
            //             dotWidth: 8,
            //             expansionFactor: 4,
            //             spacing: 4.0,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            /*
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Visibility(
                  visible: nEco,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        height: MediaQuery.of(context).size.height / 2.8,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Card(
                              color: Colors.grey.shade900,
                              elevation: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        if (market!.feed[index].bannerImage ==
                                            null) ...[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  6,
                                              child: Image(
                                                  image: AssetImage(
                                                      "assets/images/profile.png")),
                                            ),
                                          )
                                        ] else if (Uri.parse(market!
                                                .feed[index].bannerImage
                                                .toString())
                                            .host
                                            .isEmpty) ...[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  6,
                                              child: Image(
                                                  image: AssetImage(
                                                      "assets/images/profile.png")),
                                            ),
                                          )
                                        ] else ...[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 2),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  6,
                                              child: Image.network(
                                                market!.feed[index].bannerImage
                                                    .toString(),
                                                fit: BoxFit.fill,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            market!.feed[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            );
                          }),
                        )),
                  ),
                  replacement: Center(
                      child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 1000,
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const SizedBox(height: 80),
                          );
                        },
                      ),
                    ),
                  ))),
            ),*/
          ],
        ),
      ),
    );
  }
}

List<ChartLayer> layers() {
  return [
    ChartGroupPieLayer(
      items: List.generate(
        3,
        (index) => List.generate(
          2,
          (index) => ChartGroupPieDataItem(
              amount: [
                1000,
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
                600
              ][index]
                  .toDouble(),
              color: [
                Colors.redAccent,
                Colors.orangeAccent,
                Colors.pinkAccent,
                Colors.blueAccent,
                Colors.cyanAccent,
                Colors.tealAccent,
                Colors.orangeAccent,
                Colors.pinkAccent,
                Colors.redAccent,
                Colors.blueAccent,
                Colors.cyanAccent,
                Colors.tealAccent,
              ][index],
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
              ][index]),
        ),
      ),
      settings: const ChartGroupPieSettings(
        angleOffset: 120,
      ),
    ),
    ChartTooltipLayer(
      shape: () => ChartTooltipPieShape<ChartGroupPieDataItem>(
        onTextName: (item) => item.label,
        onTextValue: (item) => '€${item.amount.toString()}',
        radius: 3.0,
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
