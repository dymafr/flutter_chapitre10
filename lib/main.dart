import 'package:flutter/material.dart';
import 'models/city_model.dart';
import 'views/city/city_view.dart';
import 'views/home/home_view.dart';
import 'views/404/not_found.dart';

void main() => runApp(const DymaTrip());

class DymaTrip extends StatelessWidget {
  const DymaTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.routeName: (context) => const HomeView(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == CityView.routeName) {
            final City city = settings.arguments as City;
            return MaterialPageRoute(builder: (context) {
              return CityView(city: city);
            });
          }
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const NotFound());
        });
  }
}