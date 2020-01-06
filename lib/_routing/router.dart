import 'package:flutter/material.dart';
import 'package:flutter_maps/_routing/routes.dart';
import 'package:flutter_maps/views/cart.dart';
import 'package:flutter_maps/views/details.dart';
import 'package:flutter_maps/views/home.dart';
import 'package:flutter_maps/views/login.dart';
import 'package:flutter_maps/map.dart';
import 'package:flutter_maps/views/tjongafie.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginRoute:
      return MaterialPageRoute(builder: (context) => Home());
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => FruitAppHomePage());
    case detailsViewRoute:
      return MaterialPageRoute(
        builder: (context) => FruitAppFruitDetails(fruit: settings.arguments),
      );
    case cartViewRoute:
      return MaterialPageRoute(builder: (context) => FruitAppCartView());
    case maps:
      return MaterialPageRoute(builder: (context) => MapsSample());
    case tjongafie:
      return MaterialPageRoute(builder: (context) => Tjongafie());
      break;
    default:
      return MaterialPageRoute(builder: (context) => MapsSample());
  }
}
