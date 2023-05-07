// ignore_for_file: prefer_const_constructors

import 'package:app1/models/newsmodel.dart';
import 'package:app1/screens/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../models/newsmodel.dart';

Future getMarket() async {
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

class News2 extends StatefulWidget {
  const News2({super.key});

  @override
  State<News2> createState() => _News2State();
}

class _News2State extends State<News2> {
  var selec = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                                  bottom:
                                      BorderSide(width: 1, color: Colors.blue))
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: (selec == 1)
                            ? Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.blue))
                            : Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.black))),
                    child: Text(
                      "Economy",
                      style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          color: (selec == 1) ? Colors.blue : Colors.white),
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: (selec == 2)
                            ? Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.blue))
                            : Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.black))),
                    child: Text(
                      "Technology",
                      style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          color: (selec == 2) ? Colors.blue : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: PageView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    Container(
                        child: (selec == -1)
                            ? Column(children: [
                                FutureBuilder<dynamic>(
                                    future: getMarket(),
                                    builder:
                                        (context,
                                                AsyncSnapshot<dynamic>
                                                    snapshot) =>
                                            (snapshot.hasData)
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
                                                            .data?.feed.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return GestureDetector(
                                                            onTap: () async {
                                                              var url = Uri
                                                                  .parse(snapshot
                                                                      .data!
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
                                                                            .data!
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
                                                                              .data!
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
                                                                            snapshot.data!.feed[index].title,
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
                                                                            snapshot.data!.feed[index].summary,
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
                                                : CircularProgressIndicator()),
                              ])
                            : Text("helo"));
                  }))
        ],
      )),
    );
  }
}
