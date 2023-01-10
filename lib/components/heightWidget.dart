import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  const HeightWidget({super.key});

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
          // Slider
        ],
      ),
    );
  }
}
