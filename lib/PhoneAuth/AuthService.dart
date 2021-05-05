import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dashboardPage.dart';
import 'LoginPage.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext ctx, snapshot) {
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
