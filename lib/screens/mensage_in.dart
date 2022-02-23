import 'package:flutter/material.dart';

class MensageIn extends StatelessWidget {
  static String router = 'mensagein';
  const MensageIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 200,
          color: Colors.red,
          child: Text(
            router,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
