// Sign in with username and password
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserLogin extends ChangeNotifier {
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
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      Future<bool> doesUserExist() async {
        final snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .where("Email",
                isEqualTo: FirebaseAuth.instance.currentUser!.email!)
            .get();
        return snapshot.docs.isNotEmpty;
      }

      if (await doesUserExist()) {
        UserID() {
          return FirebaseAuth.instance.currentUser!.uid;
        }
      }
    });
    notifyListeners();
  }
}
