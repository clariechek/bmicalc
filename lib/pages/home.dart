// import 'package:bmicalc/components/calculateWidget.dart';
import 'package:bmicalc/components/genderWidget.dart';
import 'package:bmicalc/components/heightWidget.dart';
import 'package:bmicalc/components/weightWidget.dart';
import 'package:bmicalc/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _gender = 0;
  double _height = 150.0;
  double _weight = 50.0;
  bool _isFinished = false;
  double _bmi = 0;

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
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderWidget(
                onChange: (genderVal) {
                  _gender = genderVal;
                },
              ),
              Padding(padding: const EdgeInsets.all(10)),
              HeightWidget(
                onChange: (heightVal) {
                  _height = heightVal;
                },
              ),
              Padding(padding: const EdgeInsets.all(10)),
              WeightWidget(
                onChange: (weightVal) {
                  _weight = weightVal;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, right: 20, left: 20),
                child: SwipeableButtonView(
                  isFinished: _isFinished,
                  onFinish: () async {
                    await Navigator.push(
                        context,
                        PageTransition(
                            child: Result(
                              bmi: _bmi,
                            ),
                            type: PageTransitionType.fade));

                    setState(() {
                      _isFinished = false;
                    });
                  },
                  onWaitingProcess: () {
                    //Calculate BMI here
                    calculateBmi();

                    Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        _isFinished = true;
                      });
                    });
                  },
                  activeColor: const Color.fromARGB(255, 60, 80, 165),
                  buttonWidget: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(255, 60, 80, 165),
                  ),
                  buttonText: "CALCULATE",
                  buttontextstyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }

  void calculateBmi() {
    _bmi = _weight / pow(_height / 100, 2);
  }
}
