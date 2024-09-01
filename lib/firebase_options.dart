// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCJ8LGfV9gbJ2O6hDUpeIHVFm55mBY4dWU',
    appId: '1:146038699830:web:5cd58c457be691a5d9e597',
    messagingSenderId: '146038699830',
    projectId: 'iu-software-project',
    authDomain: 'iu-software-project.firebaseapp.com',
    storageBucket: 'iu-software-project.appspot.com',
    measurementId: 'G-85R2B16N4C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBKtTXg8b496qunEIVxvM-Zmei_5u4kTU',
    appId: '1:146038699830:android:fa0795d6c9957fe9d9e597',
    messagingSenderId: '146038699830',
    projectId: 'iu-software-project',
    storageBucket: 'iu-software-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCruVluMJb3mnzL0hLu8dRiBOMEW7rQ-jk',
    appId: '1:146038699830:ios:b44db8a31a9ad49fd9e597',
    messagingSenderId: '146038699830',
    projectId: 'iu-software-project',
    storageBucket: 'iu-software-project.appspot.com',
    iosBundleId: 'com.example.chrisDevApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCruVluMJb3mnzL0hLu8dRiBOMEW7rQ-jk',
    appId: '1:146038699830:ios:b44db8a31a9ad49fd9e597',
    messagingSenderId: '146038699830',
    projectId: 'iu-software-project',
    storageBucket: 'iu-software-project.appspot.com',
    iosBundleId: 'com.example.chrisDevApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCJ8LGfV9gbJ2O6hDUpeIHVFm55mBY4dWU',
    appId: '1:146038699830:web:7a0e4dcc39bfa016d9e597',
    messagingSenderId: '146038699830',
    projectId: 'iu-software-project',
    authDomain: 'iu-software-project.firebaseapp.com',
    storageBucket: 'iu-software-project.appspot.com',
    measurementId: 'G-0DVTQB7LE2',
  );
}
