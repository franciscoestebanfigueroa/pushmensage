import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pushmensage/firebase_options.dart';
import 'package:pushmensage/screens/home.dart';
import 'package:pushmensage/screens/mensage_in.dart';
import 'package:pushmensage/static/messaging.dart';
import 'package:pushmensage/static/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //final messing = FirebaseMessaging.instance;
  //print('token ${await messing.getToken()}');

  Messaging.initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mensajes push',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MensageIn.router,
      routes: MyRouter.router,
      home: const Text('Flutter Demo Home Page'),
    );
  }
}
