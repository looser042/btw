import 'package:btw/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 700.0,
      child: SplashScreen(
          seconds: 5,
          photoSize: 200.0,
          navigateAfterSeconds: new LoginScreen(),
          image: Image.asset(
            'asset/logo.png',
           fit: BoxFit.fill,
          ),
          backgroundColor: Colors.white,
          
      
      ),
    );
  }
}
