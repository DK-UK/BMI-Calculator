import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/custom_widgets/AppNameWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Bmiresultscreen extends StatelessWidget {
  const Bmiresultscreen({super.key, required this.result});

  final BMIResult result;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Appnamewidget(appNameAlignment: MainAxisAlignment.start),
      ),
      body: Column(
        children: [
          Card(
            color: themeColor(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(result.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white)),
                          Text(
                            result.address,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.white),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Text(
                            result.bmiValue.toStringAsPrecision(3),
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text("BMI Score",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white))
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/human_body.svg",
                        height: 150,
                        width: 50,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${result.years.toString()} years",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text("Age", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      Container(
                        height: 30,
                        color: Colors.white,
                        width: 2,
                      ),
                      Column(
                        children: [
                          Text("${result.height.toString()} cm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text("Height", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      Container(
                        height: 30,
                        color: Colors.white,
                        width: 2,
                      ),
                      Column(
                        children: [
                          
                          Text("${result.weight.toString()} kg",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text("Weight", style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Underweight",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                  Text("(BMI less than 18.5)",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                  ),),
              
                  SizedBox(
                    height: 20,
                  ),
                  
                  Text("Underweight indicates a body weight that is too low for a person's height, potentially resulting in inadequate energy reserves or nutritional deficiencies.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                  ),)
                ],
              ),
            ),
          )
          
        ],
      ),
    );
  }
}

class BMICategory {

 BMICategory({required this.category, required this.bmiScore, required this.bmiDesc});

 String category;
 String bmiScore;
 String bmiDesc;

}

BMICategory getBmiResult(double bmiScore) {

  String category = "";
  String bmiDesc = "";

  if(bmiScore < 18.5) {
    // UNDERWEIGHT
    bmiDesc = """
    Implications:

    Increased risk of weakened immune function.
    Higher susceptibility to osteoporosis (weak bones).
    Potential anemia (low red blood cells).
    Risk of fertility issues, particularly in women.
    May indicate underlying health conditions such as malnutrition, eating disorders, or chronic illness.
""";
  }
  else if(bmiScore >= 18.5 || bmiScore <= 24.9) {
    // NORMAL
  }
  else if(bmiScore >= 25 || bmiScore <= 29.9){
    // OVERWEIGHT
  }
  else if(bmiScore >= 30 || bmiScore <= 34.9) {
    // obese
  }
  else if (bmiScore >= 35 || bmiScore <= 39.9) {
    // moderately obese
  }
  else if(bmiScore >= 40) {
    // extreme
  }
  return BMICategory(category: category, bmiScore: bmiScore, bmiDesc: bmiDesc)
}