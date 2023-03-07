// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclipsis/Screens/investmf.dart';
import 'package:eclipsis/Screens/personalfinance.dart';
import 'package:eclipsis/Screens/incometax2.dart';
import 'package:eclipsis/pf/chap1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/homeboxes.dart';
import 'expenses.dart';
import 'invest2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController _textFieldController = TextEditingController();

class _HomePageState extends State<HomePage> {
  dynamic username = TextEditingController(text: "User");
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String name = '';
  @override
  void initState() {
getperms();
    initialize();
    super.initState();
  }

  void getperms()async{
    var status = await Permission.sms.status;
    await Permission.sms.request();
    if (status.isDenied) {
     await Permission.sms.request();
    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
  }
  void initialize() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      name = snap['name'];
    });
  }

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
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: ExpansionTile(
                                    title: Text("Change Username",
                                        style:
                                            GoogleFonts.ubuntu(fontSize: 15)),
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15,
                                        child: TextField(
                                          controller: username,
                                          onChanged: (value){
                                            setState(() {
                                              name = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Username",
                                              hintStyle: GoogleFonts.ubuntu(),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 0.5,
                                                      color: Colors.black))),
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
                  child: Column(
                    children: [
                      Text(
                        "Made with ❤️",
                        style: GoogleFonts.ubuntu(fontSize: 15),
                      ),
                      Text("Version 1.0.0", style: GoogleFonts.ubuntu(fontSize:12, color: Colors.grey),)
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ],
        toolbarHeight: MediaQuery.of(context).size.height / 10,
        //backgroundColor: Colors.white,
        elevation: 0,

        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile.png")),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name.length<9?
                Text(
                  "Hello, " + name,
                  style: GoogleFonts.ubuntu(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ): Text(
                  "Hello, " + name.substring(0,9)+"..",
                  style: GoogleFonts.ubuntu(
                      fontSize: 25,
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
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //INTRODUCING ECLIPSE OR A VIDEO
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10.0, left: 20, right: 20, top: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(189, 217, 191, 0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(3, 8, 22, 1)),
                        child: Text(
                          "Welcome",
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Eclipse",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Learn Investing, \n Track your Expenses, \n Invest and create wealth.",
                                    style: GoogleFonts.alegreya(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100),
                                  ),
                                )
                              ],
                            ),
                            Image(
                              image: AssetImage("assets/images/course.png"),
                              height: MediaQuery.of(context).size.height / 9,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),


              // MAIN CONTENT
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("More on Eclipse",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16, fontWeight: FontWeight.w700))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InvestMFPage()));
                      }),
                      child: Boxes(
                          boxTitle: "Invest Money",
                          boxSubTitle: "Mutual Funds,FDs",
                          boxColor1: Colors.grey.shade300,
                          boxColor2: Colors.grey.shade400,
                          imgColor: Colors.red.shade100,
                          boxImage: AssetImage("assets/images/invest2.png")),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ExpensePage()));
                      }),
                      child: Boxes(
                          boxTitle: "Expenses",
                          boxSubTitle: "Automated expense tracking",
                          boxColor1: Colors.grey.shade300,
                          boxColor2: Colors.grey.shade400,
                          imgColor: Colors.green.shade100,
                          boxImage: AssetImage("assets/images/track2.png")),
                    ),
                  ),
                  GestureDetector(
                    onTap:(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>Chap1()));
                    }),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                      child: Boxes(
                          boxTitle: "Learn Investing",
                          boxSubTitle: "Read articles by Fintech experts",
                          boxColor1: Colors.grey.shade300,
                          boxColor2: Colors.grey.shade400,
                          imgColor: Colors.orange.shade100,
                          boxImage: AssetImage("assets/images/learn2.png")),
                    ),
                  ),
                  GestureDetector(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>TaxPage()));
                      }),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                      child: Boxes(
                          boxTitle: "Income Tax",
                          boxSubTitle: "See your taxable income",
                          boxColor1: Colors.grey.shade300,
                          boxColor2: Colors.grey.shade400,
                          imgColor: Colors.blue.shade100,
                          boxImage: AssetImage("assets/images/tax.png")),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
