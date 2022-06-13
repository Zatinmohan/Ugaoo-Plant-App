import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class PushNotification extends GetxController {
  late FirebaseMessaging messaging;

  late FlutterLocalNotificationsPlugin notificationsPlugin;
  
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
      'id_channel', 'name_channel',
      importance: Importance.high);

  @override
  void onInit() async {
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) => print("Messenging: $value"));
    
    notificationsPlugin = FlutterLocalNotificationsPlugin();

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    FirebaseMessaging.onMessage.listen((event) {
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification?.android;

      if (notification != null && android != null) {
        notificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(_channel.id, _channel.name),
            ));
      }
    });

    super.onInit();
  }
}
