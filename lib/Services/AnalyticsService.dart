import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = new FirebaseAnalytics();
  FirebaseAnalyticsObserver getAnalyticsOberver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> sendAnalyticsEvent(int number, name) async {
    //tested
    await _analytics
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
  }

  Future logLoggin() async {
    //tested
    await _analytics.logLogin(loginMethod: 'email');
    print('loggingEvent');
  }

  Future logPostCreated() async {
    //tested
    await _analytics
        .logEvent(name: 'creatingPost', parameters: {'has_image': true});
    print('post');
  }

  Future<void> setScreenName({@required String name}) async {
    // sets the firebase screen name in the Event
    await _analytics
        .setCurrentScreen(screenName: name)
        .then((value) => print('Name is $name'));
    print('Set Screen Name');
  }

  Future logSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'email');
  }

  Future<void> setUserId() async {
    await _analytics.setUserId('1856474856534654');
    await _analytics.setUserProperty(name: 'TestIsWorking', value: 'OK');
    print('setUserId succeeded');
    print('Set User Id');
  }

  //  Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => HomeView(),
  //       //this name will be in the frebase Analytics console
  //       settings: RouteSettings(name: 'HomeView'),
  //     ));
}
