import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

const Color darkBlue = Color.fromARGB(255, 60, 80, 165);

const appBarHeaderTextStyle = TextStyle(fontSize: 30, color: Colors.white);

const widgetTextStyle =
    TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);

const genderTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);

const calculateTextStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

const bmiHeaderTextStyle = TextStyle(fontSize: 30);

const bmiResultTextStyle = TextStyle(fontSize: 40);

const bmiMessageTextStyle = TextStyle(fontSize: 20);

const gaugeMarkerLightTextStyle = TextStyle(fontSize: 15, color: Colors.black);

const gaugeMarkerDarkTextStyle = TextStyle(fontSize: 15, color: Colors.white);

final choiceChipSelectedStyle = ChoiceChip3DStyle(
    topColor: Colors.grey[200]!,
    backColor: Colors.grey,
    borderRadius: BorderRadius.circular(20));

final choiceChipUnselectedStyle = ChoiceChip3DStyle(
    topColor: Colors.white,
    backColor: Colors.grey[300]!,
    borderRadius: BorderRadius.circular(20));
