
import 'package:eclipsis/Screens/homepage.dart';
import 'package:eclipsis/Screens/navigator.dart';
import 'package:eclipsis/Screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => NavPage(pageIndex: 0, bank: 0)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/readme2.png'),
              height: MediaQuery.of(context).size.height / 6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "ECLIPSE",
                textAlign: TextAlign.center,
                style: GoogleFonts.bangers(fontSize: 60, color: Colors.black),
              ),
            ),
            Text(
              "Backed by Inside Labs",
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}