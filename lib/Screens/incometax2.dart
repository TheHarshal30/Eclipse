// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, sized_box_for_whitespace, annotate_overrides, avoid_print, unused_field, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TaxPage extends StatefulWidget {
  const TaxPage({super.key});

  @override
  State<TaxPage> createState() => _TaxPageState();
}

class _TaxPageState extends State<TaxPage> {
  dynamic grossSalary = TextEditingController(text: "0");
  dynamic hra = TextEditingController(text: "0");
  dynamic othersrc = TextEditingController(text: "0");
  dynamic deductions = TextEditingController(text: "0");
  dynamic selec = 0;
  dynamic ans1 = 0;
  dynamic _ans = 0;
  @override
  void dispose() {
    super.dispose();
    grossSalary.dispose();
  }

  dynamic calcTax(dynamic sal, dynamic lta, dynamic src, dynamic ded) {
    dynamic temp1 = sal - lta;
    dynamic temp2 = temp1 - 50000;
    dynamic temp3 = temp2 + src;
    dynamic temp4 = temp3 - ded;
    print(temp4);
    if (temp4 < 300000) {
      return sal;
    } else if (300001 < temp4 && temp4 <= 600000) {
      dynamic temp5 = (temp4 * 5) / 100;
      print(temp5);
      dynamic ans = temp4 - temp5;
      return ans;
    } else if (600001 < temp4 && temp4 <= 900000) {
      dynamic temp5 = (temp4 * 10) / 100;
      dynamic ans = temp4 - temp5;
      return ans;
    } else if (900001 < temp4 && temp4 <= 1200000) {
      dynamic temp5 = (temp4 * 15) / 100;
      dynamic ans = temp4 - temp5;
      return ans;
    } else if (1200001 < temp4 && temp4 <= 1500000) {
      dynamic temp5 = (temp4 * 20) / 100;
      dynamic ans = temp4 - temp5;
      return ans;
    } else {
      dynamic temp5 = (temp4 * 30) / 100;
      dynamic ans = temp4 - temp5;
      return ans;
    }
  }

  void dis() {
    print(calcTax(1500000, 200000, 10000, 225000));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Eclipse Taxation",
              style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  color: Colors.black),
            )),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.lightGreen.shade50),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Advance Tax Calculator",
                          style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹" + _ans.toString(),
                                style: GoogleFonts.ubuntu(fontSize: 25),
                              ),
                              Text(
                                "Income After taxes",
                                style: GoogleFonts.ubuntu(),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  dynamic g = grossSalary.text;
                                  dynamic h = hra.text;
                                  dynamic o = othersrc.text;
                                  dynamic d = deductions.text;
                                  if (double.parse(g) == null) {
                                    g = 0;
                                  }
                                  if (double.parse(h) == null) {
                                    h = 0;
                                  }
                                  if (double.parse(o) == null) {
                                    o = 0;
                                  }
                                  if (double.parse(d) == null) {
                                    d = 0;
                                  }
                                  _ans = calcTax(double.parse(g), double.parse(h),
                                      double.parse(o), double.parse(d));
                                });
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(width: 1, color: Colors.black),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Calculate",
                                  style: GoogleFonts.ubuntu(fontSize: 16),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    grossSalary.text = "0";
                                    hra.text = "0";
                                    othersrc.text = "0";
                                    deductions.text = "0";
                                    _ans = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(width: 1, color: Colors.black),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "Clear All",
                                    style: GoogleFonts.ubuntu(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selec = 0;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: (selec == 0)
                                        ? Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.blue))
                                        : Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.white)),
                                  ),
                                  child: Text(
                                    "Salary",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 15,
                                        color: (selec == 0)
                                            ? Colors.blue
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selec = 1;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: (selec == 1)
                                        ? Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.blue))
                                        : Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.white)),
                                  ),
                                  child: Text(
                                    "Allowances",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 15,
                                        color: (selec == 1)
                                            ? Colors.blue
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selec = 2;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: (selec == 2)
                                        ? Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.blue))
                                        : Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.white)),
                                  ),
                                  child: Text(
                                    "Other Sources",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 15,
                                        color: (selec == 2)
                                            ? Colors.blue
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selec = 3;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: (selec == 3)
                                        ? Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.blue))
                                        : Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.white)),
                                  ),
                                  child: Text(
                                    "Deductions",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 15,
                                        color: (selec == 3)
                                            ? Colors.blue
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (selec == 0) ...[
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 11,
                                child: TextFormField(
                                  controller: grossSalary,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      labelText: "Enter your Gross Salary",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                        height:
                                        MediaQuery.of(context).size.height / 10,
                                        child: Image(
                                            image: AssetImage(
                                              "assets/images/income.png",
                                            ))),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 1.75,
                                      height:
                                      MediaQuery.of(context).size.height / 8,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        "Gross Salary is the Annual Salary received without deduction of any allowances",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 16,
                                            wordSpacing: 2,
                                            letterSpacing: 1.25),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ] else if (selec == 1) ...[
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 11,
                                child: TextFormField(
                                  controller: hra,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText:
                                      "Enter HRA, LTA or other Allowances",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                        height:
                                        MediaQuery.of(context).size.height / 10,
                                        child: Image(
                                            image: AssetImage(
                                              "assets/images/cash.png",
                                            ))),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 1.5,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        "An allowance is an amount received by the employee for meeting service requirements. Allowances are provided in addition to the basic salary and vary from company to company. Eg: House Rent Allowance(HRA), Leave Travel Allowance(LTA)",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 16,
                                            wordSpacing: 2,
                                            letterSpacing: 1.25),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ] else if (selec == 2) ...[
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 11,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: othersrc,
                                  decoration: InputDecoration(
                                      labelText: "Enter Income from other sources",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                        height:
                                        MediaQuery.of(context).size.height / 10,
                                        child: Image(
                                            image: AssetImage(
                                              "assets/images/otherincome.png",
                                            ))),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 1.5,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        "Income from other sources includes interests recieved on Savings Accounts, Fixed Deposits, Domestic Dividends, etc",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 16,
                                            wordSpacing: 2,
                                            letterSpacing: 1.25),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ] else if (selec == 3) ...[
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 11,
                                child: TextFormField(
                                  controller: deductions,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Enter deductions",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                        height:
                                        MediaQuery.of(context).size.height / 10,
                                        child: Image(
                                            image: AssetImage(
                                              "assets/images/deduction.png",
                                            ))),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 1.5,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        "Tax deduction refers to claims made to reduce your taxable income, arising from various investments and expenses incurred by a taxpayer. Investments in schemes such as NPS, ELSS, EPF, LIC Premiums,PPF",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 16,
                                            wordSpacing: 2,
                                            letterSpacing: 1.25),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                  ]),
                )
              ]),
            )));
  }
}