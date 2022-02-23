import 'package:flutter/widgets.dart';
import 'package:pushmensage/screens/home.dart';
import 'package:pushmensage/screens/mensage_in.dart';

class MyRouter {
  static Map<String, Widget Function(BuildContext)> router = {
    Home.router: (_) => const Home(),
    MensageIn.router: (_) => const MensageIn()
  };
}
