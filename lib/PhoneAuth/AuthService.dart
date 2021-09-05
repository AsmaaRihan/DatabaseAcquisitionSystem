import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dashboardPage.dart';
import 'LoginPage.dart';

class AuthService {
  handleAuth() {
    return FutureBuilder(
      builder:
          //  stream: FirebaseAuth.instance.authStateChanges(),
          (BuildContext ctx, snapshot) {
        if (snapshot.hasData) {
          return DashboardPage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(smsCode: smsCode, verificationId: verId);
    signIn(authCreds);
  }
}
