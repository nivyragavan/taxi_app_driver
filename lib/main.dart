import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:taxi_driver_app/mainScreens/main_screen.dart';
import 'package:taxi_driver_app/splashScreen/splash_screen.dart';
import 'constants/colors.dart';
import 'infoHandler/app_info.dart';

AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}');
}


void main() async{
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var driverId = box.read('driverId');
    print('=====driverId ${driverId}=====');
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: blueGreen));
    WidgetsFlutterBinding.ensureInitialized();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi Vendor App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home:driverId == null ? const MySplashScreen() : MainScreen(),
    );
  }
}