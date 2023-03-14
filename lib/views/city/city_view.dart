import 'package:flutter/material.dart';
import '../../models/city_model.dart';
import 'widgets/trip_activity_list.dart';
import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';
import '../../data/data.dart' as data;
import '../../models/activity_model.dart';
import '../../models/trip_model.dart';

class CityView extends StatefulWidget {
  static String routeName = '/city';
  final List<Activity> activities = data.activities;
  final City city;

  CityView({super.key, required this.city});

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late Trip mytrip;
  late int index;
  late List<Activity> activities;

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], city: 'Paris', date: null);
    index = 0;
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  void setDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2030),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation du voyage'),
        actions: const <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: <Widget>[
          TripOverview(
            mytrip: mytrip,
            setDate: setDate,
            cityName: widget.city.name,
          ),
          Expanded(
            child: index == 0
                ? ActivityList(
              activities: widget.activities,
              selectedActivities: mytrip.activities,
              toggleActivity: toggleActivity,
            )
                : TripActivityList(
              activities: tripActivities,
              deleteTripActivity: deleteTripActivity,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Découverte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Mes activités',
          )
        ],
        onTap: switchIndex,
      ),
    );
  }
}