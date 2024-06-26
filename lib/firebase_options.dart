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
    apiKey: 'AIzaSyCJ6NbgSJq25UwIF1gPa2b9XDte6FUAhro',
    appId: '1:755077961261:web:030e32439e84b3a52ccaa4',
    messagingSenderId: '755077961261',
    projectId: 'mystoreapp-f96c9',
    authDomain: 'mystoreapp-f96c9.firebaseapp.com',
    storageBucket: 'mystoreapp-f96c9.appspot.com',
    measurementId: 'G-XWFD65YZM6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuz1sF7dxd8bEhSL6tYB5Iw_HmcTnNru8',
    appId: '1:755077961261:android:e694a0d36245e7112ccaa4',
    messagingSenderId: '755077961261',
    projectId: 'mystoreapp-f96c9',
    storageBucket: 'mystoreapp-f96c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAB3H2IAL2YJ9jdrosNQfYIgTnwDn2Ptfs',
    appId: '1:755077961261:ios:81e4f55970b474df2ccaa4',
    messagingSenderId: '755077961261',
    projectId: 'mystoreapp-f96c9',
    storageBucket: 'mystoreapp-f96c9.appspot.com',
    androidClientId: '755077961261-mrieqhe0iv49ld8m5ota9gq3c7i539u0.apps.googleusercontent.com',
    iosClientId: '755077961261-hl0ccshi5njbrkqcqlrunsg1btf71qjp.apps.googleusercontent.com',
    iosBundleId: 'mine.mystore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAB3H2IAL2YJ9jdrosNQfYIgTnwDn2Ptfs',
    appId: '1:755077961261:ios:bd09bd91dade3c802ccaa4',
    messagingSenderId: '755077961261',
    projectId: 'mystoreapp-f96c9',
    storageBucket: 'mystoreapp-f96c9.appspot.com',
    iosBundleId: 'com.example.mystore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCJ6NbgSJq25UwIF1gPa2b9XDte6FUAhro',
    appId: '1:755077961261:web:4886058eea7f6aef2ccaa4',
    messagingSenderId: '755077961261',
    projectId: 'mystoreapp-f96c9',
    authDomain: 'mystoreapp-f96c9.firebaseapp.com',
    storageBucket: 'mystoreapp-f96c9.appspot.com',
    measurementId: 'G-9PRHGCPEG1',
  );
}