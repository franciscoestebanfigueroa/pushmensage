import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Messaging {
  static FirebaseMessaging instanciaMessaging = FirebaseMessaging.instance;
  static String? token;

  static Future _appDeFondo(RemoteMessage mensaje) async {
    print('app de fondo ${mensaje.messageId}');
  }

  static Future _appAbierta(RemoteMessage mensaje) async {
    print('App abierta ${mensaje.notification!.body}');
  }

  static Future _appCerada(RemoteMessage mensaje) async {
    print('app cerada ${mensaje.messageId}');
  }

  static Future initApp() async {
    token = await instanciaMessaging.getToken();
    print('token $token');

    FirebaseMessaging.onMessage.listen(_appAbierta);
    FirebaseMessaging.onMessageOpenedApp.listen(_appCerada);
    FirebaseMessaging.onBackgroundMessage(_appDeFondo);
  }
}
