import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;

  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.grey[200]!,
      backColor: Colors.grey,
      borderRadius: BorderRadius.circular(20));

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor: Colors.grey[300]!,
      borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              width: 150,
              height: 150,
              border: Border.all(color: Colors.grey),
              style: _gender == 1 ? selectedStyle : unselectedStyle,
              onSelected: () {
                setState(() {
                  _gender = 1;
                });
                widget.onChange(_gender);
              },
              onUnSelected: () {},
              selected: (_gender == 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/male.png",
                    width: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Male",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              )),
          const SizedBox(
            width: 30,
          ),
          ChoiceChip3D(
            width: 150,
            height: 150,
            border: Border.all(color: Colors.grey),
            style: _gender == 2 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            },
            selected: (_gender == 2),
            onUnSelected: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/female.png",
                  width: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Female",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }
}
