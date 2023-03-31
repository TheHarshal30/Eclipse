import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclipsis/Screens/expenses.dart';
import 'package:eclipsis/Screens/homepage.dart';
import 'package:eclipsis/Screens/incometax2.dart';
import 'package:eclipsis/Screens/investmf.dart';
import 'package:eclipsis/Screens/news.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eclipsis/main.dart';

class NavPage extends StatefulWidget {
  int pageIndex;
  int bank;
  NavPage({required this.pageIndex,required this.bank, super.key});
  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  dynamic username = TextEditingController(text: "User");
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<Widget> widgetlists = [
    HomePage(),
    ExpensePage(bank: bank),
    NewsPage(),
    TaxPage(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        key: scaffoldKey,
        endDrawer: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: SafeArea(
            child: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            backgroundImage:
                            AssetImage("assets/images/profile.png")),
                      ),
                      Text(
                        username.text,
                        style: GoogleFonts.ubuntu(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Uri url = Uri(
                                    scheme: "https",
                                    host: "insidelibrary.weebly.com");

                                if (!await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                )) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              child: Row(children: [
                                Icon(
                                  Icons.info_rounded,
                                  size: 18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "About us",
                                    style: GoogleFonts.ubuntu(fontSize: 18),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20),
                        child: Column(
                          children: [
                            Row(children: [
                              Icon(
                                Icons.person,
                                size: 18,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width / 2,
                                    child: ExpansionTile(
                                      title: Text("Change Username",
                                          style:
                                          GoogleFonts.ubuntu(fontSize: 15)),
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(0),
                                          height: MediaQuery.of(context)
                                              .size
                                              .height /
                                              15,
                                          child: TextField(
                                            controller: username,
                                            decoration: InputDecoration(
                                                hintText: "Username",
                                                hintStyle: GoogleFonts.ubuntu(),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 0.5,
                                                        color:
                                                        Colors.black))),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),

                            ]),
                            FutureBuilder(
                                future: FirebaseFirestore.instance.collection("version").doc("version").get(),
                                builder: (context, snapshot) {
                                  if(snapshot.hasData){
                                    Map<String, dynamic>? temp2 = snapshot.data!.data();
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 30.0, left: 20),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: ()   {
                                              if(temp2?["version"].toString() != version.toString()){
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text("New upadte available"),
                                                      actions: [
                                                        ElevatedButton(
                                                          child: Text("Install Now!"),
                                                          onPressed: () async {
                                                            Uri url = Uri(
                                                                scheme: "https",
                                                                host: temp2?["download"]);
                                                            if (!await launchUrl(
                                                              url,
                                                              mode: LaunchMode.externalApplication,
                                                            )) {
                                                              throw Exception('Could not launch $url');
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                              else{
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Dialog(
                                                      child: Container(
                                                        height: MediaQuery.of(context).size.height/10,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text("No new updates!")
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            child: Row(children: [
                                              Icon(
                                                Icons.update,
                                                size: 20,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0),
                                                child: Text(
                                                  "Check for Updates",
                                                  style: GoogleFonts.ubuntu(fontSize: 18),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  else{
                                    return Text("Loading...");
                                  }
                                }
                              /*child: ,*/
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Column(
                      children: [
                        Text(
                          "Made with ❤️",
                          style: GoogleFonts.ubuntu(fontSize: 15),
                        ),
                        Text(
                          "Version $version",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Backed by Inside Labs",
                            style: GoogleFonts.ubuntu(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ))
          ],
          toolbarHeight: MediaQuery.of(context).size.height / 12,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                backgroundImage:  NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.pageIndex == 0) ...[
                  Text(
                    "Hello, " + username.text + "!",
                    style: GoogleFonts.ubuntu(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ]else if (widget.pageIndex == 1) ...[
                  Text(
                    "Eclipse Tracking",
                    style: GoogleFonts.ubuntu(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ] else if (widget.pageIndex == 2) ...[
                  Text(
                    "Eclipse News",
                    style: GoogleFonts.ubuntu(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ] else if (widget.pageIndex == 3) ...[
                  Text(
                    "Eclipse Taxes",
                    style: GoogleFonts.ubuntu(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.blue),
          currentIndex: widget.pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              widget.pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_outlined, size: 30),
                label: "Expenses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_outlined, size: 30), label: "News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.request_quote_outlined, size: 30),
                label: "Taxes"),
          ],
        ),
        body: Center(
          child: widgetlists[widget.pageIndex],
        ));
  }
}