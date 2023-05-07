// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinBox extends StatelessWidget {
  final String boxtitle;
  final AssetImage boxImage;
  const FinBox({super.key, required this.boxtitle, required this.boxImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          /*border: Border.all(color: Color.fromRGBO(17, 27, 49, 1), width: 1),*/
          color: Colors.transparent,
        ),
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image(
                image: boxImage,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.symmetric(vertical: 26),
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Text(
                  boxtitle,
                  style: GoogleFonts.ubuntu(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
