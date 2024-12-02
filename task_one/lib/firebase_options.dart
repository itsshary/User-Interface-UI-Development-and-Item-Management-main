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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB8FQuooTspzl6fztpI_tfHCzGy6MfiNQQ',
    appId: '1:438102540611:web:9e52c1a31756837556eff6',
    messagingSenderId: '438102540611',
    projectId: 'softwaretaskapp',
    authDomain: 'softwaretaskapp.firebaseapp.com',
    storageBucket: 'softwaretaskapp.firebasestorage.app',
    measurementId: 'G-7TSM649L4W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUsovzVtKCZmJ43wiM7XAC4KO2xkifC5A',
    appId: '1:438102540611:android:09f8d3e913ebfe1a56eff6',
    messagingSenderId: '438102540611',
    projectId: 'softwaretaskapp',
    storageBucket: 'softwaretaskapp.firebasestorage.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA1a16_30bYmBZx3Af1zP8XzPnMY0ocCnk',
    appId: '1:438102540611:ios:28f2f0bb8fd50f6956eff6',
    messagingSenderId: '438102540611',
    projectId: 'softwaretaskapp',
    storageBucket: 'softwaretaskapp.firebasestorage.app',
    iosBundleId: 'com.example.taskOne',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB8FQuooTspzl6fztpI_tfHCzGy6MfiNQQ',
    appId: '1:438102540611:web:182c970ff302c9c956eff6',
    messagingSenderId: '438102540611',
    projectId: 'softwaretaskapp',
    authDomain: 'softwaretaskapp.firebaseapp.com',
    storageBucket: 'softwaretaskapp.firebasestorage.app',
    measurementId: 'G-YF69EZHL34',
  );
}
