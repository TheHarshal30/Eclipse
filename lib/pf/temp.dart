// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eclipsis/pf/chap1.dart';
import 'package:eclipsis/pf/chap2.dart';
import 'package:eclipsis/pf/chap4.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/homepage.dart';
import 'chap3.dart';

class Swipe extends StatefulWidget {
  const Swipe({super.key});

  @override
  State<Swipe> createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Welcome to Eclipse Learning",
            style: GoogleFonts.ubuntu(color: Colors.black)),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Chap1(),
              Chap2(),
              Chap3(),
              Chap4(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment(0, 0.95),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _controller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.red.shade50),
                          child: Text(
                            "< Prev",
                            style: GoogleFonts.ubuntu(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration:
                          BoxDecoration(color: Colors.green.shade50),
                          child: Text(
                            "Next >",
                            style: GoogleFonts.ubuntu(),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}