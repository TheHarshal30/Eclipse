// ignore_for_file: prefer_const_constructors

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
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
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