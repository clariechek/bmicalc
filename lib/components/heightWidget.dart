import 'package:flutter/material.dart';
import 'package:input_slider/input_slider.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;

  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(),
      color: const Color.fromARGB(255, 60, 80, 165),
      child: Column(
        children: [
          Text(
            "Height (cm)",
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          InputSlider(
            onChange: (double value) {
              setState(() {
                print("change: $value");
              });
            },
            min: 0.0,
            max: 240.0,
            decimalPlaces: 1,
            defaultValue: 150.0,
            textFieldStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            leading: Icon(Icons.height),
          ),
        ],
      ),
    );
  }
}
