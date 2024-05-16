import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:greenvilllage/core/init_app.dart';
import 'package:greenvilllage/pages/splash/splash.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'launch_background',
        ),
      ),
    );
  }
}

void main() async {
  print("test");
  await InitApp.init_db();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configLoading();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await ScreenUtil.ensureScreenSize(); // await setupFlutterNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(347, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (_, child) {
          return RefreshConfiguration(
            headerBuilder: () =>
                const WaterDropHeader(), // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
            footerBuilder: () =>
                const ClassicFooter(), // Configure default bottom indicator
            headerTriggerDistance:
                80.0, // header trigger refresh trigger distance
            springDescription: const SpringDescription(
                stiffness: 170,
                damping: 16,
                mass:
                    1.9), // custom spring back animate,the props meaning see the flutter api
            maxOverScrollExtent:
                100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
            maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
            enableScrollWhenRefreshCompleted:
                true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
            enableLoadingWhenFailed:
                true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
            hideFooterWhenNotFull:
                false, // Disable pull-up to load more functionality when Viewport is less than one screen
            enableBallisticLoad: true,
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: const Color(0xffF5BB2E)),
                useMaterial3: false,
                scaffoldBackgroundColor: const Color(0xFFFDFDFD),
                primaryColor: const Color(0xff28635F),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  scrolledUnderElevation: 1,
                  centerTitle: true,
                ),
                cardTheme: CardTheme(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff28635F),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                fontFamily: 'thesans',
              ),
              locale: const Locale('ar', 'SA'),
              home: SplashPage(),
              builder: EasyLoading.init(),
            ),
          );
        });
  }
}
