import 'package:flutter/material.dart';
import 'package:flutter_challenge_ripple/page_indicator.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'page Indicator',
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder:(BuildContext context ){
          return PageIndIcator();
        }
        ),
    );
  }
}