import 'package:flutter/material.dart';
import '../data/data.dart' as data;
import '../models/activity_model.dart';

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({super.key, required super.child});

  static Data? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }

  static Data of(BuildContext context) {
    final Data? result = maybeOf(context);
    assert(result != null, 'No Data found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Data oldWidget) => true;
}