import 'package:flutter/material.dart';

class WeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const WeightWidget(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 60, 80, 165),
        elevation: 10,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            Icon(Icons.monitor_weight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color.fromARGB(255, 140, 189, 214),
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      if (counter > widget.min) {
                        counter--;
                      }
                    });
                    widget.onChange(counter);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  counter.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color.fromARGB(255, 140, 189, 214),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      if (counter < widget.max) {
                        counter++;
                      }
                    });
                    widget.onChange(counter);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
