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
      body: SingleChildScrollView(
        child: Column(
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
                    Text(result.bmiCategory.category,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                    Text("(BMI is ${result.bmiValue < 18.5 ? "less than 18.5" : ((result.bmiValue >= 18.5 && result.bmiValue <= 24.9) ? "Normal": "greater than 24.9")  })",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                    ),),
                
                    SizedBox(
                      height: 20,
                    ),
                    
                    Text(result.bmiCategory.bmiDesc,
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
    category = "Underweight";
    bmiDesc = """Underweight indicates a body weight that is too low for a person's height, potentially resulting in inadequate energy reserves or nutritional deficiencies.

Implications:

    Increased risk of weakened immune function.
    Higher susceptibility to osteoporosis (weak bones).
    Potential anemia (low red blood cells).
    Risk of fertility issues, particularly in women.
    May indicate underlying health conditions such as malnutrition, eating disorders, or chronic illness.
""";
  }
  else if(bmiScore >= 18.5 && bmiScore <= 24.9) {
    // NORMAL
    category = "Normal";
    bmiDesc = """
      A healthy weight range that is associated with the lowest risk of developing weight-related health problems. It suggests that body weight is proportionate to height.

Implications:

    Typically indicates good overall health.
    Reduced risk of chronic diseases like heart disease, diabetes, and certain cancers.
    Does not guarantee health; a person with normal BMI might still have health risks due to lifestyle factors or fat distribution (e.g., visceral fat).
      """;
  }
  else if(bmiScore >= 25 && bmiScore <= 29.9){
    // OVERWEIGHT
     category = "Overweight";
    bmiDesc = """
     Excess body weight relative to height. While not considered obese, being overweight can act as a precursor to more severe health risks if left unmanaged.

Implications:

    Higher likelihood of developing prediabetes or type 2 diabetes.
    Increased risk of cardiovascular conditions such as hypertension (high blood pressure) and atherosclerosis.
    Strain on joints, leading to a higher risk of arthritis.
    May lead to psychological effects like low self-esteem or body image concerns.

      """;
  }
  else if(bmiScore >= 30 && bmiScore <= 34.9) {
    // obese
     category = "Obese";
    bmiDesc = """
     Mild obesity, where body weight is substantially higher than normal, increasing the risk of chronic health conditions.

Implications:

    Greater risk of type 2 diabetes, heart disease, and stroke.
    Sleep disorders like obstructive sleep apnea.
    Joint and mobility issues due to excess weight.
      """;
  }
  else if (bmiScore >= 35 && bmiScore <= 39.9) {
    // moderately obese
     category = "Moderate Obese";
    bmiDesc = """
     Moderate obesity with more pronounced health risks than Class 1. Intervention and lifestyle changes are usually necessary.

Implications:

    Higher chances of developing severe chronic conditions (e.g., kidney disease).
    Greater risk of complications from surgery or medical procedures.
    Reduced mobility and higher chance of disability due to weight-related joint strain.

      """;
  }
  else if(bmiScore >= 40) {
    // extreme
     category = "Extreme Obese";
    bmiDesc = """
     Also known as "morbid obesity" or "extreme obesity," this category represents dangerously high body weight relative to height.

Implications:

    Significant risk of life-threatening conditions like cardiovascular diseases, respiratory issues, and some cancers.
    Severe impact on mental health, including depression or anxiety due to social stigma.
    Difficulty in performing daily activities due to physical limitations.

      """;
  }
  return BMICategory(category: category, bmiScore: bmiScore.toString(), bmiDesc: bmiDesc);
}