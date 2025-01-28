import 'package:flutter/material.dart';

class AlarmInfo{
  DateTime alarmDateTime;
  String description;
  bool isActive;
  List<Color> gradientColor;
  AlarmInfo(this.alarmDateTime, {required this.description, required this.isActive, required this.gradientColor});

}