import 'package:bmicalc/components/genderWidget.dart';
import 'package:bmicalc/components/heightWidget.dart';
import 'package:bmicalc/components/weightWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              GenderWidget(),
              HeightWidget(),
              WeightWidget(),
              // calculate
              // results page
            ],
          )),
    );
  }
}
