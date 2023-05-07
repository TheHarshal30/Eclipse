// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_local_variable, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, curly_braces_in_flow_control_structures, avoid_print, annotate_overrides

import 'package:app1/screens/navigator.dart';
import 'package:app1/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import '../models/newsmodel.dart';

import '../models/newsservices.dart';
import 'package:http/http.dart' as http;

Future<News?> getMarket() async {
  var client = http.Client();

  var uri = Uri.parse(
      'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=financial_markets&apikey=ZTF5S6178QWI906O');
  var response = await client.get(uri, headers: {'User-Agent': 'request'});
  if (response.statusCode == 200) {
    var json = response.body;
    return NewsFromJson(json);
  }
  return null;
}

Future<News?> getEconomy() async {
  var client = http.Client();

  var uri = Uri.parse(
      'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=economy_monetary&apikey=ZTF5S6178QWI906O');
  var response = await client.get(uri, headers: {'User-Agent': 'request'});
  if (response.statusCode == 200) {
    var json = response.body;
    return NewsFromJson(json);
  }
  return null;
}

Future<News?> getTech() async {
  var client = http.Client();

  var uri = Uri.parse(
      'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=technology&apikey=ZTF5S6178QWI906O');
  var response = await client.get(uri, headers: {'User-Agent': 'request'});
  if (response.statusCode == 200) {
    var json = response.body;
    return NewsFromJson(json);
  }
  return null;
}

Future<News?> getAll() async {
  var client = http.Client();

  var uri = Uri.parse(
      'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&apikey=ZTF5S6178QWI906O');
  var response = await client.get(uri, headers: {'User-Agent': 'request'});
  if (response.statusCode == 200) {
    var json = response.body;
    return NewsFromJson(json);
  }
  return null;
}

