// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:app1/main.dart';
import 'package:app1/models/firebaseCalls.dart';
import 'package:app1/models/newsmodel.dart';
import 'package:app1/screens/expenses.dart';
import 'package:app1/screens/homepage2.dart';
import 'package:app1/screens/incometax2.dart';
import 'package:app1/screens/investmf.dart';
import 'package:app1/screens/news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// Future addUsername(String username) async {
//   await FirebaseFirestore.instance
//       .collection("personal expense")
//       .doc(curruserID)
//       .update({
//     "username": username,
//   });
// }

String familyUserID = "";

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
//     Map<String, dynamic> connectData = {"userkey": userkey};
//     await _firestore.collection('family').doc(curruserID).set(connectData);

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

class NavPage extends StatefulWidget {
  NavPage({required this.pageIndex, super.key});

  int pageIndex;
  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  PageController _pageController = PageController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<Widget> widgetlists = [
    HomePage2(),
    // InvestMFPage(),
    ExpensePage(),
    // NewsPage(
    //   index: 2,
    // ),
    // TaxPage(),
  ];
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
                    FirebaseCalls().addOrUpdateUsername(value, curruserKey);
                    // addUsername(value);
                    Navigator.of(context).pop();
                    Fluttertoast.showToast(
                        msg: "Username Changed!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
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

  void _showdialogue1(BuildContext context) {
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
                  autofocus: true,
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
                    FirebaseCalls().connectFriend(usernmane.text, curruserKey);
                    // familyUserID = usernmane.text;
                    // onAdd(usernmane.text);
                    Navigator.of(context).pop();
                    Fluttertoast.showToast(
                        msg: "Member added!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
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
        drawer: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: SafeArea(
            child: Drawer(
              backgroundColor: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontFamily: 'Anderson',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20),
                        child: Column(
                          children: [
                            // GestureDetector(
                            //   onTap: () async {
                            //     Uri url = Uri(
                            //         scheme: "https",
                            //         host: "eclipsefin.netlify.app");
                            //
                            //     if (!await launchUrl(
                            //       url,
                            //       mode: LaunchMode.externalApplication,
                            //     )) {
                            //       throw Exception('Could not launch $url');
                            //     }
                            //     HapticFeedback.heavyImpact();
                            //   },
                            //   child: Row(children: [
                            //     Icon(
                            //       Icons.info_outline_rounded,
                            //       size: 18,
                            //       color: Colors.white,
                            //     ),
                            //     // Padding(
                            //     //   padding: const EdgeInsets.only(left: 10.0),
                            //     //   child: Text("About us",
                            //     //       style: TextStyle(
                            //     //           fontSize: 16,
                            //     //           color: Colors.white,
                            //     //           fontFamily: 'AndersonB')),
                            //     // ),
                            //   ]),
                            // ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(
                              ClipboardData(text: curruserKey));

                          // copied successfully
                          Fluttertoast.showToast(
                              msg: "Userkey Copied!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          HapticFeedback.heavyImpact();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 20),
                          child: Row(children: [
                            Icon(
                              Icons.person_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Copy UserKey",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'AndersonB')),
                            ),
                          ]),
                        ),
                      ),
                      // FutureBuilder(
                      //   future: FirebaseFirestore.instance
                      //       .collection("updates")
                      //       .doc("version")
                      //       .get(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       Map<String, dynamic>? temp = snapshot.data!.data();
                      //       return GestureDetector(
                      //         onTap: () {
                      //           if (temp?["version"].toString() !=
                      //               version.toString()) {
                      //             print(temp?["verison"].toString());
                      //             print(version);
                      //             Fluttertoast.showToast(
                      //                 msg: "New updates available on website!",
                      //                 toastLength: Toast.LENGTH_SHORT,
                      //                 gravity: ToastGravity.BOTTOM,
                      //                 timeInSecForIosWeb: 1,
                      //                 backgroundColor: Colors.black,
                      //                 textColor: Colors.white,
                      //                 fontSize: 14.0);
                      //           } else {
                      //             Fluttertoast.showToast(
                      //                 msg: "App is up-to-date!",
                      //                 toastLength: Toast.LENGTH_SHORT,
                      //                 gravity: ToastGravity.BOTTOM,
                      //                 timeInSecForIosWeb: 1,
                      //                 backgroundColor: Colors.black,
                      //                 textColor: Colors.white,
                      //                 fontSize: 14.0);
                      //           }
                      //           HapticFeedback.heavyImpact();
                      //         },
                      //         child: Padding(
                      //           padding:
                      //               const EdgeInsets.only(top: 30.0, left: 20),
                      //           child: Column(
                      //             children: [
                      //               Row(children: [
                      //                 Icon(
                      //                   Icons.refresh_rounded,
                      //                   size: 18,
                      //                   color: Colors.white,
                      //                 ),
                      //                 Padding(
                      //                   padding:
                      //                       const EdgeInsets.only(left: 10.0),
                      //                   child: Text(
                      //                     "Check for updates",
                      //                     style: TextStyle(
                      //                         fontSize: 16,
                      //                         color: Colors.white,
                      //                         fontFamily: 'AndersonB'),
                      //                   ),
                      //                 ),
                      //               ]),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     } else {
                      //       return Text("yo");
                      //       print("no");
                      //     }
                      //   },
                      // ),
                      GestureDetector(
                        onTap: () {
                          _showDialog(context);
                          HapticFeedback.heavyImpact();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 20),
                          child: Row(children: [
                            Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Change Username",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'AndersonB')),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showdialogue1(context);
                          HapticFeedback.heavyImpact();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 20),
                          child: Row(children: [
                            Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Connect a friend",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'AndersonB')),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   "Made with ❤️",
                        //   style: TextStyle(
                        //       fontSize: 18,
                        //       color: Colors.white,
                        //       fontFamily: 'AndersonB'),
                        // ),
                        Text(
                          "Version 1.0.0",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: Colors.grey),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 8.0),
                        //   child: Text(
                        //     "Backed by Inside Labs",
                        //     style: TextStyle(
                        //         fontSize: 16,
                        //         color: Colors.white,
                        //         fontFamily: 'Anderson',
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          //backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: (widget.pageIndex == 0)
              ? Builder(
                  builder: (context) => // Ensure Scaffold is in context
                      IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () => Scaffold.of(context).openDrawer()))
              : Text(""),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 18.0),
          //     child: GestureDetector(
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (context) => NewsPage(
          //                     index: 0,
          //                   )));
          //         },
          //         child: Icon(Icons.arrow_forward_ios, size: 25)),
          //   )
          // ],
          title: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.pageIndex == 0) ...[
                  Text(
                    "Overview",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(186, 201, 255, 1),
                      fontFamily: 'AndersonB',
                    ),
                  ),
                ] else if (widget.pageIndex == 1) ...[
                  Text(
                    "FinTrack Tracking",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(186, 201, 255, 1),
                      fontFamily: 'AndersonB',
                    ),
                  )
                ],
                // if (widget.pageIndex == 2) ...[
                //   Text(
                //     "News",
                //     style: TextStyle(
                //       fontSize: 20,
                //       color: Color.fromRGBO(186, 201, 255, 1),
                //       fontFamily: 'AndersonB',
                //     ),
                //   ),
                // ]
                // ] else if (widget.pageIndex == 4) ...[
                //   Text(
                //     "Eclipse Taxes",
                //     style: TextStyle(
                //       fontSize: 18,
                //       color: Color.fromRGBO(186, 201, 255, 1),
                //       fontFamily: 'AndersonB',
                //     ),
                //   ),
                // ],
              ],
            ),
          ),
        ),
        /*
        bottomNavigationBar: AnimatedNotchBottomBar(
          pageController: _pageController,
          color: Colors.white,
          notchColor: Colors.black,
          bottomBarItems: [
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.home_filled,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.home_filled,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Page 1',
            ),
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.star,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.star,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Page 2',
            ),
          ],
          onTap: (index) {
            setState(() {
              widget.pageIndex = index;
            });
          },
        ),*/

        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white60,
          selectedIconTheme: IconThemeData(
              color: /*Color.fromRGBO(170, 168, 253, 1)*/
                  Color.fromRGBO(186, 201, 255, 1)),
          currentIndex: widget.pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              widget.pageIndex = index;
            });
            HapticFeedback.heavyImpact();
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: (widget.pageIndex == 0)
                            ? RadialGradient(
                                radius: 1,
                                colors: [
                                  Color.fromRGBO(102, 19, 255, 0.7),
                                  const Color.fromRGBO(117, 114, 255, 0),
                                  const Color.fromRGBO(132, 112, 255, 0),
                                ],
                              )
                            : RadialGradient(colors: [
                                Color.fromRGBO(102, 19, 255, 0),
                                const Color.fromRGBO(117, 114, 255, 0),
                                const Color.fromRGBO(132, 112, 255, 0)
                              ])),
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    child: Icon(FeatherIcons.home, size: 25)),
                label: "Home"),
            // BottomNavigationBarItem(
            //   icon: Container(
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           gradient: (widget.pageIndex == 1)
            //               ? RadialGradient(
            //                   radius: 1,
            //                   colors: [
            //                     Color.fromRGBO(102, 19, 255, 0.7),
            //                     const Color.fromRGBO(117, 114, 255, 0),
            //                     const Color.fromRGBO(132, 112, 255, 0),
            //                   ],
            //                 )
            //               : RadialGradient(colors: [
            //                   Color.fromRGBO(102, 19, 255, 0),
            //                   const Color.fromRGBO(117, 114, 255, 0),
            //                   const Color.fromRGBO(132, 112, 255, 0)
            //                 ])),
            //       padding:
            //           EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            //       child: Icon(FeatherIcons.dollarSign, size: 25)),
            //   label: "",
            // ),
            BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: (widget.pageIndex == 1)
                            ? RadialGradient(
                                radius: 1,
                                colors: [
                                  Color.fromRGBO(102, 19, 255, 0.7),
                                  const Color.fromRGBO(117, 114, 255, 0),
                                  const Color.fromRGBO(132, 112, 255, 0),
                                ],
                              )
                            : RadialGradient(colors: [
                                Color.fromRGBO(102, 19, 255, 0),
                                const Color.fromRGBO(117, 114, 255, 0),
                                const Color.fromRGBO(132, 112, 255, 0)
                              ])),
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    child:
                        Icon(Icons.account_balance_wallet_outlined, size: 25)),
                label: "Expenses"),
            // BottomNavigationBarItem(
            //     icon: Container(
            //         decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             gradient: (widget.pageIndex == 2)
            //                 ? RadialGradient(
            //                     radius: 1,
            //                     colors: [
            //                       Color.fromRGBO(102, 19, 255, 0.7),
            //                       const Color.fromRGBO(117, 114, 255, 0),
            //                       const Color.fromRGBO(132, 112, 255, 0),
            //                     ],
            //                   )
            //                 : RadialGradient(colors: [
            //                     Color.fromRGBO(102, 19, 255, 0),
            //                     const Color.fromRGBO(117, 114, 255, 0),
            //                     const Color.fromRGBO(132, 112, 255, 0)
            //                   ])),
            //         padding:
            //             EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            //         child: Icon(Icons.newspaper_outlined, size: 25)),
            //     label: "News"),
            // BottomNavigationBarItem(
            //     icon: Container(
            //         decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             gradient: (widget.pageIndex == 4)
            //                 ? RadialGradient(
            //                     radius: 1,
            //                     colors: [
            //                       Color.fromRGBO(102, 19, 255, 0.7),
            //                       const Color.fromRGBO(117, 114, 255, 0),
            //                       const Color.fromRGBO(132, 112, 255, 0),
            //                     ],
            //                   )
            //                 : RadialGradient(colors: [
            //                     Color.fromRGBO(102, 19, 255, 0),
            //                     const Color.fromRGBO(117, 114, 255, 0),
            //                     const Color.fromRGBO(132, 112, 255, 0)
            //                   ])),
            //         padding:
            //             EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            //         child: Icon(Icons.request_quote_outlined, size: 25)),
            //     label: "Taxes"),
          ],
        ),
        body: Center(child: widgetlists[widget.pageIndex]));
    //  Stack(
    //   children: [
    //     IndexedStack(
    //       index: widget.pageIndex,
    //       children: widgetlists,
    //     ),
    //     Positioned(
    //       bottom: 0,
    //       left: 0,
    //       right: 0,
    //       child: Padding(
    //         padding:
    //             const EdgeInsets.only(bottom: 20.0, left: 80, right: 80),
    //         child: Container(
    //           height: MediaQuery.of(context).size.height / 14,
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(10),
    //             child: BottomNavigationBar(
    //               showSelectedLabels: false,
    //               showUnselectedLabels: false,
    //               backgroundColor: Colors.black.withOpacity(0.7),
    //               unselectedItemColor: Colors.white60,
    //               selectedIconTheme: IconThemeData(
    //                   color: /*Color.fromRGBO(170, 168, 253, 1)*/
    //                       Color.fromRGBO(186, 201, 255, 1)),
    //               currentIndex: widget.pageIndex,
    //               type: BottomNavigationBarType.fixed,
    //               onTap: (index) {
    //                 setState(() {
    //                   widget.pageIndex = index;
    //                 });
    //               },
    //               items: [
    //                 // BottomNavigationBarItem(
    //                 //     icon: Container(
    //                 //         decoration: BoxDecoration(
    //                 //             shape: BoxShape.circle,
    //                 //             gradient: (widget.pageIndex == 0)
    //                 //                 ? RadialGradient(
    //                 //                     radius: 1,
    //                 //                     colors: [
    //                 //                       Color.fromRGBO(
    //                 //                           102, 19, 255, 0.7),
    //                 //                       const Color.fromRGBO(
    //                 //                           117, 114, 255, 0),
    //                 //                       const Color.fromRGBO(
    //                 //                           132, 112, 255, 0),
    //                 //                     ],
    //                 //                   )
    //                 //                 : RadialGradient(colors: [
    //                 //                     Color.fromRGBO(102, 19, 255, 0),
    //                 //                     const Color.fromRGBO(
    //                 //                         117, 114, 255, 0),
    //                 //                     const Color.fromRGBO(
    //                 //                         132, 112, 255, 0)
    //                 //                   ])),
    //                 //         padding: EdgeInsets.only(
    //                 //             top: 5, bottom: 5, left: 10, right: 10),
    //                 //         child: Icon(FeatherIcons.home, size: 25)),
    //                 //     label: "Home"),
    //                 // BottomNavigationBarItem(
    //                 //   icon: Container(
    //                 //       decoration: BoxDecoration(
    //                 //           shape: BoxShape.circle,
    //                 //           gradient: (widget.pageIndex == 1)
    //                 //               ? RadialGradient(
    //                 //                   radius: 1,
    //                 //                   colors: [
    //                 //                     Color.fromRGBO(102, 19, 255, 0.7),
    //                 //                     const Color.fromRGBO(
    //                 //                         117, 114, 255, 0),
    //                 //                     const Color.fromRGBO(
    //                 //                         132, 112, 255, 0),
    //                 //                   ],
    //                 //                 )
    //                 //               : RadialGradient(colors: [
    //                 //                   Color.fromRGBO(102, 19, 255, 0),
    //                 //                   const Color.fromRGBO(
    //                 //                       117, 114, 255, 0),
    //                 //                   const Color.fromRGBO(
    //                 //                       132, 112, 255, 0)
    //                 //                 ])),
    //                 //       padding: EdgeInsets.only(
    //                 //           top: 5, bottom: 5, left: 10, right: 10),
    //                 //       child: Icon(FeatherIcons.dollarSign, size: 25)),
    //                 //   label: "",
    //                 // ),
    //                 BottomNavigationBarItem(
    //                     icon: Container(
    //                         decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             gradient: (widget.pageIndex == 2)
    //                                 ? RadialGradient(
    //                                     radius: 1,
    //                                     colors: [
    //                                       Color.fromRGBO(102, 19, 255, 0.7),
    //                                       const Color.fromRGBO(
    //                                           117, 114, 255, 0),
    //                                       const Color.fromRGBO(
    //                                           132, 112, 255, 0),
    //                                     ],
    //                                   )
    //                                 : RadialGradient(colors: [
    //                                     Color.fromRGBO(102, 19, 255, 0),
    //                                     const Color.fromRGBO(
    //                                         117, 114, 255, 0),
    //                                     const Color.fromRGBO(
    //                                         132, 112, 255, 0)
    //                                   ])),
    //                         padding: EdgeInsets.only(
    //                             top: 0, bottom: 0, left: 10, right: 10),
    //                         child: Icon(
    //                             Icons.account_balance_wallet_outlined,
    //                             size: 25)),
    //                     label: "Expenses"),
    //                 BottomNavigationBarItem(
    //                     icon: Container(
    //                         decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             gradient: (widget.pageIndex == 3)
    //                                 ? RadialGradient(
    //                                     radius: 1,
    //                                     colors: [
    //                                       Color.fromRGBO(102, 19, 255, 0.7),
    //                                       const Color.fromRGBO(
    //                                           117, 114, 255, 0),
    //                                       const Color.fromRGBO(
    //                                           132, 112, 255, 0),
    //                                     ],
    //                                   )
    //                                 : RadialGradient(colors: [
    //                                     Color.fromRGBO(102, 19, 255, 0),
    //                                     const Color.fromRGBO(
    //                                         117, 114, 255, 0),
    //                                     const Color.fromRGBO(
    //                                         132, 112, 255, 0)
    //                                   ])),
    //                         padding: EdgeInsets.only(
    //                             top: 0, bottom: 0, left: 10, right: 10),
    //                         child:
    //                             Icon(Icons.newspaper_outlined, size: 25)),
    //                     label: "News"),
    //                 // BottomNavigationBarItem(
    //                 //     icon: Container(
    //                 //         decoration: BoxDecoration(
    //                 //             shape: BoxShape.circle,
    //                 //             gradient: (widget.pageIndex == 4)
    //                 //                 ? RadialGradient(
    //                 //                     radius: 1,
    //                 //                     colors: [
    //                 //                       Color.fromRGBO(102, 19, 255, 0.7),
    //                 //                       const Color.fromRGBO(117, 114, 255, 0),
    //                 //                       const Color.fromRGBO(132, 112, 255, 0),
    //                 //                     ],
    //                 //                   )
    //                 //                 : RadialGradient(colors: [
    //                 //                     Color.fromRGBO(102, 19, 255, 0),
    //                 //                     const Color.fromRGBO(117, 114, 255, 0),
    //                 //                     const Color.fromRGBO(132, 112, 255, 0)
    //                 //                   ])),
    //                 //         padding:
    //                 //             EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
    //                 //         child: Icon(Icons.request_quote_outlined, size: 25)),
    //                 //     label: "Taxes"),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // ));
    //
  }
}
