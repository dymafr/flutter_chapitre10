import 'package:flutter/material.dart';
import '../../../models/activity_model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList(
      {super.key, required this.activities, required this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(activity.image),
            ),
            title: Text(activity.name),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () => deleteTripActivity(activity.id),
            ),
          ),
        );
      },
      itemCount: activities.length,
    );
  }
}