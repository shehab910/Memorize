import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memorize/choice_state.dart';

class Choices extends StatefulWidget {
  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {

  static const int NUM_OF_STATES_PER_CHOICE = 3;
  static const int NUM_OF_CHOICES = 3 - 1; //num of choices is 0 based

  List<List<ChoiceState>> allChoices = [];
  List<Color> bgColors;
  List<IconData> icons;
  Map rightChoice;

  Widget createState(int colorIndex, int iconIndex) { // A state is one of three colors and an icon on top, (((( three states is one choice ))))
    IconData iconData = icons[iconIndex];
    Color color = bgColors[colorIndex];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration:BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey[300], spreadRadius: 1)
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        child: Icon(
          iconData,
          size: 60,
        ),
      ),
    );
  }
  List<Color> listCloneColor(List<Color> original) {
    List<Color> clone = [];
    for(int i = 0; i < original.length; i++) {
      clone.add(original[i]);
    }
    return clone;
  }
  List<IconData> listCloneIcon(List<IconData> original) {
    List<IconData> clone = [];
    for(int i = 0; i < original.length; i++) {
      clone.add(original[i]);
    }
    return clone;
  }
  List<Widget> createChoice(int rightChoiceIndex, int index) {
    List<Widget> choice = [];

    /*List<Color> colors = [];
    colors = listCloneColor(bgColors);
    List<IconData> icon = [];
    icon = listCloneIcon(icons);
    for(int i = 0; i < NUM_OF_STATES_PER_CHOICE; i++) {
      if (rightChoiceIndex == index){
        choice.add(createState(rightChoice['color'][i], rightChoice['icon'][i]));
      } else {
        int colorIndex = Random.secure().nextInt(colors.length);
        int iconIndex = Random.secure().nextInt(icon.length);
        choice.add(createState(colorIndex, iconIndex));
        colors.removeAt(colorIndex);
        icon.removeAt(iconIndex);
      }
    }*/

    return choice;
  }
  int toBeRightChoice;
  @override
  void initState() {
    super.initState();
    allChoices = [];
    bgColors = [Colors.grey[700], Colors.blue,Colors.blueGrey,Colors.red,Colors.orange,Colors.amberAccent, Colors.green,Colors.lightGreen,Colors.blue[900]];
    icons = [Icons.cloud, Icons.flag, Icons.settings, Icons.delete, Icons.map, Icons.email, Icons.wb_sunny, Icons.access_alarm_outlined, Icons.account_box_rounded];
    toBeRightChoice = Random.secure().nextInt(NUM_OF_CHOICES);
  }

  @override
  Widget build(BuildContext context) {
    rightChoice = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Choose from below'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: FlatButton(
                  onPressed: (){

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: createChoice(toBeRightChoice, index),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: NUM_OF_CHOICES + 1,
      ),
    );
  }
}
