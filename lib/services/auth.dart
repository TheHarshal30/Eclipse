import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
      Future<bool> doesUserExist() async {
        final snapshot = await FirebaseFirestore.instance.collection('Users')
            .where("Email", isEqualTo: FirebaseAuth.instance.currentUser!.email!)
            .get();
        return snapshot.docs.isNotEmpty;
      }
      Future<void> startcollection () async
      {
        bool condition = await doesUserExist();
        if (condition == false){
          print("in create");
          FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set({
            'name' : FirebaseAuth.instance.currentUser!.displayName,
            'Email' : FirebaseAuth.instance.currentUser!.email,
            'january' : FieldValue.arrayUnion([]),
            'february' : FieldValue.arrayUnion([]),
            'march' : FieldValue.arrayUnion([]),
            'april' : FieldValue.arrayUnion([]),
            'may' : FieldValue.arrayUnion([]),
            'june' : FieldValue.arrayUnion([]),
            'july' : FieldValue.arrayUnion([]),
            'august' : FieldValue.arrayUnion([]),
            'september' : FieldValue.arrayUnion([]),
            'october' : FieldValue.arrayUnion([]),
            'november' : FieldValue.arrayUnion([]),
            'december' : FieldValue.arrayUnion([]),
          'janex' : 0,
          'febx' :0,
          'marx' :0,
          'aprx' :0,
          'junex': 0,
          'julyx': 0,
          'mayx' :0,
          'augustx' : 0,
          'octx':  0,
          'septx' :0,
          'novx' : 0,
          'decx'  :0,
            'totalex' : 0,
            'date' : DateTime.now(),
            //@TODO add date.now later
          });
        }else{
          print("in not");
        }
      }
      startcollection();
    });
    notifyListeners();
  }
}