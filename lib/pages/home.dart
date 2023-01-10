import 'package:bmicalc/components/genderWidget.dart';
import 'package:bmicalc/components/heightWidget.dart';
import 'package:bmicalc/components/weightWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _gender = 0;
  int _height = 150;
  int _weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 60, 80, 165),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderWidget(
                onChange: (genderVal) {
                  _gender = genderVal;
                },
              ),
              HeightWidget(
                onChange: (heightVal) {
                  _height = heightVal;
                },
              ),
              WeightWidget(
                  onChange: (weightVal) {
                    _weight = weightVal;
                  },
                  title: "Weight (kg)",
                  initValue: 50,
                  min: 0,
                  max: 200),

              // calculate
              // results page
            ],
          )),
    );
  }
}
