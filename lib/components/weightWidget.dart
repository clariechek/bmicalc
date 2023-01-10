import 'package:flutter/material.dart';
import 'package:input_slider/input_slider.dart';

class WeightWidget extends StatefulWidget {
  final Function(double) onChange;

  const WeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  double _weight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Card(
            color: const Color.fromARGB(255, 60, 80, 165),
            elevation: 10,
            shape: const RoundedRectangleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "Weight (kg)",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                InputSlider(
                  onChange: (double value) {
                    setState(() {
                      print("change: $value");
                      _weight = value;
                    });
                    widget.onChange(_weight);
                  },
                  min: 0.0,
                  max: 200.0,
                  decimalPlaces: 1,
                  defaultValue: 50.0,
                  textFieldStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  leading: Icon(Icons.monitor_weight, size: 80),
                ),
              ],
            )));
  }
}
