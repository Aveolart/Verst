// ignore_for_file: prefer_const_constru, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:verst/screens/homepage.dart';
import 'package:verst/screens/login_screen.dart';

class AuthService {
  // FirebaseAuth mAuth = FirebaseAuth.instance();
  //Authentication State

  authState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        } else {
          return LoginSceen();
        }
      },
    );
  }

  // Sign in
  googleSignIN() async {
    //Authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain Auth details
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    //Create new detailss
    final newDetails = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    //Return details after signing In
    return await FirebaseAuth.instance.signInWithCredential(newDetails);
  }

  //Sign out
  signOut() async {
    await FirebaseAuth.instance.signOut();
    // Prompt the user to re-provide their sign-in credentials.
// Then, use the credentials to reauthenticate:
    // await googleUser?.reauthenticateWithCredential(newDw);
  }
}
