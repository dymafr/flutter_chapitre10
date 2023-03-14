import 'package:flutter/material.dart';
import '../../models/city_model.dart';
import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<City> cities = [
    City(name: 'Paris', image: 'assets/images/paris.jpg'),
    City(name: 'Lyon', image: 'assets/images/lyon.jpg'),
    City(name: 'Nice', image: 'assets/images/nice.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    cities.map((city) => print(city));

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Dyma Trip'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cities
              .map((city) => CityCard(
              city: city
          ))
              .toList(),
        ),
      ),
    );
  }
}