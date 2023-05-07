import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigator.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  void initState() {
    super.initState();
    //  _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => NavPage(
              pageIndex: 0,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/splash.jpg'),
              height: MediaQuery.of(context).size.height / 5,
            ),
            /*
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "ECLIPSE",
                textAlign: TextAlign.center,
                style: GoogleFonts.bangers(fontSize: 60, color: Colors.white),
              ),
            ),
            Text(
              "Backed by Inside Labs",
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.grey[600]),
            ),
            */
          ],
        ),
      ),
    );
  }
}
