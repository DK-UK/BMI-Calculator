import 'package:bmi_calculator/custom_widgets/AppNameWidget.dart';
import 'package:flutter/material.dart';

class Infoscreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfoScreenState();
  }
}

class _InfoScreenState extends State<Infoscreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Appnamewidget(appNameAlignment: MainAxisAlignment.start),
    
      ),
      body: Column(
        children: [
          
          Expanded(
            flex: 1,
            child: Center(child: Image.asset("assets/info_screen.png"))),


          Expanded(
            flex: 1,
            child: Container(
              width : double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
              ),
              child : Column(
                children : [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 12, 12),
                      child: RichText(
                        text: TextSpan(
                                        
                          children: [
                            TextSpan(
                              text: "Unveiling the \n Secrets",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            TextSpan(
                              text: " of Your Body's Balance!",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w300
                              )
                            ),
                           
                          ]
                      )),
                    ),

                    Text("Easily calculate your BodyMass Index (BMI) by entering your height and weight.",
                    style: TextStyle(
                      color: Colors.white
                    ),),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        child: MaterialButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                        
                        }, child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Get started"),
                        )),
                      ),
                    )
                ]
              )
            ),
          )
        ],
      ),
    );
  }
}