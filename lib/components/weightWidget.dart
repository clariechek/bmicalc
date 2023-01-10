import 'package:flutter/material.dart';

class WeightWidget extends StatefulWidget {
  const WeightWidget({super.key});

  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 60, 80, 165),
        elevation: 10,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            Icon(Icons.monitor_weight),
          ],
        ));
  }
}
