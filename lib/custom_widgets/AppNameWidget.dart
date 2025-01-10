
import 'package:flutter/material.dart';

class Appnamewidget extends StatelessWidget {
 Appnamewidget({super.key, required this.appNameAlignment});

  MainAxisAlignment appNameAlignment = MainAxisAlignment.start;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: appNameAlignment,
      spacing: 5,
      children: [
         Text("BMI",
              style: TextStyle(
                color: themeColor(),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),

Text("Buddy",
              style: TextStyle(
                color: themeColor(),
                fontSize: 20,
              ),),

      ],
    );
  }
}

Color themeColor() => Color.fromARGB(255, 68, 87, 255);