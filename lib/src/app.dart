import 'package:flutter/material.dart';
import 'package:flutter_mobile_2school/src/ui/home/home_screen.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
