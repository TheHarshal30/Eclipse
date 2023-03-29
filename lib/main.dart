import 'package:eclipsis/Screens/homepage.dart';
import 'package:eclipsis/Screens/navigator.dart';
import 'package:eclipsis/Screens/splashscreen.dart';
import 'package:eclipsis/Screens/welcome.dart';
import 'package:eclipsis/firebase_options.dart';
import 'package:eclipsis/models/fdmodel.dart';
import 'package:eclipsis/models/mfmodel3.dart';
import 'package:eclipsis/models/newsmodel.dart';
import 'package:eclipsis/models/newsservices.dart';
import 'package:eclipsis/models/remote_services.dart';
import 'package:eclipsis/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    getFDs();
    getMFs();
    getNAll();
    getNEco();
    getNMar();
    getNTech();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
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
          if (snapshot.hasData) {
            return Splash();
          } else {
            return WelcomePage();
          }
        },
      ),
    );
  }
}
