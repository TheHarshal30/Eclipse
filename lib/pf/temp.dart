// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app1/pf/chap1.dart';
import 'package:app1/pf/chap2.dart';
import 'package:app1/pf/chap4.dart';
import 'package:app1/screens/homepage2.dart';
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
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Eclipse Learning",
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(186, 201, 255, 1),
            fontFamily: 'AndersonB',
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                idx = value;
              });
            },
            children: [
              Chap1(),
              Chap2(),
              Chap3(),
              Chap4(),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 0, bottom: 20),
            child: Container(
                alignment: Alignment(0, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (idx != 0) ...[
                        GestureDetector(
                          onTap: () {
                            _controller.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear);
                          },
                          child: Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      if (idx == 0) ...[
                        Text(""),
                      ],
                      if (idx != 3) ...[
                        GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
                          ),
                        )
                      ],
                      if (idx == 3) ...[
                        Text(""),
                      ],
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
