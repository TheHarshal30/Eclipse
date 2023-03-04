import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclipsis/Screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('AlertDemo with TextField '),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter Text"),
            ),
            actions: [
              new ElevatedButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  setState(() {
                    name = _textFieldController.text;
                  });
                  FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).update({
                    'name': name,
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage()));
                },
              )
            ],
          );
        }
    );
  }
  String name = '';
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async{
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      name = snap['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
          onTap: (){AlertDialog(
            title: Text('AlertDemo with TextField '),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter Text"),
            ),
            actions: [
              new ElevatedButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  setState(() {
                    name = _textFieldController.text;
                  });
                  FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).update({
                    'name': name,
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage()));
                },
              )
            ],
          );},
          child: Text("Profile ${name}", style: GoogleFonts.bangers(fontSize: 40))),
    ));
  }
}
