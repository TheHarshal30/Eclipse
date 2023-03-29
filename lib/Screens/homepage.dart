// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclipsis/OnBoarding/boardingpage.dart';
import 'package:eclipsis/Screens/investmf.dart';
import 'package:eclipsis/Screens/navigator.dart';
import 'package:eclipsis/Screens/personalfinance.dart';
import 'package:eclipsis/Screens/incometax2.dart';
import 'package:eclipsis/main.dart';
import 'package:eclipsis/models/fdmodel.dart';
import 'package:eclipsis/models/newsmodel.dart';
import 'package:eclipsis/models/newsservices.dart';
import 'package:eclipsis/models/remote_services.dart';
import 'package:eclipsis/pf/chap1.dart';
import 'package:eclipsis/pf/temp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/homeboxes.dart';
import 'expenses.dart';
import 'invest2.dart';
int bank = 0;
int ha = 0;
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController _textFieldController = TextEditingController();

class _HomePageState extends State<HomePage> {
  // News? market;
  // FDs? fdlist;
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
      username = TextEditingController(text:snap['name']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BoardingPage()));
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(2)),
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          backgroundImage:
                          AssetImage("assets/images/logo.png")),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What is Eclipse?",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Understand in 60 seconds.",
                                  style: GoogleFonts.ubuntu(color: Colors.grey),
                                ),
                                Text(
                                  " Get Started",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Eclipse Investings",
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            "Invest in safe places",
                            style: GoogleFonts.ubuntu(color: Colors.grey),
                          )
                        ]),
                    Image(
                        image: AssetImage("assets/images/search.png"),
                        height: MediaQuery.of(context).size.height / 22)
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isFD,
              // ignore: sort_child_properties_last
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Row(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, bottom: 20),
                              child: Card(
                                elevation: 1,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  width:
                                  MediaQuery.of(context).size.width / 1.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.yellow.shade50,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              //  border: Border.all(color: Colors.black, width: 1)
                                            ),
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/images/invest.png"),
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    20),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    fdlist!.data[index]
                                                        .attributes.name,
                                                    style: GoogleFonts.ubuntu(
                                                      fontSize: 18,
                                                    )),
                                                Text(
                                                  "Type: Fixed Deposit",
                                                  style: GoogleFonts.ubuntu(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Interest Rate",
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.grey.shade600,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                "${fdlist!.data[index].attributes.interestRate}%",
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.green,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Min Amount",
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.grey.shade600,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                "₹${fdlist!.data[index].attributes.minAmount}",
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.green,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.lightBlue.shade50,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: Row(
                                              children: [
                                                Text(
                                                  fdlist!.data[index].attributes
                                                      .tenureFromInMonths
                                                      .toString(),
                                                  style: GoogleFonts.ubuntu(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  " Months",
                                                  style: GoogleFonts.ubuntu(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20.0, left: 8, right: 8),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                              Border.all(width: 0.5, color: Colors.grey)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Looking for more options,\ndifferent rates, returns?",
                                        style:
                                        GoogleFonts.ubuntu(fontSize: 17)),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => InvestMFPage()),
                                          );
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(top: 15.0),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.blue)),
                                          child: Text(
                                            "Explore All ",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                color: Colors.blue),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/income.png"),
                                      height:
                                      MediaQuery.of(context).size.height /
                                          12,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (() {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => (Swipe())));
                    }),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 5),
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 10, left: 20, top: 20, bottom: 20),
                        color: Colors.blueGrey.shade50,
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "Introducing Eclipse Education",
                                style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "A list of articles made using blogs and reasearch papers by Personal Finance Experts",
                                    style:
                                    GoogleFonts.ubuntu(color: Colors.grey),
                                  ),
                                ),
                                Image(
                                  image: AssetImage("assets/images/learn2.png"),
                                  height:
                                  MediaQuery.of(context).size.height / 12,
                                ),
                              ],
                            ),
                            Text(
                              "Start Learning",
                              style: GoogleFonts.ubuntu(color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Uri url =
                      Uri(scheme: "https", host: "eclipse-edu.netlify.app");

                      if (!await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 10, left: 20, top: 20, bottom: 20),
                        color: Colors.blueGrey.shade50,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "Want to write for Eclipse?",
                                style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "We invite people from all over the globe to write about personal finance,etc",
                                    style:
                                    GoogleFonts.ubuntu(color: Colors.grey),
                                  ),
                                ),
                                Image(
                                  image: AssetImage("assets/images/learn2.png"),
                                  height:
                                  MediaQuery.of(context).size.height / 12,
                                ),
                              ],
                            ),
                            Text(
                              "Start Writing",
                              style: GoogleFonts.ubuntu(color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Eclipse News Flash",
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Text(
                            "Read top news on the go",
                            style: GoogleFonts.ubuntu(color: Colors.grey),
                          )
                        ]),
                    Image(
                        image: AssetImage("assets/images/newsflash.png"),
                        height: MediaQuery.of(context).size.height / 22)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10,bottom: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5)),
                            height: MediaQuery.of(context).size.height / 2.8,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                                child: Text(
                                  "All Finance Headlines",
                                  style: GoogleFonts.ubuntu( fontSize: 17),
                                ),
                              ),
                              Visibility(
                                visible: nAll,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height:
                                  MediaQuery.of(context).size.height / 2.2,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: all?.feed.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () async {
                                            var url =
                                            Uri.parse(all!.feed[index].url);
                                            if (await canLaunchUrl(url)) {
                                              await launchUrl(
                                                url,
                                                mode: LaunchMode
                                                    .externalApplication,
                                              );
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(),
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 0.2,
                                                    color: Colors.black,
                                                  )
                                                )
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        EdgeInsets.only(),
                                                        width: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .width,
                                                        child: Text(
                                                          all!.feed[index]
                                                              .title,
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Source: ",
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                                color: Colors
                                                                    .grey,
                                                                fontSize:
                                                                12),
                                                          ),
                                                          Text(
                                                              all!.feed[index]
                                                                  .source,
                                                              style: GoogleFonts
                                                                  .ubuntu(
                                                                  fontSize:
                                                                  12,
                                                                  color: Colors
                                                                      .grey)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                replacement: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: MediaQuery.of(context).size.height / 2.8,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0,bottom: 5),
                                  child: Text(
                                    "Market Headlines",
                                    style: GoogleFonts.ubuntu( fontSize: 17),
                                  ),
                                ),
                                Visibility(
                                  visible: nMar,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    height: MediaQuery.of(context).size.height /
                                        2.2,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: market?.feed.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              var url = Uri.parse(
                                                  market!.feed[index].url);
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(
                                                  url,
                                                  mode: LaunchMode
                                                      .externalApplication,
                                                );
                                              } else {
                                                throw 'Could not launch $url';
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  border: Border(
                                                      bottom: BorderSide(
                                                        width: 0.2,
                                                        color: Colors.black,
                                                      )
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                          EdgeInsets.only(),
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width,
                                                          child: Text(
                                                            market!.feed[index]
                                                                .title,
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                                fontSize:
                                                                14,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Source: ",
                                                              style: GoogleFonts
                                                                  .ubuntu(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                  12),
                                                            ),
                                                            Text(
                                                                market!
                                                                    .feed[index]
                                                                    .source,
                                                                style: GoogleFonts.ubuntu(
                                                                    fontSize:
                                                                    12,
                                                                    color: Colors
                                                                        .grey)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  replacement: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: MediaQuery.of(context).size.height / 2.8,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0,bottom: 5),
                                  child: Text(
                                    "Economy Headlines",
                                    style: GoogleFonts.ubuntu( fontSize: 17),
                                  ),
                                ),
                                Visibility(
                                  visible: nEco,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    height: MediaQuery.of(context).size.height /
                                        2.2,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: economy?.feed.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              var url = Uri.parse(
                                                  economy!.feed[index].url);
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(
                                                  url,
                                                  mode: LaunchMode
                                                      .externalApplication,
                                                );
                                              } else {
                                                throw 'Could not launch $url';
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  border: Border(
                                                      bottom: BorderSide(
                                                        width: 0.2,
                                                        color: Colors.black,
                                                      )
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                          EdgeInsets.only(),
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width,
                                                          child: Text(
                                                            economy!.feed[index]
                                                                .title,
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                                fontSize:
                                                                14,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Source: ",
                                                              style: GoogleFonts
                                                                  .ubuntu(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                  12),
                                                            ),
                                                            Text(
                                                                economy!
                                                                    .feed[index]
                                                                    .source,
                                                                style: GoogleFonts.ubuntu(
                                                                    fontSize:
                                                                    12,
                                                                    color: Colors
                                                                        .grey)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  replacement: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: MediaQuery.of(context).size.height / 2.8,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0,bottom: 5),
                                  child: Text(
                                    "Technology Headlines",
                                    style: GoogleFonts.ubuntu( fontSize: 17),
                                  ),
                                ),
                                Visibility(
                                  visible: nTech,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    height: MediaQuery.of(context).size.height /
                                        2.2,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: tech?.feed.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              var url = Uri.parse(
                                                  tech!.feed[index].url);
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(
                                                  url,
                                                  mode: LaunchMode
                                                      .externalApplication,
                                                );
                                              } else {
                                                throw 'Could not launch $url';
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  border: Border(
                                                      bottom: BorderSide(
                                                        width: 0.2,
                                                        color: Colors.black,
                                                      )
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                          EdgeInsets.only(),
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width,
                                                          child: Text(
                                                            tech!.feed[index]
                                                                .title,
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                                fontSize:
                                                                14,
                                                               ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Source: ",
                                                              style: GoogleFonts
                                                                  .ubuntu(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                  12),
                                                            ),
                                                            Text(
                                                                tech!
                                                                    .feed[index]
                                                                    .source,
                                                                style: GoogleFonts.ubuntu(
                                                                    fontSize:
                                                                    12,
                                                                    color: Colors
                                                                        .grey)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  replacement: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              ])),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
