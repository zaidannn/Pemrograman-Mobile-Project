import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:fluttermine/app/controller/AccountController.dart';
import 'package:fluttermine/app/controller/DatabaseController.dart';
import 'package:fluttermine/app/controller/notification_handler.dart';
import 'package:fluttermine/app/view/accpage.dart';
import 'package:fluttermine/app/view/crudpage.dart'; // tambahkan import CrudScreen
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttermine/app/controller/auth_controller.dart';
import 'package:fluttermine/app/view/view.dart';
import 'package:fluttermine/firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register SharedPreferences as a dependency
  await Get.putAsync(() async => await SharedPreferences.getInstance());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(DatabaseController());
  Get.put(AccountController());

  // Create an instance of MyFirebaseMessaging
  MyFirebaseMessaging firebaseMessaging = MyFirebaseMessaging();

  // Call the init() and initLocalNotification() methods from that instance
  firebaseMessaging.init();
  // String? fcmToken = await FirebaseMessaging.instance.getToken();

  // print("FCM Token: $fcmToken");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, Key? key});
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: _authController.isLoggedIn.value ? '/home' : '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => LoginPage2()),
        GetPage(name: '/signup', page: () => SignupPage()),
        GetPage(
            name: '/crud',
            page: () => const CrudScreen()), // Tambahkan GetPage untuk CrudScreen
      ],
      home: _authController.isLoggedIn.value ? LoginPage2() : const LoginPage(),
    );
  }
}
