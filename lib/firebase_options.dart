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
    apiKey: 'AIzaSyCYC3l8zTtYg2gqq1P-88LHHcygNdl340k',
    appId: '1:151567160940:web:10650ed0bd251637b5ea49',
    messagingSenderId: '151567160940',
    projectId: 'fir-connection-test-44632',
    authDomain: 'fir-connection-test-44632.firebaseapp.com',
    storageBucket: 'fir-connection-test-44632.firebasestorage.app',
    measurementId: 'G-TZR69L4H46',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZHAZEFP-G-EVKAWre1aJ60SsJNU_dWoQ',
    appId: '1:151567160940:android:8a91a90c3808a01cb5ea49',
    messagingSenderId: '151567160940',
    projectId: 'fir-connection-test-44632',
    storageBucket: 'fir-connection-test-44632.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8-AyphVgkZsCdJ-7QeiasNQDumOYdxOE',
    appId: '1:151567160940:ios:226e7d327903a618b5ea49',
    messagingSenderId: '151567160940',
    projectId: 'fir-connection-test-44632',
    storageBucket: 'fir-connection-test-44632.firebasestorage.app',
    iosBundleId: 'com.example.firebaseConnectionTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8-AyphVgkZsCdJ-7QeiasNQDumOYdxOE',
    appId: '1:151567160940:ios:226e7d327903a618b5ea49',
    messagingSenderId: '151567160940',
    projectId: 'fir-connection-test-44632',
    storageBucket: 'fir-connection-test-44632.firebasestorage.app',
    iosBundleId: 'com.example.firebaseConnectionTest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCYC3l8zTtYg2gqq1P-88LHHcygNdl340k',
    appId: '1:151567160940:web:98f579c21d36d06bb5ea49',
    messagingSenderId: '151567160940',
    projectId: 'fir-connection-test-44632',
    authDomain: 'fir-connection-test-44632.firebaseapp.com',
    storageBucket: 'fir-connection-test-44632.firebasestorage.app',
    measurementId: 'G-8C71JEMSGB',
  );
}
