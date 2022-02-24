import 'package:flutter/material.dart';

class MensageIn extends StatelessWidget {
  static String router = 'mensagein';
  const MensageIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments ?? 'sin arg';
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 200,
          color: Colors.red,
          child: Text(
            arg.toString(),
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
