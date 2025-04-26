import 'package:app1/models/mfmodel3.dart';
import 'package:app1/screens/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../models/fdmodel.dart';
import '../models/newsmodel.dart';
import '../models/newsservices.dart';
import '../models/remote_services.dart';

List<MFNAV>? mfnavlist;
FDs? fdlist;
News? market;
News? economy;
News? tech;
News? all;
var isFD = false;
var isMF = false;
var nMar = false;
var nEco = false;
var nTech = false;
var nAll = false;
getFDs() async {
  fdlist = (await RemoteService2.getPosts());

  if (fdlist != null) {
    //print("Hello");
    isFD = true;
  }
}

getMFs() async {
  mfnavlist = (await RemoteService4.getPosts());
  if (mfnavlist != null) {
    isMF = true;
  }
}

getNAll() async {
  all = (await NewServiceAll.getPosts());
  nAll = true;
}

getNMar() async {
  market = (await NewServiceMarket.getPosts());
  nMar = true;
}

getNTech() async {
  tech = (await NewServiceTech.getPosts());
  nTech = true;
}

getNEco() async {
  economy = (await NewServiceEconomy.getPosts());
  nEco = true;
}

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
        builder: (BuildContext context) => NavPage(
              pageIndex: 0,
            )));
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
                "FINTRACK",
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
