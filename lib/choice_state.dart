import 'dart:ui';

import 'package:flutter/material.dart';

class ChoiceState {
  Color color;
  IconData iconData;

  ChoiceState({this.color, this.iconData});

  void setChoiceState(Color color, IconData iconData) {
    this.color = color;
    this.iconData = iconData;
  }
}