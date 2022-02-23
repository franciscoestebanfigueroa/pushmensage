import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static String router = 'home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
        child: Text(router),
      ),
    );
  }
}
