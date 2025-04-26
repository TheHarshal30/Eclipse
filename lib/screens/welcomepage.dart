// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'package:app1/main.dart';
import 'package:app1/screens/homepage2.dart';
import 'package:app1/screens/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:provider/provider.dart';

import '../models/signin.dart';
import 'homepage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromRGBO(161, 128, 255, 0.25),
            const Color.fromRGBO(117, 114, 255, 0.1),
            const Color.fromRGBO(132, 112, 255, 0.01),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Lottie.asset("assets/images/Welcome.json"),
                ),
              ),
              Text(
                "FINTRACK",
                textAlign: TextAlign.center,
                style: GoogleFonts.bangers(fontSize: 60, color: Colors.white),
              ),
              Text(
                "Building a head start to your finances",
                style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavPage(
                              pageIndex: 0,
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50),
                    child: NeoPopButton(
                      color: Colors.white,
                      onTapUp: () async {
                        final provider =
                            Provider.of<UserLogin>(context, listen: false);
                        await provider.googleLogin();
                        HapticFeedback.vibrate();
                      },
                      onTapDown: () => HapticFeedback.vibrate(),
                      parentColor: Colors.transparent,
                      buttonPosition: Position.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/google.png"),
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Continue with Google",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// 17 27 49
//color: Color.fromRGBO(17, 27, 49, 1),

// 167 252 132
// https://assets10.lottiefiles.com/packages/lf20_06a6pf9i.json
// 233 251 242

/*Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavPage(
                              pageIndex: 0,
                            )));*/