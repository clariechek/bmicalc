import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ChoiceChip3D(
            width: 150,
            height: 150,
            onSelected: () {},
            onUnSelected: () {},
            selected: (_gender == 1),
            child: Column(
              children: [
                // Male image
              ],
            ),
          ),
          ChoiceChip3D(
            width: 150,
            height: 150,
            onSelected: () {},
            onUnSelected: () {},
            selected: (_gender == 2),
            child: Column(
              children: [
                // Female image
              ],
            ),
          )
        ],
      ),
    );
  }
}
