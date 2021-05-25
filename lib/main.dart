import 'package:Task/MainPage.dart';
import 'package:Task/Services/AnalyticsService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorObservers: [AnalyticsService().getAnalyticsOberver()],
        debugShowCheckedModeBanner: false,
        home: MainPage()

        //  AuthService().handleAuth(),
        );
  }
}
