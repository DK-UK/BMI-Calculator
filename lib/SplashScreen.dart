import 'dart:async';

import 'package:bmi_calculator/InfoScreen.dart';
import 'package:bmi_calculator/custom_widgets/AppNameWidget.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();

   // TODO: implement initState
    Timer(Duration(seconds: 3), () {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return Infoscreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
      body: Center(
        child: Container(
          child: Appnamewidget(appNameAlignment: MainAxisAlignment.center),
          ),
      ),
    );
  }
}