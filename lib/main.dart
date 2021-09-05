import 'package:Task/MainPage.dart';
import 'package:Task/PhoneAuth/AuthService.dart';
import 'package:Task/PhoneAuth/phoneEnteryItem.dart';
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
        title: 'Database Acquisition System',
        navigatorObservers: [AnalyticsService().getAnalyticsOberver()],
        debugShowCheckedModeBanner: false,
        home: //MainPage()

            AuthService().handleAuth(),
        routes: {
          PhoneEnteryScreen.routeName: (ctx) => PhoneEnteryScreen(),
        });
  }
}
