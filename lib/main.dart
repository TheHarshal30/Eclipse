// ignore_for_file: prefer_const_constructors

import 'package:app1/models/fdmodel.dart';
import 'package:app1/models/mfmodel3.dart';
import 'package:app1/pf/temp.dart';
import 'package:app1/screens/club.dart';
import 'package:app1/screens/expenses.dart';
import 'package:app1/screens/homepage.dart';
import 'package:app1/screens/homepage2.dart';
import 'package:app1/screens/investmf.dart';
import 'package:app1/screens/navigator.dart';
import 'package:app1/screens/splash.dart';
import 'package:app1/screens/splashscreen.dart';
import 'package:app1/screens/welcomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app1/screens/news2.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'models/newsmodel.dart';
import 'models/newsservices.dart';
import 'models/remote_services.dart';
import 'package:http/http.dart' as http;

import 'models/signin.dart';

var version = "1.0.1";
var username = "";
bool isUserName = false;

class FD with ChangeNotifier {
  // FDs? fdlist;
  // bool isFD = false;
  List<MFNAV>? mfnavlist;
  News? market;
  News? economy;
  News? tech;
  News? all;
  // Future<void> getPosts() async {
  //   var client = http.Client();

  //   var uri =
  //       Uri.parse('https://api.kuvera.in/fixed_deposit/api/v1/plans.json');
  //   var response = await client.get(uri);

  //   var json = response.body;
  //   fdlist = FDsFromJson(json);
  //   isFD = true;
  //   notifyListeners();
  // }

  Future<void> getMF() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://latest-mutual-fund-nav.p.rapidapi.com/fetchLatestNAV?SchemeType=Open%20Ended%20Schemes');
    var response = await client.get(uri, headers: {
      'X-RapidAPI-Key': 'be32dc0dd5msh8ba1a495a126990p177ec6jsndeafd301c064',
      'X-RapidAPI-Host': 'latest-mutual-fund-nav.p.rapidapi.com'
    });

    var json = response.body;
    mfnavlist = MFNAVFromJson(json);
    notifyListeners();
  }

  Future<void> getMarket() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=financial_markets&apikey=ZTF5S6178QWI906O');
    var response = await client.get(uri, headers: {'User-Agent': 'request'});
    var json = response.body;
    market = NewsFromJson(json);

    notifyListeners();
  }

  Future<void> getEconomy() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=economy_monetary&apikey=ZTF5S6178QWI906O');
    var response = await client.get(uri, headers: {'User-Agent': 'request'});
    var json = response.body;
    economy = NewsFromJson(json);

    notifyListeners();
  }

  Future<void> getTech() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=technology&apikey=ZTF5S6178QWI906O');
    var response = await client.get(uri, headers: {'User-Agent': 'request'});
    var json = response.body;
    tech = NewsFromJson(json);

    notifyListeners();
  }

  Future<void> getAll() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&apikey=ZTF5S6178QWI906O');
    var response = await client.get(uri, headers: {'User-Agent': 'request'});
    var json = response.body;
    all = NewsFromJson(json);
    notifyListeners();
  }

  String? userrr;

  Future<bool> getUsername() async {
    Map<String, dynamic>? temp = await FirebaseFirestore.instance
        .collection("username")
        .doc(curruserKey)
        .get()
        .then((value) => value.data());
    if (temp != null) {
      userrr = temp["username"];
      isUserName = true;
      notifyListeners();
      return true;
    } else {
      isUserName = false;
      notifyListeners();
      return false;
    }
  }
}

// 1. Declare the required permissions in your app.
double janex = 0;
double febx = 0;
double marx = 0;
double mayx = 0;
double aprx = 0;
double junex = 0;
double julyx = 0;
double augustx = 0;
double septx = 0;
double octx = 0;
double novx = 0;
double decx = 0;
double k = 0;
double expens = 0;
double income = 0;

List<dynamic> jan = [];
List<dynamic> feb = [];
List<dynamic> mar = [];
List<dynamic> apr = [];
List<dynamic> may = [];
List<dynamic> june = [];
List<dynamic> july = [];
List<dynamic> august = [];
List<dynamic> september = [];
List<dynamic> october = [];
List<dynamic> november = [];
List<dynamic> december = [];

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FD()),
          ChangeNotifierProvider(create: (context) => UserLogin())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Eclipse",
            home: HomeScreen()));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          }
          if (!snapshot.hasData) {
            return WelcomePage();
          } else {
            print(snapshot.data);
            return ClubPage();
          }
        },
      ),
    );
  }
}
