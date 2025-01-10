import 'package:bmi_calculator/BMIResultScreen.dart';
import 'package:bmi_calculator/InfoScreen.dart';
import 'package:bmi_calculator/custom_widgets/AppNameWidget.dart';
import 'package:bmi_calculator/custom_widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String name = "";

  String? errorName;

  String address = "";

  String? errorAddress;

  int years = 0;
  String DOB = "";

  String? errorDOB;

  double height = 0.0;

  String? errorHeight;

  double weight = 0.0;

  String? errorWeight;

  double bmiValue = 0.0;

  @override
  Widget build(BuildContext context) {

    print("erroName : $errorName --- address : $address -- dob : height : $height -- weight : $weight");
    return Scaffold(
      appBar: AppBar(
        title: Appnamewidget(appNameAlignment: MainAxisAlignment.start),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              // Name
              Customtextfield(
                  label: "Name",
                  errorMsg: errorName,
                  onChanged: (value) {
                    name = value;
                    errorName = value.isNotEmpty ? null : null;
                    setState(() {
                      
                    });
                  },
                  onTap: null,
                  readOnly: null),

              // Address
              Customtextfield(
                  label: "Address",
                  errorMsg: errorAddress,
                  onChanged: (value) {
                    address = value;
                    errorAddress = value.isNotEmpty ? null : null;
                    setState(() {
                      
                    });
                  },
                  onTap: null,
                  readOnly: null),

              // DOB
              Customtextfield(
                  label: "Date of Birth",
                  errorMsg: errorDOB,
                  hint: DOB,
                  onChanged: (value) {},
                  onTap: () async {
                    print("ON TTAP");
                    var dob = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025));
                      
                      DOB = "${dob?.day}/${dob?.month}/${dob?.year}";
                    years = calculateBOD(dob!);

                    
                    print("DOB : $dob");
                    setState(() {
                      
                    });
                  },
                  readOnly: true),

              // Gender
              Text(
                "Gender",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Card(
                          color: null,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/man.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        Text("Male")
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/woman.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        Text("Female")
                      ],
                    ),
                  )
                ],
              ),

              // Height
              Customtextfield(
                label: "Height (cm)",
                errorMsg: errorHeight,
                onChanged: (value) {
                  height = (value.length > 0) ? double.parse(value) : 0.0;
                  errorHeight = height <= 0.0 ? null : null;
                    setState(() {
                      
                    });
                },
                onTap: null,
                readOnly: null,
                keyboardType: TextInputType.numberWithOptions(),
              ),

              // Weight
              Customtextfield(
                label: "Weight (kg)",
                errorMsg: errorWeight,
                onChanged: (value) {
                  weight = (value.length > 0) ? double.parse(value) : 0.0;
                  errorWeight = weight <= 0.0 ? null : null;
                    setState(() {
                      
                    });
                },
                onTap: null,
                readOnly: null,
                keyboardType: TextInputType.numberWithOptions(),
              ),

              Container(
                width: double.infinity,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text("Calculate BMI"),
                    ),
                    onPressed: () {
                      if (name.isEmpty) {
                        errorName = "Name is required";
                      } else if (address.isEmpty) {
                        errorAddress = "Address is required";
                      } else if (years <= 0) {
                        errorDOB = "DOB is required";
                      } else if (height <= 0.0) {
                        errorHeight = "Invalid height";
                      } else if (weight <= 0.0) {
                        errorWeight = "Invalid weight";
                      } else {
                        var bmi = (weight / ((height / 100) * (height / 100)));
                        BMIResult result = BMIResult(name, address, years, height, weight, bmi);
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Bmiresultscreen(result: result,);
                        }));
                      }
                      setState(() {
                        
                      });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

int calculateBOD(DateTime date) {
  var current = DateTime.now();
  var years = current.year - date.year;
  return years;
}

class BMIResult {
  const BMIResult(this.name, this.address, this.years, this.height, this.weight,
      this.bmiValue);

  final String name;

  final String address;

  final int years;

  final double height;

  final double weight;

  final double bmiValue;
}
