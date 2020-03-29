import 'package:flutter/material.dart';
import 'package:popgram/pop_home.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopGram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
        textTheme: TextTheme(title: TextStyle(color: Colors.black))
      ),
      home: PopHome()
    );
  }
}