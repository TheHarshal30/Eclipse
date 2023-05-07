// ignore_for_file: prefer_const_constructors

import 'package:app1/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookGen extends StatelessWidget {
  final String chapname;
  final String para1;
  final String para2;
  final String para3;
  final String para4;
  final String para5;
  final String para6;
  final Widget nextpg;
  final Widget prevpg;
  const BookGen(
      {super.key,
      required this.chapname,
      required this.para1,
      required this.para2,
      required this.para3,
      required this.para4,
      required this.para5,
      required this.para6,
      required this.nextpg,
      required this.prevpg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromRGBO(161, 128, 255, 0.5),
                    const Color.fromRGBO(117, 114, 255, 0.3),
                    const Color.fromRGBO(132, 112, 255, 0.01),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  chapname,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontFamily: 'AndersonB',
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para1,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 15,
                            wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para2,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 15,
                            wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para3,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 15,
                            wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para4,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 15,
                            wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para5,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 15,
                            wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para6,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 15,
                            wordSpacing: 2.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
