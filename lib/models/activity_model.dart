class Activity {
  String name;
  String image;
  String? id;
  String city;

  Activity(
      {required this.name,
        required this.city,
        this.id,
        required this.image});
}