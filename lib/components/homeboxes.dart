// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Boxes extends StatelessWidget {
  final String boxTitle;
  final Color boxColor1;
  final Color boxColor2;
  final AssetImage boxImage;
  final String boxSubTitle;
  final Color imgColor;
  const Boxes(
      {super.key,
      required this.boxTitle,
      required this.boxColor1,
      required this.boxColor2,
      required this.boxImage,
      required this.boxSubTitle,
      required this.imgColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: Container(
        height: MediaQuery.of(context).size.height / 9,
        width: MediaQuery.of(context).size.width / 1.10,
        decoration: BoxDecoration(
          /*border: Border.all(width: 1.5, color: Colors.black),*/
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: imgColor,
                      borderRadius: BorderRadius.circular(10),
                      //  border: Border.all(color: Colors.black, width: 1)
                    ),
                    child: Image(
                        image: boxImage,
                        height: MediaQuery.of(context).size.height / 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        boxTitle,
                        style: GoogleFonts.ubuntu(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          boxSubTitle,
                          style: GoogleFonts.ubuntu(
                              fontSize: 12, fontWeight: FontWeight.w100),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Image(
                image: AssetImage("assets/images/g.png"),
                height: MediaQuery.of(context).size.height / 20)
          ],
        ),
      ),
    );
  }
}
