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
    // will appear on the rigt side of the debug console as 'USER PROPERTIES ACTIVE NOW history'
    //Intialized Only Once to take the ID
    await _analytics.setUserId('\$userId');
    print('Set User Id');
  }

  Future<void> setUserProperty() async {
    // will appear on the rigt side of the debug console as 'USER PROPERTIES ACTIVE NOW history'
    //Intialized Only Once to take the ID
    await _analytics.setUserProperty(name: 'User', value: 'UserInfo');
    print('Set User Id');
  }

  Future<void> testAllEventTypes() async {
    await _analytics.logAddPaymentInfo();
    await _analytics.logAddToCart(
      currency: 'USD',
      value: 123,
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24,
      origin: 'test origin',
      itemLocationId: 'test location id',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-17',
    );
    await _analytics.logAddToWishlist(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24,
      value: 123,
      currency: 'USD',
      itemLocationId: 'test location id',
    );
    await _analytics.logAppOpen();
    await _analytics.logBeginCheckout(
      value: 123,
      currency: 'USD',
      transactionId: 'test tx id',
      numberOfNights: 2,
      numberOfRooms: 3,
      numberOfPassengers: 4,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-17',
      travelClass: 'test travel class',
    );
    await _analytics.logCampaignDetails(
      source: 'test source',
      medium: 'test medium',
      campaign: 'test campaign',
      term: 'test term',
      content: 'test content',
      aclid: 'test aclid',
      cp1: 'test cp1',
    );
    await _analytics.logEarnVirtualCurrency(
      virtualCurrencyName: 'bitcoin',
      value: 345.66,
    );

    //COnversion Event
    await _analytics.logEcommercePurchase(
      currency: 'USD',
      value: 432.45,
      transactionId: 'test tx id',
      tax: 3.45,
      shipping: 5.67,
      coupon: 'test coupon',
      location: 'test location',
      numberOfNights: 3,
      numberOfRooms: 4,
      numberOfPassengers: 5,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-13',
      endDate: '2015-09-14',
      travelClass: 'test travel class',
    );
    await _analytics.logGenerateLead(
      currency: 'USD',
      value: 123.45,
    );
    await _analytics.logJoinGroup(
      groupId: 'test group id',
    );
    await _analytics.logLevelUp(
      level: 5,
      character: 'witch doctor',
    );
    await _analytics.logLogin();
    await _analytics.logPostScore(
      score: 1000000,
      level: 70,
      character: 'tiefling cleric',
    );
    await _analytics.logPresentOffer(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 6,
      price: 3.45,
      value: 67.8,
      currency: 'USD',
      itemLocationId: 'test item location id',
    );
    await _analytics.logPurchaseRefund(
      currency: 'USD',
      value: 45.67,
      transactionId: 'test tx id',
    );
    await _analytics.logSearch(
      searchTerm: 'hotel',
      numberOfNights: 2,
      numberOfRooms: 1,
      numberOfPassengers: 3,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-16',
      travelClass: 'test travel class',
    );
    await _analytics.logSelectContent(
      contentType: 'test content type',
      itemId: 'test item id',
    );
    await _analytics.logShare(
        contentType: 'test content type',
        itemId: 'test item id',
        method: 'facebook');
    await _analytics.logSignUp(
      signUpMethod: 'test sign up method',
    );
    await _analytics.logSpendVirtualCurrency(
      itemName: 'test item name',
      virtualCurrencyName: 'bitcoin',
      value: 34,
    );
    await _analytics.logTutorialBegin();
    await _analytics.logTutorialComplete();
    await _analytics.logUnlockAchievement(id: 'all Firebase API covered');
    await _analytics.logViewItem(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      itemLocationId: 'test item location id',
      price: 3.45,
      quantity: 6,
      currency: 'USD',
      value: 67.8,
      flightNumber: 'test flight number',
      numberOfPassengers: 3,
      numberOfRooms: 1,
      numberOfNights: 2,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-15',
      searchTerm: 'test search term',
      travelClass: 'test travel class',
    );
    await _analytics.logViewItemList(
      itemCategory: 'test item category',
    );
    await _analytics.logViewSearchResults(
      searchTerm: 'test search term',
    );
    print('All standard events logged successfully');
  }
  // Future<void> testSetAnalyticsCollectionEnabled() async {
  //   //Showed Nothing
  //   await _analytics.setAnalyticsCollectionEnabled(false);
  //   await _analytics.setAnalyticsCollectionEnabled(true);
  //   print('setAnalyticsCollectionEnabled succeeded');
  // }

  //  Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => HomeView(),
  //       //this name will be in the frebase Analytics console
  //       settings: RouteSettings(name: 'HomeView'),
  //     ));
}
