import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water/app/models/user.dart';

class MainController extends GetxController {
  var user = User(0, "", "", "", "", "", null).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }

  getUser() async {
    if (GetStorage().read('authenticated') &&
        GetStorage().read('authenticated') == true) {
      user.value = await User.fromJson(GetStorage().read('user'));
      print(user.value);
    }
  }

//   initializeNotification() {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()!
//         .requestPermission();

//    const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
// final DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
// final LinuxInitializationSettings initializationSettingsLinux =
//     LinuxInitializationSettings(
//         defaultActionName: 'Open notification');
// final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsDarwin,
//     macOS: initializationSettingsDarwin,
//     linux: initializationSettingsLinux);
// await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//     onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
//   }

//   void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//     await Navigator.push(
//       context,
//       MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
//     );
// }
}
