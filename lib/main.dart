import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memorize/choice_state.dart';
import 'package:memorize/choices.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/' : (context) => Memorize(),
      '/choices' : (context) => Choices()
    },
  ));
}

class Memorize extends StatefulWidget {
  @override
  _MemorizeState createState() => _MemorizeState();
}

class _MemorizeState extends State<Memorize> {

  ChoiceState rightState;
  List<int> rightChoiceColor = [];
  List<int> rightChoiceIcon = [];
  List<ChoiceState> rightChoice = [];

  int bgColorsIndex = 0;
  List<Color> bgColors = [Colors.grey[700], Colors.blue,Colors.blueGrey,Colors.red,Colors.orange,Colors.amberAccent, Colors.green,Colors.lightGreen,Colors.blue[900]];
  int iconsIndex = 0;
  List<IconData> icons = [Icons.cloud, Icons.flag, Icons.settings, Icons.delete, Icons.map, Icons.email, Icons.wb_sunny, Icons.access_alarm_outlined, Icons.account_box_rounded];

  void randomize() {
   int prevBgColorsIndex = bgColorsIndex;
    while (true) {
      bgColorsIndex = Random.secure().nextInt(bgColors.length);
      if (bgColorsIndex != prevBgColorsIndex) {
        break;
      }
    }
    int prevIconsIndex = iconsIndex;
    while (true) {
      iconsIndex = Random.secure().nextInt(icons.length);
      if (iconsIndex != prevIconsIndex) {
        break;
      }
    }


   /* rightState.setChoiceState(bgColorsIndex, iconsIndex);
    print('$bgColorsIndex   ${rightState.colorIndex}');
    rightChoice.add(rightState);
    print('${rightChoice[0].colorIndex}');
    if (rightChoice.length > 2) {
      print(rightChoice[0].colorIndex);
      print(rightChoice[1].colorIndex);
      print(rightChoice[2].colorIndex);
      Navigator.pushNamed(context, '/choices', arguments: rightChoice);
    }*/
  }

 /* @override
  void initState() {
    super.initState();
    rightState = ChoiceState(colorIndex: 0, iconDataIndex: 0);
    randomize();
  }*/

  Color darken(Color color){
    double increaseToDarken = 1.3;
    color = color.withRed((color.red ~/ increaseToDarken));
    color = color.withGreen(color.green ~/ increaseToDarken);
    color = color.withBlue(color.blue ~/ increaseToDarken);
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Randomize',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: darken(bgColors[bgColorsIndex]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          setState(() {
            randomize();
          });
          /*rightChoiceColor.add(bgColorsIndex);
          rightChoiceIcon.add(iconsIndex);*/
          rightState.setChoiceState(bgColors[bgColorsIndex], icons[iconsIndex]);
          rightChoice.add(rightState);
          if (rightChoice.length > 2) {
            await Future.delayed(Duration(seconds: 1));
            Navigator.pushNamed(context, '/choices', arguments: rightChoice);
          }
        },
        backgroundColor: darken(bgColors[bgColorsIndex]),
        child: Icon(
          Icons.next_plan_outlined,
          color: Colors.white,
        ),
      ),
      backgroundColor: bgColors[bgColorsIndex],
        body: Center(
          child: Icon(
            icons[iconsIndex],
            color: Colors.black,
            size: 200,
          ),
        ),
    );
  }
}
