// import 'package:bmicalc/components/calculateWidget.dart';
import 'package:bmicalc/components/genderWidget.dart';
import 'package:bmicalc/components/heightWidget.dart';
import 'package:bmicalc/components/weightWidget.dart';
import 'package:bmicalc/config.dart';
import 'package:bmicalc/constants.dart';
import 'package:bmicalc/pages/result.dart';
import 'package:bmicalc/themeStateNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkBlue,
        title: const Text(
          "BMI Calculator",
          style: appBarHeaderTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                _isDark = currentTheme.switchTheme();
              },
              icon:
                  Icon(_isDark ? Icons.nightlight : Icons.nightlight_outlined))
        ],
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
                              isDark: _isDark,
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
                  activeColor: darkBlue,
                  buttonWidget: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: darkBlue,
                  ),
                  buttonText: "CALCULATE",
                  buttontextstyle: calculateTextStyle,
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

// class ThemeIconButton extends ConsumerWidget {
//   const ThemeIconButton({super.key});

//   get isDark => ThemeStateNotifier();

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           currentTheme.switchTheme();
//         },
//         icon: Icon(isDark ? Icons.nightlight : Icons.nightlight_outlined));
//   }
// }
