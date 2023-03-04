// ignore_for_file: prefer_const_constructors

import 'package:eclipsis/Screens/homepage.dart';
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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Welcome to Eclipse Learning",
            style: GoogleFonts.ubuntu(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.yellow.shade50),
              child: Center(
                child: Text(
                  chapname,
                  style: GoogleFonts.ubuntu(fontSize: 21),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.45,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para1,
                        style:
                        GoogleFonts.ubuntu(fontSize: 15, wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para2,
                        style:
                        GoogleFonts.ubuntu(fontSize: 15, wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para3,
                        style:
                        GoogleFonts.ubuntu(fontSize: 15, wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para4,
                        style:
                        GoogleFonts.ubuntu(fontSize: 15, wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para5,
                        style:
                        GoogleFonts.ubuntu(fontSize: 15, wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        para6,
                        style:
                        GoogleFonts.ubuntu(fontSize: 15, wordSpacing: 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => prevpg));
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration:
                              BoxDecoration(color: Colors.red.shade50),
                              child: Text(
                                "< Prev",
                                style: GoogleFonts.ubuntu(),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => nextpg));
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}