// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, sort_child_properties_last, avoid_unnecessary_containers, unnecessary_new

import 'package:eclipsis/main.dart';
import 'package:eclipsis/models/fdmodel.dart';
import 'package:eclipsis/models/mfmodel.dart';
import 'package:eclipsis/models/mfmodel2.dart';
import 'package:eclipsis/models/mfmodel3.dart';
import 'package:eclipsis/models/remote_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestMFPage extends StatefulWidget {
  const InvestMFPage({super.key});

  @override
  State<InvestMFPage> createState() => _InvestMFPageState();
}

class _InvestMFPageState extends State<InvestMFPage> {

  var selec = 0;
  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
    toolbarHeight: MediaQuery.of(context).size.height / 12,
    //backgroundColor: Colors.white,
    elevation: 0,
          leading: const BackButton(color: Colors.black,),
          title: Text("Eclipse Investings",style: GoogleFonts.ubuntu(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black)),
        ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                child: Stack(
                    children:[
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 0, bottom: 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
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
                                                selec = 0;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              decoration: BoxDecoration(
                                                  border: (selec == 0)
                                                      ? Border(
                                                      bottom: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.blue))
                                                      : Border(
                                                      bottom: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.white))),
                                              child: Text(
                                                "Fixed Deposits",
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 16,
                                                    color: (selec == 0)
                                                        ? Colors.blue
                                                        : Colors.black),
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                                border: (selec == 1)
                                                    ? Border(
                                                    bottom: BorderSide(
                                                        width: 0.5,
                                                        color: Colors.blue))
                                                    : Border(
                                                    bottom: BorderSide(
                                                        width: 0.5,
                                                        color: Colors.white))),
                                            child: Text(
                                              "Mutual Funds",
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 16,
                                                  color: (selec == 1)
                                                      ? Colors.blue
                                                      : Colors.black),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          if (selec == 0) ...[
                            Container(
                                height: MediaQuery.of(context).size.height / 1.25,
                                child: Visibility(
                                  visible: isFD,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: fdlist?.data.length,
                                      itemBuilder: ((context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top: 5, bottom: 5),
                                            height:
                                            MediaQuery.of(context).size.height / 5,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                    width: 0.5, color: Colors.grey)),
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
                                                              "assets/images/bank.png"),
                                                          height: MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                              20),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 10.0),
                                                      child: Text(
                                                          fdlist!.data[index].attributes
                                                              .name,
                                                          style: GoogleFonts.ubuntu(
                                                            fontSize: 18,
                                                          )),
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
                                                              color:
                                                              Colors.grey.shade600,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          fdlist!.data[index].attributes
                                                              .interestRate
                                                              .toString() +
                                                              "%",
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
                                                              color:
                                                              Colors.grey.shade600,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          "₹" +
                                                              fdlist!.data[index]
                                                                  .attributes.minAmount
                                                                  .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: Colors.green,
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color:
                                                          Colors.lightBlue.shade50,
                                                          borderRadius:
                                                          BorderRadius.circular(5)),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            fdlist!
                                                                .data[index]
                                                                .attributes
                                                                .tenureFromInMonths
                                                                .toString(),
                                                            style: GoogleFonts.ubuntu(
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                          Text(
                                                            " Months",
                                                            style: GoogleFonts.ubuntu(
                                                              fontWeight:
                                                              FontWeight.w500,
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
                                        );
                                      })),
                                  replacement: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ))
                          ] else if (selec == 1) ...[
                            Container(
                                height: MediaQuery.of(context).size.height / 1.25,
                                child: Visibility(
                                  visible: isMF,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: 40,
                                      itemBuilder: ((context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Container(
                                            height:
                                            MediaQuery.of(context).size.height / 5,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                    width: 0.5, color: Colors.grey)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
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
                                                                "assets/images/bank.png"),
                                                            height:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                                20),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                            1.5,
                                                        child: Text(
                                                          mfnavlist![index].schemeName,
                                                          style: GoogleFonts.ubuntu(
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight.w500),
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
                                                          Text("Net Asset Val",
                                                              style: GoogleFonts.ubuntu(
                                                                  color: Colors
                                                                      .grey.shade600,
                                                                  fontSize: 12)),
                                                          Text(
                                                              "₹" +
                                                                  mfnavlist![index]
                                                                      .netAssetValue,
                                                              style: GoogleFonts.ubuntu(
                                                                  color: Colors.green,
                                                                  fontSize: 16)),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text("As on",
                                                              style: GoogleFonts.ubuntu(
                                                                  color: Colors
                                                                      .grey.shade600,
                                                                  fontSize: 12)),
                                                          Text(mfnavlist![index].date,
                                                              style: GoogleFonts.ubuntu(
                                                                  color: Colors.green,
                                                                  fontSize: 16)),
                                                        ],
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .lightBlue.shade50,
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                5)),
                                                        child: Column(
                                                          children: [
                                                            Text("Scheme Code",
                                                                style:
                                                                GoogleFonts.ubuntu(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600,
                                                                    fontSize: 10)),
                                                            Text(
                                                                mfnavlist![index]
                                                                    .schemeCode,
                                                                style:
                                                                GoogleFonts.ubuntu(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize: 14)),
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
                                  replacement: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )),
                          ],
                        ],
                      ),
                      Positioned(
                        bottom:0,
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "We do not support investing as of now",
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top:2),
                                        child: Text(
                                          "The app is still in its beta version",
                                          style: GoogleFonts.ubuntu(color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ]
                )),
          ],
        ),
      ),
    );
  }
}