import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'AuthService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phone, verficationId, smsCode;
  bool codeSent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeSent = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Your Phone Number'),
                onChanged: (val) {
                  print('Phone ${val.trim()}');
                  this.phone = val.trim();
                },
                keyboardType: TextInputType.phone,
              ),
            ),
            codeSent
                ? Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter OTP'),
                      onChanged: (val) {
                        this.smsCode = val;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                  )
                : Container(),
            RaisedButton(
              onPressed: () {
                codeSent
                    ? AuthService().signInWithOTP(smsCode, verficationId)
                    : verifyPhone(phone);
              },
              child: codeSent ? Text('Login') : Text("Verify"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhone(phone) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verficationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verficationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };
    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential authResult) {
      AuthService().signIn(authResult);
      print('verfied');
    };

    final PhoneVerificationFailed verifiedFailed =
        (FirebaseAuthException authException) {
      print('Error ${authException.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this.phone,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifiedFailed,
    );
  }
}
