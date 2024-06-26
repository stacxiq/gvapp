// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBX3pH-uVZvJLC-jmNGoNJmmAY3c0N0528',
    appId: '1:902174519201:web:51c4628007e79e34f1e5e0',
    messagingSenderId: '902174519201',
    projectId: 'greenvillage-a5580',
    authDomain: 'greenvillage-a5580.firebaseapp.com',
    storageBucket: 'greenvillage-a5580.appspot.com',
    measurementId: 'G-7WKSRJBG84',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCc4u_ahi96rq6t14c6IPFGRjzJW7DvGzM',
    appId: '1:902174519201:android:28e4464cda019cd9f1e5e0',
    messagingSenderId: '902174519201',
    projectId: 'greenvillage-a5580',
    storageBucket: 'greenvillage-a5580.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9EiZ09hkMjXqgyocE4vcZUGKMy-hM6rI',
    appId: '1:902174519201:ios:8452574eaefb4580f1e5e0',
    messagingSenderId: '902174519201',
    projectId: 'greenvillage-a5580',
    storageBucket: 'greenvillage-a5580.appspot.com',
    iosBundleId: 'com.advicts.greenvillage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9EiZ09hkMjXqgyocE4vcZUGKMy-hM6rI',
    appId: '1:902174519201:ios:b27b1f7912d0ccc2f1e5e0',
    messagingSenderId: '902174519201',
    projectId: 'greenvillage-a5580',
    storageBucket: 'greenvillage-a5580.appspot.com',
    iosBundleId: 'com.advicts.greenvillage.RunnerTests',
  );
}
