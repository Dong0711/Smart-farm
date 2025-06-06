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
    apiKey: 'AIzaSyAj2ePPgFzq9j1rQzXUJ4VpHs5pHMjGdDo',
    appId: '1:789451078094:web:56e59fc2e891eee64e939f',
    messagingSenderId: '789451078094',
    projectId: 'smartfarm-5d397',
    authDomain: 'smartfarm-5d397.firebaseapp.com',
    storageBucket: 'smartfarm-5d397.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbbaXfqhlEQouKGEiW0LLa8GziK9VwoOA',
    appId: '1:789451078094:android:b30e8314741c0ea34e939f',
    messagingSenderId: '789451078094',
    projectId: 'smartfarm-5d397',
    storageBucket: 'smartfarm-5d397.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZFKLkFnkyAdUIRiyaZlY1GhTbb3CWvsw',
    appId: '1:789451078094:ios:884415fda1c2acb04e939f',
    messagingSenderId: '789451078094',
    projectId: 'smartfarm-5d397',
    storageBucket: 'smartfarm-5d397.appspot.com',
    iosBundleId: 'com.example.farm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZFKLkFnkyAdUIRiyaZlY1GhTbb3CWvsw',
    appId: '1:789451078094:ios:602407032402dd3c4e939f',
    messagingSenderId: '789451078094',
    projectId: 'smartfarm-5d397',
    storageBucket: 'smartfarm-5d397.appspot.com',
    iosBundleId: 'com.example.farm.RunnerTests',
  );
}
