import 'package:diary_baby/screen_allergy/event.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;
  Event({required this.title});

  @override
  String toString() => title;
}
