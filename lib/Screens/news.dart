// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_local_variable, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, curly_braces_in_flow_control_structures, avoid_print, annotate_overrides

import 'package:eclipsis/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/newsmodel.dart';

import '../models/newsservices.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // News? market;
  // News? economy;
  // News? tech;
  // News? all;

  var selec = -1;
  // var isLoaded = false;
  // var isLoaded1 = false;
  // var isLoaded2 = false;
  // var isLoaded3 = false;
  @override
  void initState() {
    super.initState();
    // getData();
    // getData1();
    // getData2();
    // getData3();
  }

  // getData() async {
  //   market = (await NewServiceMarket.getPosts()) as News?;
  //   print("Hello");
  //   print(market);
  //   if (market != null) {
  //     print(market);
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }
  //
  // getData1() async {
  //   economy = (await NewServiceEconomy.getPosts()) as News?;
  //   print("Hello");
  //   print(economy);
  //   if (economy != null) {
  //     print(economy);
  //     setState(() {
  //       isLoaded1 = true;
  //     });
  //   }
  // }
  //
  // getData2() async {
  //   tech = (await NewServiceTech.getPosts()) as News?;
  //   print("Hello");
  //   print(tech);
  //   if (tech != null) {
  //     print(tech);
  //     setState(() {
  //       isLoaded2 = true;
  //     });
  //   }
  // }
  //
  // getData3() async {
  //   all = (await NewServiceAll.getPosts()) as News?;
  //   print("Hello");
  //   print(all);
  //   if (all != null) {
  //     print(all);
  //     setState(() {
  //       isLoaded3 = true;
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selec = -1;
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            border: (selec == -1)
                                ? Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.blue))
                                : Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.white))),
                        child: Text(
                          "All",
                          style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              color:
                              (selec == -1) ? Colors.blue : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selec = 0;
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            border: (selec == 0)
                                ? Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.blue))
                                : Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.white))),
                        child: Text(
                          "Markets",
                          style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              color: (selec == 0) ? Colors.blue : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selec = 1;
                      });
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: (selec == 1)
                              ? Border(
                              bottom:
                              BorderSide(width: 1, color: Colors.blue))
                              : Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.white))),
                      child: Text(
                        "Economy",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            color: (selec == 1) ? Colors.blue : Colors.black),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selec = 2;
                      });
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: (selec == 2)
                              ? Border(
                              bottom:
                              BorderSide(width: 1, color: Colors.blue))
                              : Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.white))),
                      child: Text(
                        "Technology",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            color: (selec == 2) ? Colors.blue : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (selec == -1) ...[
              Column(children: [
                Visibility(
                  visible: isFD,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 1.20,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: all?.feed.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              var url = Uri.parse(all!.feed[index].url);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade400)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (!Uri.tryParse(all!
                                        .feed[index].bannerImage
                                        .toString())!
                                        .hasAbsolutePath) ...[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height /
                                            4,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/profile.png")),
                                      )
                                    ] else ...[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height /
                                            4,
                                        child: Image.network(
                                          all!.feed[index].bannerImage
                                              .toString(),
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
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
                                    ],
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              bottom: 10,
                                              left: 5,
                                              right: 5),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Text(
                                            all!.feed[index].title,
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              bottom: 10, left: 5, right: 5),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Text(
                                            all!.feed[index].summary,
                                            style: GoogleFonts.ubuntu(
                                                color: Colors.grey),
                                          ),
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
              ])
            ] else if (selec == 0) ...[
              Column(children: [
                Visibility(
                  visible: isFD,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 1.20,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: market?.feed.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              var url = Uri.parse(market!.feed[index].url);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade300)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (market!.feed[index].bannerImage ==
                                        null) ...[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height /
                                            4,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/profile.png")),
                                      )
                                    ] else ...[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height /
                                            4,
                                        child: Image.network(
                                          market!.feed[index].bannerImage
                                              .toString(),
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
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
                                    ],
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              bottom: 10,
                                              left: 5,
                                              right: 5),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Text(
                                            market!.feed[index].title,
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              bottom: 10, left: 5, right: 5),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Text(
                                            market!.feed[index].summary,
                                            style: GoogleFonts.ubuntu(
                                                color: Colors.grey),
                                          ),
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
              ])
            ] else if (selec == 1) ...[
              Column(children: [
                Visibility(
                  visible: isFD,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 1.20,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: economy?.feed.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              var url = Uri.parse(economy!.feed[index].url);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade300)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (economy!.feed[index].bannerImage ==
                                        null) ...[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height /
                                            5,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/profile.png")),
                                      )
                                    ] else ...[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height /
                                            5,
                                        child: Image.network(
                                          economy!.feed[index].bannerImage
                                              .toString(),
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
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
                                    ],
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              bottom: 10,
                                              left: 5,
                                              right: 5),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Text(
                                            economy!.feed[index].title,
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              bottom: 10, left: 5, right: 5),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Text(
                                            economy!.feed[index].summary,
                                            style: GoogleFonts.ubuntu(
                                                color: Colors.grey),
                                          ),
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
              ])
            ] else if (selec == 2) ...[
              Column(children: [
                Visibility(
                  visible: isFD,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 1.20,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: tech?.feed.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              var url = Uri.parse(tech!.feed[index].url);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade300)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (tech!.feed[index].bannerImage ==
                                        null) ...[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height /
                                            5,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/profile.png")),
                                      )
                                    ] else ...[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height /
                                            5,
                                        child: Image.network(
                                          tech!.feed[index].bannerImage
                                              .toString(),
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
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
                                    ],
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              bottom: 10,
                                              left: 5,
                                              right: 5),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Text(
                                            tech!.feed[index].title,
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              bottom: 10, left: 5, right: 5),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Text(
                                            tech!.feed[index].summary,
                                            style: GoogleFonts.ubuntu(
                                                color: Colors.grey),
                                          ),
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
              ])
            ]
          ],
        ),
      ),
    );
  }
}
/* Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.network((market!
                                          .feed[index].bannerImage !=
                                      null)
                                  ? market!.feed[index].bannerImage.toString()
                                  : "https://corp.smartbrief.com/wp-content/uploads/2020/07/AdobeStock_331489342-scaled.jpeg"),
                            ),
                           */
/*Text(
                              market!.feed[index].summary,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 15, color: Colors.grey),
                            )*/