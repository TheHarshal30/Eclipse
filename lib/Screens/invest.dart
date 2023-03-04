// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, annotate_overrides, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart';

import '../models/fdmodel.dart';
import '../models/remote_services.dart';

class InvestPage extends StatefulWidget {
  const InvestPage({super.key});

  @override
  State<InvestPage> createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> {
  FDs? fdlist;
  var isLoaded = false;
  int _index = 0;
  var selected = 1;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    fdlist = (await RemoteService2.getPosts());

    if (fdlist != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Top Investment Opportunities",
            style: GoogleFonts.ubuntu(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          )),
      bottomNavigationBar: GNav(
          textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
          gap: 10,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          padding: EdgeInsets.all(20),
          tabs: [
            GButton(
              icon: Icons.money_sharp,
              text: "Fixed Deposits",
            ),
            GButton(
              icon: Icons.monetization_on,
              text: "Funds",
            )
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10, top: 10),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Visibility(
                        visible: isLoaded,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: (fdlist?.data.length),
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 1,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color:
                                                        Colors.yellow.shade50),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    18,
                                                child: Image(
                                                    image: AssetImage(
                                                        "assets/images/bank.png")),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  fdlist!.data[index].attributes
                                                      .name,
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 18),
                                                ),
                                              )
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8,
                                            top: 20,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Min Amount: ",
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                    Text(
                                                      fdlist!.data[index]
                                                          .attributes.minAmount,
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors.green),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Min tenure: ",
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                    Text(
                                                      fdlist!
                                                          .data[index]
                                                          .attributes
                                                          .tenureFromInMonths
                                                          .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors.green),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Interest Rate: ",
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                    Text(
                                                      fdlist!
                                                              .data[index]
                                                              .attributes
                                                              .interestRate
                                                              .toString() +
                                                          "%",
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors.green),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "SR Interest Rate: ",
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                    Text(
                                                      fdlist!
                                                          .data[index]
                                                          .attributes
                                                          .seniorCitizenInterestRate
                                                          .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors.green),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on String {
  operator >(String other) {
    return double.parse(this) > double.parse(other);
  }

  operator >=(String other) {
    return double.parse(this) >= double.parse(other);
  }

  operator <(String other) {
    return double.parse(this) < double.parse(other);
  }

  operator <=(String other) {
    return double.parse(this) <= double.parse(other);
  }
}