class NewsPage extends StatefulWidget {
  int index = 0;
  NewsPage({super.key, required this.index});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  PageController temp = PageController(initialPage: 0);
  var selec = -1;
  @override
  void initState() {
    super.initState();
    Provider.of<FD>(context, listen: false).getAll();
    //Provider.of<FD>(context, listen: false).getEconomy();
    Provider.of<FD>(context, listen: false).getMarket();
    Provider.of<FD>(context, listen: false).getTech();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => NavPage(
                      pageIndex: 0,
                    )));
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selec = -1;
                        temp.jumpToPage(0);
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: (selec == -1)
                              ? Border(
                                  bottom:
                                      BorderSide(width: 1, color: Colors.blue))
                              : Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black))),
                      child: Text(
                        "All",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            color: (selec == -1) ? Colors.blue : Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selec = 0;
                          temp.jumpToPage(1);
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
                                        width: 1, color: Colors.black))),
                        child: Text(
                          "Markets",
                          style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              color: (selec == 0) ? Colors.blue : Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selec = 1;
                          temp.jumpToPage(2);
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            border: (selec == 1)
                                ? Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.blue))
                                : Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.black))),
                        child: Text(
                          "Tech",
                          style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              color: (selec == 1) ? Colors.blue : Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: PageView.builder(
                      controller: temp,
                      itemCount: 3,
                      onPageChanged: (index) {
                        setState(() {
                          selec = index - 1;
                        });
                      },
                      itemBuilder: (context, index) {
                        return (index == 0)
                            ? Column(children: [
                                Consumer<FD>(
                                    builder: (context, snapshot, _) =>
                                        (snapshot.all != null)
                                            ? Container(
                                                padding: EdgeInsets.all(8),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.20,
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: snapshot
                                                        .all?.feed.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () async {
                                                          var url = Uri.parse(
                                                              snapshot
                                                                  .all!
                                                                  .feed[index]
                                                                  .url);
                                                          if (await canLaunchUrl(
                                                              url)) {
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
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 10),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      186,
                                                                      201,
                                                                      255,
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                if (!Uri.tryParse(snapshot
                                                                        .all!
                                                                        .feed[
                                                                            index]
                                                                        .bannerImage
                                                                        .toString())!
                                                                    .hasAbsolutePath) ...[
                                                                  Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        4,
                                                                    child: Image(
                                                                        image: AssetImage(
                                                                            "assets/images/profile.png")),
                                                                  )
                                                                ] else ...[
                                                                  Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        4,
                                                                    child: Image
                                                                        .network(
                                                                      snapshot
                                                                          .all!
                                                                          .feed[
                                                                              index]
                                                                          .bannerImage
                                                                          .toString(),
                                                                      filterQuality:
                                                                          FilterQuality
                                                                              .high,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      loadingBuilder: (BuildContext context,
                                                                          Widget
                                                                              child,
                                                                          ImageChunkEvent?
                                                                              loadingProgress) {
                                                                        if (loadingProgress ==
                                                                            null) {
                                                                          return child;
                                                                        }
                                                                        return Center(
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            value: loadingProgress.expectedTotalBytes != null
                                                                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
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
                                                                          top:
                                                                              20,
                                                                          bottom:
                                                                              10,
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .all!
                                                                            .feed[index]
                                                                            .title,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color: Colors
                                                                                .white,
                                                                            fontFamily:
                                                                                'AndersonB',
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.only(
                                                                          bottom:
                                                                              10,
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .all!
                                                                            .feed[index]
                                                                            .summary,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color: Colors
                                                                                .grey,
                                                                            fontFamily:
                                                                                'Anderson',
                                                                            fontWeight:
                                                                                FontWeight.w700),
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
                                              )
                                            : Center(
                                                child: Image(
                                                image: AssetImage(
                                                    "assets/images/loading3.gif"),
                                              ))),
                              ])
                            : (index == 1)
                                ? Column(children: [
                                    Consumer<FD>(
                                        builder: (context, snapshot, _) =>
                                            (snapshot.market != null)
                                                ? Container(
                                                    padding: EdgeInsets.all(8),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            1.20,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            BouncingScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: snapshot
                                                            .market
                                                            ?.feed
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return GestureDetector(
                                                            onTap: () async {
                                                              var url = Uri
                                                                  .parse(snapshot
                                                                      .market!
                                                                      .feed[
                                                                          index]
                                                                      .url);
                                                              if (await canLaunchUrl(
                                                                  url)) {
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
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          186,
                                                                          201,
                                                                          255,
                                                                          0.1),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5)),
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (!Uri.tryParse(snapshot
                                                                            .market!
                                                                            .feed[index]
                                                                            .bannerImage
                                                                            .toString())!
                                                                        .hasAbsolutePath) ...[
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            MediaQuery.of(context).size.height /
                                                                                4,
                                                                        child: Image(
                                                                            image:
                                                                                AssetImage("assets/images/profile.png")),
                                                                      )
                                                                    ] else ...[
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            MediaQuery.of(context).size.height /
                                                                                4,
                                                                        child: Image
                                                                            .network(
                                                                          snapshot
                                                                              .market!
                                                                              .feed[index]
                                                                              .bannerImage
                                                                              .toString(),
                                                                          filterQuality:
                                                                              FilterQuality.high,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          loadingBuilder: (BuildContext context,
                                                                              Widget child,
                                                                              ImageChunkEvent? loadingProgress) {
                                                                            if (loadingProgress ==
                                                                                null) {
                                                                              return child;
                                                                            }
                                                                            return Center(
                                                                              child: CircularProgressIndicator(
                                                                                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
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
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          child:
                                                                              Text(
                                                                            snapshot.market!.feed[index].title,
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: 'AndersonB',
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          padding: EdgeInsets.only(
                                                                              bottom: 10,
                                                                              left: 5,
                                                                              right: 5),
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          child:
                                                                              Text(
                                                                            snapshot.market!.feed[index].summary,
                                                                            style: TextStyle(
                                                                                fontSize: 13,
                                                                                color: Colors.grey,
                                                                                fontFamily: 'Anderson',
                                                                                fontWeight: FontWeight.w700),
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
                                                  )
                                                : Center(
                                                    child: Image(
                                                    image: AssetImage(
                                                        "assets/images/loading3.gif"),
                                                  ))),
                                  ])
                                : (index == 2)
                                    ? Column(children: [
                                        Consumer<FD>(
                                            builder: (context, snapshot, _) =>
                                                (snapshot.tech != null)
                                                    ? Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            1.20,
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                BouncingScrollPhysics(),
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: snapshot
                                                                .tech
                                                                ?.feed
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  var url = Uri
                                                                      .parse(snapshot
                                                                          .tech!
                                                                          .feed[
                                                                              index]
                                                                          .url);
                                                                  if (await canLaunchUrl(
                                                                      url)) {
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
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          10),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color.fromRGBO(
                                                                          186,
                                                                          201,
                                                                          255,
                                                                          0.1),
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5)),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        if (!Uri.tryParse(snapshot.tech!.feed[index].bannerImage.toString())!
                                                                            .hasAbsolutePath) ...[
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            height:
                                                                                MediaQuery.of(context).size.height / 4,
                                                                            child:
                                                                                Image(image: AssetImage("assets/images/profile.png")),
                                                                          )
                                                                        ] else ...[
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            height:
                                                                                MediaQuery.of(context).size.height / 4,
                                                                            child:
                                                                                Image.network(
                                                                              snapshot.tech!.feed[index].bannerImage.toString(),
                                                                              filterQuality: FilterQuality.high,
                                                                              fit: BoxFit.cover,
                                                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                                                if (loadingProgress == null) {
                                                                                  return child;
                                                                                }
                                                                                return Center(
                                                                                  child: CircularProgressIndicator(
                                                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                        Column(
                                                                          children: [
                                                                            Container(
                                                                              padding: EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
                                                                              width: MediaQuery.of(context).size.width,
                                                                              child: Text(
                                                                                snapshot.tech!.feed[index].title,
                                                                                style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'AndersonB', fontWeight: FontWeight.w700),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                                                                              width: MediaQuery.of(context).size.width,
                                                                              child: Text(
                                                                                snapshot.tech!.feed[index].summary,
                                                                                style: TextStyle(fontSize: 13, color: Colors.grey, fontFamily: 'Anderson', fontWeight: FontWeight.w700),
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
                                                      )
                                                    : CircularProgressIndicator()),
                                      ])
                                    : Center(
                                        child: Image(
                                        image: AssetImage(
                                            "assets/images/loading3.gif"),
                                      ));
                      }),
                ),
              )
            ],
          ),
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
