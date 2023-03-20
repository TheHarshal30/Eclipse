// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../services/auth.dart';
import 'homepage.dart';

bool kk = false;
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(204, 229, 229, 1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Lottie.asset("assets/images/Welcome.json"),
              ),
            ),
            Text(
              "Eclipse",
              textAlign: TextAlign.center,
              style: GoogleFonts.bangers(fontSize: 60),
            ),
            Text(
              "Building a head start to your finances",
              style: GoogleFonts.ubuntu(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: GestureDetector(
                onTap: ()async {
                  final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                child: Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/google.png"),
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Continue with Google",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height: 50,
                  width: (MediaQuery.of(context).size.width) * 0.75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.green.shade200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
