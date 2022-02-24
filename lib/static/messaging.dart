import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class Messaging {
  static FirebaseMessaging instanciaMessaging = FirebaseMessaging.instance;
  static String? token;

  static StreamController<String> _streamController =
      StreamController.broadcast();

  static Stream<String> get getStreamMensage => _streamController.stream;

  static clouseStream() {
    _streamController.close();
  }

  static Future _appDeFondo(RemoteMessage mensaje) async {
    _streamController.add(mensaje.notification?.body ?? 'no hay titulo');
    print('app de fondo ${mensaje.notification?.body ?? 'no hay data '}');
  }

  static Future _appAbierta(RemoteMessage mensaje) async {
    //se puede eliminar sink..
    _streamController.add(mensaje.data['nombre']);
    print('App abierta ${mensaje.notification?.body ?? 'sin data'}');
  }

  static Future _appEnApertura(RemoteMessage mensaje) async {
    _streamController.add(mensaje.notification?.body ?? 'no hay titulo');
    print('app en apertura ${mensaje.notification?.body ?? 'no hay datos'}');
  }

  static Future initApp() async {
    token = await instanciaMessaging.getToken();
    print('token $token');

    FirebaseMessaging.onMessage.listen(_appAbierta);
    FirebaseMessaging.onMessageOpenedApp.listen(_appEnApertura);
    FirebaseMessaging.onBackgroundMessage(_appDeFondo);
  }
}
