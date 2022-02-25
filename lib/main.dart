import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pushmensage/firebase_options.dart';
import 'package:pushmensage/screens/mensage_in.dart';
import 'package:pushmensage/static/messaging.dart';
import 'package:pushmensage/static/router.dart';

//para mandar desde postman
//en post https://fcm.googleapis.com/fcm/send
//en headers -> Authorization ----> key=[codigo autorizacion en engranaje, cloudmessagig --> clave del servidor]
// en body -->raw--> seleccionar JSON donde dice text
//
//y luego copiar cambiando to(tokens)
//{
//    "data":{
//            "nombre":"pep postman"
//           },
//    "notification":{
//                    "title":"postMan",
//                    "body":"Mensaje Postman"
//                  },
//    "to":"d0eFu3B9RhGDgsfwKlh164:APA91bH7msEcU3HBmTh-t1jQj9eSOvboXTpiSBcKT4_wyT0-4CaR-DJBHUNVQFqLXYjdsP0zQPvi0-OAcq1-8JFl1fqBvI4amcEqFAMY4vU357vHLx7c0Peklug8m-na4GD6lkXgos9i",
//    "priority":"high"
//}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //final messing = FirebaseMessaging.instance;
  //print('token ${await messing.getToken()}');

  Messaging.initApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  String data = '';
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessangeKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    Messaging.getStreamMensage.listen((event) {
      print('en _myApp $event');
      setState(() {
        widget.data = event;
      });
      scaffoldMessangeKey.currentState
          ?.showSnackBar(SnackBar(content: Text(event)));
      navigatorKey.currentState?.pushNamed(MensageIn.router, arguments: event);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessangeKey,
      title: 'Flutter Mensajes push',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: MensageIn.router,
      routes: MyRouter.router,
      home: Scaffold(
          body: Center(child: Text(' datos de stream ${widget.data}'))),
    );
  }
}
