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
    apiKey: 'AIzaSyDMMSehH8_m35ZyrNZymBvkAG9xC702YJE',
    appId: '1:868331640642:web:d9ecc4e9bddb3784f39adb',
    messagingSenderId: '868331640642',
    projectId: 'super-admin-antriajaa-web',
    authDomain: 'super-admin-antriajaa-web.firebaseapp.com',
    storageBucket: 'super-admin-antriajaa-web.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCk3SApXRwcxDA-HPA4N9PgwoGFmapAp5s',
    appId: '1:868331640642:android:13ea11217f7ba64bf39adb',
    messagingSenderId: '868331640642',
    projectId: 'super-admin-antriajaa-web',
    storageBucket: 'super-admin-antriajaa-web.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHUVuPS7ik1yYfyi6wYRGEuDJlUO_PRdY',
    appId: '1:868331640642:ios:ab1bbf7580901f52f39adb',
    messagingSenderId: '868331640642',
    projectId: 'super-admin-antriajaa-web',
    storageBucket: 'super-admin-antriajaa-web.appspot.com',
    iosClientId: '868331640642-pvovq068rh0bgegn82bvakp8fapjfnp5.apps.googleusercontent.com',
    iosBundleId: 'com.example.antri',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHUVuPS7ik1yYfyi6wYRGEuDJlUO_PRdY',
    appId: '1:868331640642:ios:153b43d7fa8d52a7f39adb',
    messagingSenderId: '868331640642',
    projectId: 'super-admin-antriajaa-web',
    storageBucket: 'super-admin-antriajaa-web.appspot.com',
    iosClientId: '868331640642-a5lp6v9j7gv2eke2q6g79tuu8duiuo2k.apps.googleusercontent.com',
    iosBundleId: 'com.example.antri.RunnerTests',
  );
}