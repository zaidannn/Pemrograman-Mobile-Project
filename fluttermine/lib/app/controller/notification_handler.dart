import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyFirebaseMessaging {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  MyFirebaseMessaging() {
    // Inisialisasi notifikasi lokal dalam konstruktor
    initLocalNotification();
  }

  Future<void> init() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    _firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });

    // Handler ketika aplikasi berjalan
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Aplikasi berjalan: ${message.notification!.body}");
      // Tambahkan logika atau tampilkan notifikasi di sini
      _showNotification(message);
    });

    // Handler ketika aplikasi dalam background atau terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          "Aplikasi dalam background atau terminated: ${message.notification!.body}");
      // Tambahkan logika ketika notifikasi di-klik di sini
    });

    // Handler ketika aplikasi tidak berjalan
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("Aplikasi tidak berjalan: ${message.notification!.body}");
        // Tambahkan logika ketika notifikasi di-klik di sini
      }
    });
  }

  Future<void> initLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showNotification(RemoteMessage message) async {
    // Pastikan flutterLocalNotificationsPlugin telah diinisialisasi sebelum digunakan
    if (flutterLocalNotificationsPlugin == false) {
      print('Notifikasi lokal belum diinisialisasi.');
      return;
    }

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      // playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
      payload: message.data['payload'],
    );
  }
}
