// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace


import 'package:eclipsis/Screens/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:timeline_tile/timeline_tile.dart';


class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  late int index;
  final List<ContentConfig> onboardingPagesList = [
    ContentConfig(
        marginTitle: EdgeInsets.only(top: 20),
        widgetTitle: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Eclipse Investings",
                    style: GoogleFonts.ubuntu(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                afterLineStyle: LineStyle(thickness: 2.0),
                                isFirst: true,
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Find best investment opportunities to invest in and grow your personal finance",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                beforeLineStyle: LineStyle(thickness: 2),
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                afterLineStyle: LineStyle(thickness: 2.0),
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Looking for Guaranteed rate of return or the potential for higher returns? We've got you covered ",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                beforeLineStyle: LineStyle(thickness: 2),
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                isLast: true,
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Explore our hand-picked selection and start investing in your financial future today!.",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image(
                        image: AssetImage("assets/images/ob1.png"),
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        })),
    ContentConfig(
        marginTitle: EdgeInsets.only(top: 20),
        widgetTitle: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Eclipse Tracking",
                    style: GoogleFonts.ubuntu(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                afterLineStyle: LineStyle(thickness: 2.0),
                                isFirst: true,
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Say goodbye to manual expense tracking with our automatic expense tracking feature!",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                beforeLineStyle: LineStyle(thickness: 2),
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                afterLineStyle: LineStyle(thickness: 2.0),
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Eclipse will generate a monthly expense list for you, making it easy to stay on top of your spending",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                beforeLineStyle: LineStyle(thickness: 2),
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                isLast: true,
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "With a clear picture of where your money is going each month, you'll be able to make more informed decisions about your finances.",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image(
                        image: AssetImage("assets/images/ob2.png"),
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        })),
    ContentConfig(
        marginTitle: EdgeInsets.only(top: 20),
        widgetTitle: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Eclipse News",
                    style: GoogleFonts.ubuntu(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                afterLineStyle: LineStyle(thickness: 2.0),
                                isFirst: true,
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Stay up-to-date with the latest news from the world of business and technology with our news feature",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                beforeLineStyle: LineStyle(thickness: 2),
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                afterLineStyle: LineStyle(thickness: 2.0),
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Get the latest updates on market trends, economic developments, and technological innovations, all in one place.",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                beforeLineStyle: LineStyle(thickness: 2),
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                isLast: true,
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Swipe through the headlines and read the full stories to stay informed and make informed decisions.",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image(
                        image: AssetImage("assets/images/ob3.png"),
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        })),
    ContentConfig(
        marginTitle: EdgeInsets.only(top: 20),
        widgetTitle: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Eclipse Taxes",
                    style: GoogleFonts.ubuntu(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                afterLineStyle: LineStyle(thickness: 2.0),
                                isFirst: true,
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Take the guesswork out of your tax calculations with our advanced tax calculator",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                beforeLineStyle: LineStyle(thickness: 2),
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                afterLineStyle: LineStyle(thickness: 2.0),
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Calculate your tax liability, deductions, and credits, so you can plan your finances with confidence.",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TimelineTile(
                                beforeLineStyle: LineStyle(thickness: 2),
                                indicatorStyle: IndicatorStyle(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height:
                                  MediaQuery.of(context).size.width / 10,
                                  indicator: Image(
                                    image:
                                    AssetImage("assets/images/income.png"),
                                  ),
                                ),
                                isLast: true,
                                alignment: TimelineAlign.manual,
                                lineXY: 0.05,
                                endChild: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0, top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 8, right: 8),
                                        child: Text(
                                          "Our intuitive interface makes it easy to enter your information and get accurate results quickly.",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.grey.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image(
                        image: AssetImage("assets/images/ob4.png"),
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        })),
  ];
  @override
  void initState() {
    super.initState();
    index = 0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroSlider(
          key: UniqueKey(),
          isShowSkipBtn: false,
          isShowPrevBtn: false,
          autoScrollInterval: Duration(seconds: 10),
          isAutoScroll: true,
          listContentConfig: onboardingPagesList,
          isShowDoneBtn: true,
          onDonePress: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => NavPage(
                    pageIndex: 0, bank: 0,
                  ),
                ),
                    (Route<dynamic> route) => false);
          },
        ));
  }
}