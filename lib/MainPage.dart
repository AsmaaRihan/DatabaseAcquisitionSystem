import 'package:Task/page2.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

import 'Services/AnalyticsService.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AnalyticsService analyticsService = AnalyticsService();
  int trailNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Analytics Test'),
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              setState(() {
                trailNo += 1;
              });
              analyticsService.sendAnalyticsEvent(trailNo, 'MainPage');
            },
            child: const Text('Test logEvent'),
          ),
          MaterialButton(
            onPressed: () {
              // analyticsService.logLoggin();
            },
            child: const Text('Test logLoggin'),
          ),
          MaterialButton(
            onPressed: () {
              analyticsService.setUserProperties(
                  userId: '12345678901234567890123456789');
            },
            child: const Text('Test setUserId'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Page2()));
            },
            child: const Text('Page 2'),
          ),
        ],
      ),
    );
  }
}
