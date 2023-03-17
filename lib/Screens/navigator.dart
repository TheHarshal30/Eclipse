// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last


import 'package:eclipsis/Screens/expenses.dart';
import 'package:eclipsis/Screens/homepage.dart';
import 'package:eclipsis/Screens/incometax2.dart';
import 'package:eclipsis/Screens/investmf.dart';
import 'package:eclipsis/Screens/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NavPage extends StatefulWidget {
  int pageIndex;
  int bank;
  NavPage({required this.pageIndex,required this.bank, super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  dynamic username = TextEditingController(text: "Tesla");

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<Widget> widgetlists = [
    HomePage(),
    InvestMFPage(),
    ExpensePage(bank: bank),
    NewsPage(),
    TaxPage(),
  ];
  @override
  Widget build(BuildContext context) {
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Text(
                      "Made with ❤️",
                      style: GoogleFonts.ubuntu(fontSize: 15),
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
          //backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                backgroundImage: AssetImage("assets/images/profile.png")),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, " + username.text + "!",
                  style: GoogleFonts.ubuntu(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  " Great to see you",
                  style: GoogleFonts.ubuntu(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.blue),
          currentIndex: widget.pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              widget.pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/invest2.png"),
                  size: 30,
                ),
                label: "Invest"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/track2.png"),
                  size: 30,
                ),
                label: "Expenses"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/bank.png"),
                  size: 30,
                ),
                label: "News"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/tax.png"),
                  size: 30,
                ),
                label: "Taxes"),
          ],
        ),
        body: Center(
          child: widgetlists[widget.pageIndex],
        ));
  }
}