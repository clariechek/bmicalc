import 'package:bmicalc/constants.dart';
import 'package:flutter/material.dart';
import 'package:input_slider/input_slider.dart';

class HeightWidget extends StatefulWidget {
  final Function(double) onChange;

  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  double _height = 150.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(),
          color: darkBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                "Height (cm)",
                style: widgetTextStyle,
              ),
              InputSlider(
                onChange: (double value) {
                  setState(() {
                    print("change: $value");
                    _height = value;
                  });
                  widget.onChange(_height);
                },
                min: 0.0,
                max: 240.0,
                decimalPlaces: 1,
                defaultValue: 150.0,
                textFieldStyle: widgetTextStyle,
                leading: Icon(Icons.height, size: 80),
              ),
            ],
          ),
        ));
  }
}
