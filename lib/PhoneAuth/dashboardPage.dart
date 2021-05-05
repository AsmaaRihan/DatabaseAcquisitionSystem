import 'package:Task/PhoneAuth/AuthService.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Welcome'),
          RaisedButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: Text('SignOut'),
          )
        ],
      ),
    );
  }
}
