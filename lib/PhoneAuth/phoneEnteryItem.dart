import 'package:Task/PhoneAuth/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneEnteryScreen extends StatefulWidget {
  static const routeName = '\phoneEnteryScreen';

  @override
  _PhoneEnteryScreenState createState() => _PhoneEnteryScreenState();
}

class _PhoneEnteryScreenState extends State<PhoneEnteryScreen> {
  String phone, verficationId, smsCode;

  bool codeSent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Acquisiton System'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white60,
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
                            fillColor: Colors.white60,
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
      ),
    );
  }

  Future<void> verifyPhone(phone) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verficationId = verId;
      print('AutoRet $verId');
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verficationId = verId;
      print('smsCodeSent $verId');

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
