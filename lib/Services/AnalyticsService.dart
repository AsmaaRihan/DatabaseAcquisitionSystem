import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class AnalyticsService {
  final FirebaseAnalytics _anylytics = new FirebaseAnalytics();
  FirebaseAnalyticsObserver getAnalyticsOberver() =>
      FirebaseAnalyticsObserver(analytics: _anylytics);

  Future setUserProperties({@required String userId}) async {
    await _anylytics.setUserId(userId);
    await _anylytics.setUserProperty(
        name: 'UserTesting', value: 'Testing User Proprrty');
    print('setUserProperties succeeded');
  }

  Future<void> sendAnalyticsEvent(int number, name) async {
    await _anylytics
        .logEvent(
          name:
              'Test_Analytics', // name that will be show in the debuge console
          parameters: <String, dynamic>{
            'id': 14524896,
            'name': 'Hello_in_Analytics',
            'bool': true,
            'screen': name
          },
        )
        .whenComplete(() => print('logEvent succeeded'))
        .catchError((e) => print('Error in LogEvent: $e'));
    setScreenName(name);
  }

  Future setScreenName(String name) async {
    await _anylytics
        .setCurrentScreen(
          screenName: name,
        )
        .whenComplete(() => print('SetCurrentScreen succeeded'));
  }

  // Future<void> setScreenName({@required String name}) async {
  //   await _anylytics
  //       .setCurrentScreen(screenName: name)
  //       .then((value) => print('Name is $name'));
  // }

  Future logLoggin() async {
    await _anylytics.logLogin(loginMethod: 'email');
  }

  // Future logSignUp() async {
  //   await _anylytics.logSignUp(signUpMethod: 'email');
  // }

  // Future logPostCreated() async {
  //   await _anylytics
  //       .logEvent(name: 'creat_Post', parameters: {'has_image': true});
  // }

  //  Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => HomeView(),
  //       //this name will be in the frebase Analytics console
  //       settings: RouteSettings(name: 'HomeView'),
  //     ));
}
