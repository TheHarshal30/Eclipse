// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Monthly extends StatefulWidget {
  List<dynamic> jan;
  List<dynamic> feb;
  List<dynamic> mar;
  List<dynamic> apr;
  List<dynamic> may;
  List<dynamic> june;
  List<dynamic> july;
  List<dynamic> august;
  List<dynamic> september;
  List<dynamic> october;
  List<dynamic> november;
  List<dynamic> december;
  double janx;
  double febx;
  double marx;
  double mayx;
  double aprx;
  double junex;
  double julyx;
  double augustx;
  double septx;
  double octx;
  double novx;
  double decx;
  Monthly(
      {Key? key,
      required this.december,
      required this.november,
      required this.october,
      required this.september,
      required this.august,
      required this.july,
      required this.june,
      required this.may,
      required this.apr,
      required this.mar,
      required this.feb,
      required this.jan,
      required this.janx,
      required this.febx,
      required this.marx,
      required this.mayx,
      required this.aprx,
      required this.junex,
      required this.julyx,
      required this.augustx,
      required this.septx,
      required this.octx,
      required this.novx,
      required this.decx})
      : super(key: key);
  @override
  State<Monthly> createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white)),
          elevation: 0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Monthly',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(186, 201, 255, 1),
              fontFamily: 'AndersonB',
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(
              controller: _controller,
              itemCount: 12,
              itemBuilder: (contex, index) {
                return Container(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Text(
                                (index == 0)
                                    ? "January"
                                    : (index == 1)
                                        ? "February"
                                        : (index == 2)
                                            ? "March"
                                            : (index == 3)
                                                ? "April"
                                                : (index == 4)
                                                    ? "May"
                                                    : (index == 5)
                                                        ? "June"
                                                        : (index == 6)
                                                            ? "July"
                                                            : (index == 7)
                                                                ? "August"
                                                                : (index == 8)
                                                                    ? "September"
                                                                    : (index ==
                                                                            9)
                                                                        ? "October"
                                                                        : (index ==
                                                                                10)
                                                                            ? "November"
                                                                            : "December",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'AndersonB'),
                              ),
                              index == 0
                                  ? Text(
                                      "(${(widget.janx.abs().toStringAsFixed(3))})",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Neo'),
                                    )
                                  : index == 1
                                      ? Text(
                                          "(${widget.febx.abs().toStringAsFixed(3)})",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Neo'),
                                        )
                                      : index == 2
                                          ? Text(
                                              "(${widget.marx.abs().toStringAsFixed(3)})",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Neo'),
                                            )
                                          : index == 3
                                              ? Text(
                                                  "(${widget.aprx.abs().toStringAsFixed(3)})",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Neo'),
                                                )
                                              : index == 4
                                                  ? Text(
                                                      "(${widget.mayx.abs().toStringAsFixed(3)})",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontFamily: 'Neo'),
                                                    )
                                                  : index == 5
                                                      ? Text(
                                                          "(${widget.junex.abs().toStringAsFixed(3)})",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Neo'),
                                                        )
                                                      : index == 6
                                                          ? Text(
                                                              "(${widget.julyx.abs().toStringAsFixed(3)})",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'Neo'),
                                                            )
                                                          : index == 7
                                                              ? Text(
                                                                  "(${widget.augustx.abs().toStringAsFixed(3)})",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Neo'),
                                                                )
                                                              : index == 8
                                                                  ? Text(
                                                                      "(${widget.septx.abs().toStringAsFixed(3)})",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              'Neo'),
                                                                    )
                                                                  : index == 9
                                                                      ? Text(
                                                                          "(${widget.octx.abs().toStringAsFixed(3)})",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 16,
                                                                              fontFamily: 'Neo'),
                                                                        )
                                                                      : index ==
                                                                              10
                                                                          ? Text(
                                                                              "(${widget.novx.abs().toStringAsFixed(3)})",
                                                                              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Neo'),
                                                                            )
                                                                          : index == 11
                                                                              ? Text(
                                                                                  "(${widget.decx.abs().toStringAsFixed(3)})",
                                                                                  style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Neo'),
                                                                                )
                                                                              : Divider()
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 10),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 1.2,
                            child: index == 0
                                ? ListView.builder(
                                    itemCount: (widget.jan.length).toInt(),
                                    itemBuilder: (context, i) {
                                      var p = widget.jan[i];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.10,
                                          decoration: BoxDecoration(
                                            /*border: Border.all(width: 1.5, color: Colors.black),*/
                                            color: Color.fromRGBO(
                                                186, 201, 255, 0.1),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            top: 8,
                                                            bottom: 8),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            186, 201, 255, 0.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        //  border: Border.all(color: Colors.black, width: 1)
                                                      ),
                                                      child: Image(
                                                          image: AssetImage(
                                                              "assets/images/rupee.jpg"),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              40),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            bottom: 8,
                                                            top: 8),
                                                    child: p < 0
                                                        ? Text('Debited',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Anderson',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700))
                                                        : Text("Credited",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Anderson',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: p < 0
                                                    ? Text(
                                                        "- ₹${p.abs().toStringAsFixed(2)}",
                                                        // 'check',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.red,
                                                          fontFamily:
                                                              'AndersonB',
                                                        ),
                                                      )
                                                    : Text(
                                                        "+ ₹${p.toStringAsFixed(2)}",
                                                        // 'check',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.green,
                                                          fontFamily:
                                                              'AndersonB',
                                                        ),
                                                      ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                : index == 1
                                    ? ListView.builder(
                                        itemCount: (widget.feb.length).toInt(),
                                        itemBuilder: (context, i) {
                                          var p = widget.feb[i];
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.10,
                                              decoration: BoxDecoration(
                                                /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                color: Color.fromRGBO(
                                                    186, 201, 255, 0.1),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20.0,
                                                                top: 8,
                                                                bottom: 8),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    186,
                                                                    201,
                                                                    255,
                                                                    0.2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            //  border: Border.all(color: Colors.black, width: 1)
                                                          ),
                                                          child: Image(
                                                              image: AssetImage(
                                                                  "assets/images/rupee.jpg"),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  40),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20,
                                                                bottom: 8,
                                                                top: 8),
                                                        child: p < 0
                                                            ? Text('Debited',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Anderson',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700))
                                                            : Text("Credited",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Anderson',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: p < 0
                                                        ? Text(
                                                            "- ₹${p.abs().toStringAsFixed(2)}",
                                                            // 'check',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.red,
                                                              fontFamily:
                                                                  'AndersonB',
                                                            ),
                                                          )
                                                        : Text(
                                                            "+ ₹${p.toStringAsFixed(2)}",
                                                            // 'check',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.green,
                                                              fontFamily:
                                                                  'AndersonB',
                                                            ),
                                                          ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                    : index == 2
                                        ? ListView.builder(
                                            itemCount:
                                                (widget.mar.length).toInt(),
                                            itemBuilder: (context, i) {
                                              var p = widget.mar[i];
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      10,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.10,
                                                  decoration: BoxDecoration(
                                                    /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                    color: Color.fromRGBO(
                                                        186, 201, 255, 0.1),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20.0,
                                                                    top: 8,
                                                                    bottom: 8),
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        186,
                                                                        201,
                                                                        255,
                                                                        0.2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                //  border: Border.all(color: Colors.black, width: 1)
                                                              ),
                                                              child: Image(
                                                                  image: AssetImage(
                                                                      "assets/images/rupee.jpg"),
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      40),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20,
                                                                    bottom: 8,
                                                                    top: 8),
                                                            child: p < 0
                                                                ? Text('Debited',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Anderson',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700))
                                                                : Text(
                                                                    "Credited",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Anderson',
                                                                        fontWeight:
                                                                            FontWeight.w700)),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: p < 0
                                                            ? Text(
                                                                "- ₹${p.abs().toStringAsFixed(2)}",
                                                                // 'check',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .red,
                                                                  fontFamily:
                                                                      'AndersonB',
                                                                ),
                                                              )
                                                            : Text(
                                                                "+ ₹${p.toStringAsFixed(2)}",
                                                                // 'check',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .green,
                                                                  fontFamily:
                                                                      'AndersonB',
                                                                ),
                                                              ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })
                                        : index == 3
                                            ? ListView.builder(
                                                itemCount:
                                                    (widget.apr.length).toInt(),
                                                itemBuilder: (context, i) {
                                                  var p = widget.apr[i];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              10,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.10,
                                                      decoration: BoxDecoration(
                                                        /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                        color: Color.fromRGBO(
                                                            186, 201, 255, 0.1),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20.0,
                                                                        top: 8,
                                                                        bottom:
                                                                            8),
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            186,
                                                                            201,
                                                                            255,
                                                                            0.2),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    //  border: Border.all(color: Colors.black, width: 1)
                                                                  ),
                                                                  child: Image(
                                                                      image: AssetImage(
                                                                          "assets/images/rupee.jpg"),
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          40),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        bottom:
                                                                            8,
                                                                        top: 8),
                                                                child: p < 0
                                                                    ? Text(
                                                                        'Debited',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color: Colors
                                                                                .white,
                                                                            fontFamily:
                                                                                'Anderson',
                                                                            fontWeight: FontWeight
                                                                                .w700))
                                                                    : Text(
                                                                        "Credited",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color: Colors
                                                                                .white,
                                                                            fontFamily:
                                                                                'Anderson',
                                                                            fontWeight:
                                                                                FontWeight.w700)),
                                                              )
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: p < 0
                                                                ? Text(
                                                                    "- ₹${p.abs().toStringAsFixed(2)}", //thiss
                                                                    // 'check',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .red,
                                                                      fontFamily:
                                                                          'AndersonB',
                                                                    ),
                                                                  )
                                                                : Text(
                                                                    "+ ₹${p.toStringAsFixed(2)}",
                                                                    // 'check',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .green,
                                                                      fontFamily:
                                                                          'AndersonB',
                                                                    ),
                                                                  ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })
                                            : index == 4
                                                ? ListView.builder(
                                                    itemCount: (widget.may.length)
                                                        .toInt(),
                                                    itemBuilder: (context, i) {
                                                      var p = widget.may[i];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10.0),
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              10,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.10,
                                                          decoration:
                                                              BoxDecoration(
                                                            /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                            color:
                                                                Color.fromRGBO(
                                                                    186,
                                                                    201,
                                                                    255,
                                                                    0.1),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20.0,
                                                                        top: 8,
                                                                        bottom:
                                                                            8),
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color.fromRGBO(
                                                                            186,
                                                                            201,
                                                                            255,
                                                                            0.2),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        //  border: Border.all(color: Colors.black, width: 1)
                                                                      ),
                                                                      child: Image(
                                                                          image: AssetImage(
                                                                              "assets/images/rupee.jpg"),
                                                                          height:
                                                                              MediaQuery.of(context).size.height / 40),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        bottom:
                                                                            8,
                                                                        top: 8),
                                                                    child: p < 0
                                                                        ? Text(
                                                                            'Debited',
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: 'Anderson',
                                                                                fontWeight: FontWeight.w700))
                                                                        : Text("Credited", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)),
                                                                  )
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: p < 0
                                                                    ? Text(
                                                                        "- ₹${p.abs().toStringAsFixed(2)}",
                                                                        // 'check',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.red,
                                                                          fontFamily:
                                                                              'AndersonB',
                                                                        ),
                                                                      )
                                                                    : Text(
                                                                        "+ ₹${p.toStringAsFixed(2)}",
                                                                        // 'check',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.green,
                                                                          fontFamily:
                                                                              'AndersonB',
                                                                        ),
                                                                      ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    })
                                                : index == 5
                                                    ? ListView.builder(
                                                        itemCount:
                                                            (widget.june.length)
                                                                .toInt(),
                                                        itemBuilder: (context, i) {
                                                          var p =
                                                              widget.june[i];
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10.0),
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  10,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.10,
                                                              decoration:
                                                                  BoxDecoration(
                                                                /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                                color: Color
                                                                    .fromRGBO(
                                                                        186,
                                                                        201,
                                                                        255,
                                                                        0.1),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                20.0,
                                                                            top:
                                                                                8,
                                                                            bottom:
                                                                                8),
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              EdgeInsets.all(8),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: Color.fromRGBO(
                                                                                186,
                                                                                201,
                                                                                255,
                                                                                0.2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                            //  border: Border.all(color: Colors.black, width: 1)
                                                                          ),
                                                                          child: Image(
                                                                              image: AssetImage("assets/images/rupee.jpg"),
                                                                              height: MediaQuery.of(context).size.height / 40),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                20,
                                                                            bottom:
                                                                                8,
                                                                            top:
                                                                                8),
                                                                        child: p <
                                                                                0
                                                                            ? Text('Debited',
                                                                                style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700))
                                                                            : Text("Credited", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: p < 0
                                                                        ? Text(
                                                                            "- ₹${p.abs().toStringAsFixed(2)}",
                                                                            // 'check',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              color: Colors.red,
                                                                              fontFamily: 'AndersonB',
                                                                            ),
                                                                          )
                                                                        : Text(
                                                                            "+ ₹${p.toStringAsFixed(2)}",
                                                                            // 'check',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              color: Colors.green,
                                                                              fontFamily: 'AndersonB',
                                                                            ),
                                                                          ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        })
                                                    : index == 6
                                                        ? ListView.builder(
                                                            itemCount:
                                                                (widget.july.length)
                                                                    .toInt(),
                                                            itemBuilder:
                                                                (context, i) {
                                                              var p = widget
                                                                  .july[i];
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      10,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      1.10,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            186,
                                                                            201,
                                                                            255,
                                                                            0.1),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 20.0,
                                                                                top: 8,
                                                                                bottom: 8),
                                                                            child:
                                                                                Container(
                                                                              padding: EdgeInsets.all(8),
                                                                              decoration: BoxDecoration(
                                                                                color: Color.fromRGBO(186, 201, 255, 0.2),
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                //  border: Border.all(color: Colors.black, width: 1)
                                                                              ),
                                                                              child: Image(image: AssetImage("assets/images/rupee.jpg"), height: MediaQuery.of(context).size.height / 40),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 20,
                                                                                bottom: 8,
                                                                                top: 8),
                                                                            child: p < 0
                                                                                ? Text('Debited', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700))
                                                                                : Text("Credited", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: p <
                                                                                0
                                                                            ? Text(
                                                                                "- ₹${p.abs().toStringAsFixed(2)}",
                                                                                // 'check',
                                                                                style: TextStyle(
                                                                                  fontSize: 18,
                                                                                  color: Colors.red,
                                                                                  fontFamily: 'AndersonB',
                                                                                ),
                                                                              )
                                                                            : Text(
                                                                                "+ ₹${p.toStringAsFixed(2)}",
                                                                                // 'check',
                                                                                style: TextStyle(
                                                                                  fontSize: 18,
                                                                                  color: Colors.green,
                                                                                  fontFamily: 'AndersonB',
                                                                                ),
                                                                              ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            })
                                                        : index == 7
                                                            ? ListView.builder(
                                                                itemCount: (widget
                                                                        .august
                                                                        .length)
                                                                    .toInt(),
                                                                itemBuilder: (context, i) {
                                                                  var p = widget
                                                                      .august[i];
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10.0),
                                                                    child:
                                                                        Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          10,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          1.10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                                        color: Color.fromRGBO(
                                                                            186,
                                                                            201,
                                                                            255,
                                                                            0.1),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(8),
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color.fromRGBO(186, 201, 255, 0.2),
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                    //  border: Border.all(color: Colors.black, width: 1)
                                                                                  ),
                                                                                  child: Image(image: AssetImage("assets/images/rupee.jpg"), height: MediaQuery.of(context).size.height / 40),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                                                                                child: p < 0 ? Text('Debited', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)) : Text("Credited", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child: p < 0
                                                                                ? Text(
                                                                                    "- ₹${p.abs().toStringAsFixed(2)}",
                                                                                    // 'check',
                                                                                    style: TextStyle(
                                                                                      fontSize: 18,
                                                                                      color: Colors.red,
                                                                                      fontFamily: 'AndersonB',
                                                                                    ),
                                                                                  )
                                                                                : Text(
                                                                                    "+ ₹${p.toStringAsFixed(2)}",
                                                                                    // 'check',
                                                                                    style: TextStyle(
                                                                                      fontSize: 18,
                                                                                      color: Colors.green,
                                                                                      fontFamily: 'AndersonB',
                                                                                    ),
                                                                                  ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                })
                                                            : index == 8
                                                                ? ListView.builder(
                                                                    itemCount: (widget.september.length).toInt(),
                                                                    itemBuilder: (context, i) {
                                                                      var p = widget
                                                                          .september[i];
                                                                      return Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 10.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height / 10,
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 1.10,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                                            color: Color.fromRGBO(
                                                                                186,
                                                                                201,
                                                                                255,
                                                                                0.1),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
                                                                                    child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color.fromRGBO(186, 201, 255, 0.2),
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                        //  border: Border.all(color: Colors.black, width: 1)
                                                                                      ),
                                                                                      child: Image(image: AssetImage("assets/images/rupee.jpg"), height: MediaQuery.of(context).size.height / 40),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                                                                                    child: p < 0 ? Text('Debited', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)) : Text("Credited", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: p < 0
                                                                                    ? Text(
                                                                                        "- ₹${p.abs().toStringAsFixed(2)}",
                                                                                        // 'check',
                                                                                        style: TextStyle(
                                                                                          fontSize: 18,
                                                                                          color: Colors.red,
                                                                                          fontFamily: 'AndersonB',
                                                                                        ),
                                                                                      )
                                                                                    : Text(
                                                                                        "+ ₹${p.toStringAsFixed(2)}",
                                                                                        // 'check',
                                                                                        style: TextStyle(
                                                                                          fontSize: 18,
                                                                                          color: Colors.green,
                                                                                          fontFamily: 'AndersonB',
                                                                                        ),
                                                                                      ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    })
                                                                : index == 9
                                                                    ? ListView.builder(
                                                                        itemCount: (widget.october.length).toInt(),
                                                                        itemBuilder: (context, i) {
                                                                          var p =
                                                                              widget.october[i];
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 10.0),
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.of(context).size.height / 10,
                                                                              width: MediaQuery.of(context).size.width / 1.10,
                                                                              decoration: BoxDecoration(
                                                                                /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                                                color: Color.fromRGBO(186, 201, 255, 0.1),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
                                                                                        child: Container(
                                                                                          padding: EdgeInsets.all(8),
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color.fromRGBO(186, 201, 255, 0.2),
                                                                                            borderRadius: BorderRadius.circular(5),
                                                                                            //  border: Border.all(color: Colors.black, width: 1)
                                                                                          ),
                                                                                          child: Image(image: AssetImage("assets/images/rupee.jpg"), height: MediaQuery.of(context).size.height / 40),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                                                                                        child: p < 0 ? Text('Debited', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)) : Text("Credited", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: p < 0
                                                                                        ? Text(
                                                                                            "- ₹${p.abs().toStringAsFixed(2)}",
                                                                                            // 'check',
                                                                                            style: TextStyle(
                                                                                              fontSize: 18,
                                                                                              color: Colors.red,
                                                                                              fontFamily: 'AndersonB',
                                                                                            ),
                                                                                          )
                                                                                        : Text(
                                                                                            "+ ₹${p.toStringAsFixed(2)}",
                                                                                            // 'check',
                                                                                            style: TextStyle(
                                                                                              fontSize: 18,
                                                                                              color: Colors.green,
                                                                                              fontFamily: 'AndersonB',
                                                                                            ),
                                                                                          ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        })
                                                                    : index == 10
                                                                        ? ListView.builder(
                                                                            itemCount: (widget.november.length).toInt(),
                                                                            itemBuilder: (context, i) {
                                                                              var p = widget.november[i];
                                                                              return Padding(
                                                                                padding: const EdgeInsets.only(top: 10.0),
                                                                                child: Container(
                                                                                  height: MediaQuery.of(context).size.height / 10,
                                                                                  width: MediaQuery.of(context).size.width / 1.10,
                                                                                  decoration: BoxDecoration(
                                                                                    /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                                                    color: Color.fromRGBO(186, 201, 255, 0.1),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
                                                                                            child: Container(
                                                                                              padding: EdgeInsets.all(8),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color.fromRGBO(186, 201, 255, 0.2),
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                                //  border: Border.all(color: Colors.black, width: 1)
                                                                                              ),
                                                                                              child: Image(image: AssetImage("assets/images/rupee.jpg"), height: MediaQuery.of(context).size.height / 40),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                                                                                            child: p < 0 ? Text('Debited', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)) : Text("Credited", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: p < 0
                                                                                            ? Text(
                                                                                                "- ₹${p.abs().toStringAsFixed(2)}",
                                                                                                // 'check',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 18,
                                                                                                  color: Colors.red,
                                                                                                  fontFamily: 'AndersonB',
                                                                                                ),
                                                                                              )
                                                                                            : Text(
                                                                                                "+ ₹${p.toStringAsFixed(2)}",
                                                                                                // 'check',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 18,
                                                                                                  color: Colors.green,
                                                                                                  fontFamily: 'AndersonB',
                                                                                                ),
                                                                                              ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            })
                                                                        : ListView.builder(
                                                                            itemCount: (widget.december.length).toInt(),
                                                                            itemBuilder: (context, i) {
                                                                              var p = widget.december[i];
                                                                              return Padding(
                                                                                padding: const EdgeInsets.only(top: 10.0),
                                                                                child: Container(
                                                                                  height: MediaQuery.of(context).size.height / 10,
                                                                                  width: MediaQuery.of(context).size.width / 1.10,
                                                                                  decoration: BoxDecoration(
                                                                                    /*border: Border.all(width: 1.5, color: Colors.black),*/
                                                                                    color: Color.fromRGBO(186, 201, 255, 0.1),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
                                                                                            child: Container(
                                                                                              padding: EdgeInsets.all(8),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color.fromRGBO(186, 201, 255, 0.2),
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                                //  border: Border.all(color: Colors.black, width: 1)
                                                                                              ),
                                                                                              child: Image(image: AssetImage("assets/images/rupee.jpg"), height: MediaQuery.of(context).size.height / 40),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                                                                                            child: p < 0 ? Text('Debited', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)) : Text("Credited", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Anderson', fontWeight: FontWeight.w700)),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: p < 0
                                                                                            ? Text(
                                                                                                "- ₹${p.abs().toStringAsFixed(2)}",
                                                                                                // 'check',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 18,
                                                                                                  color: Colors.red,
                                                                                                  fontFamily: 'AndersonB',
                                                                                                ),
                                                                                              )
                                                                                            : Text(
                                                                                                "+ ₹${p.toStringAsFixed(2)}",
                                                                                                // 'check',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 18,
                                                                                                  color: Colors.green,
                                                                                                  fontFamily: 'AndersonB',
                                                                                                ),
                                                                                              ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            })))
                  ],
                ));
              }),
        ));
  }
}
