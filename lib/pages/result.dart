import 'package:bmicalc/constants.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class Result extends StatelessWidget {
  final double bmi;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  Result({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Results"),
        backgroundColor: darkBlue,
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your BMI",
                      style: bmiHeaderTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('UnderWeight', 18.5, Colors.red),
                        GaugeSegment('Normal', 6.4, Colors.green),
                        GaugeSegment('OverWeight', 5, Colors.orange),
                        GaugeSegment('Obese', 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        bmi.toStringAsFixed(1),
                        style: bmiResultTextStyle,
                      ),
                      currentValue: bmi.toDouble(),
                      needleColor: darkBlue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(fontSize: 30, color: bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      style: bmiMessageTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: darkBlue),
                            child: const Text("Re-calculate",
                                style: bmiMessageTextStyle)),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Share.share(
                                  "Your BMI is ${bmi.toStringAsFixed(1)}");
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: darkBlue),
                            child: const Text("Share",
                                style: bmiMessageTextStyle)),
                      ],
                    )
                  ]))),
    );
  }

  void setBmiInterpretation() {
    if (bmi > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "You're in the obese range.";
      bmiStatusColor = Colors.pink;
    } else if (bmi >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "You're in the overweight range.";
      bmiStatusColor = Colors.orange;
    } else if (bmi >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "You're in the healthy weight range.";
      bmiStatusColor = Colors.green;
    } else if (bmi < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "You're in the underweight range.";
      bmiStatusColor = Colors.red;
    }
  }
}
