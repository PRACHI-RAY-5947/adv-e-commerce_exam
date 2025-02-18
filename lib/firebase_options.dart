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
    apiKey: 'AIzaSyBMqarM-j-stcjCp--A4wgf_te4KOtEz1I',
    appId: '1:492196288552:web:f70b9c2ff2485a9e83bd1d',
    messagingSenderId: '492196288552',
    projectId: 'e-commerce-exam',
    authDomain: 'e-commerce-exam.firebaseapp.com',
    storageBucket: 'e-commerce-exam.appspot.com',
    measurementId: 'G-SQ3G63TT4E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqaObJT0Rc1E_5Q3swiTum8-UwoQvnfqA',
    appId: '1:492196288552:android:6662d749f95923cc83bd1d',
    messagingSenderId: '492196288552',
    projectId: 'e-commerce-exam',
    storageBucket: 'e-commerce-exam.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRiMMA7LMvSUWuso6mJVDlReL0hn2Egys',
    appId: '1:492196288552:ios:5825aea406c0e66b83bd1d',
    messagingSenderId: '492196288552',
    projectId: 'e-commerce-exam',
    storageBucket: 'e-commerce-exam.appspot.com',
    iosBundleId: 'com.example.contactDiary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRiMMA7LMvSUWuso6mJVDlReL0hn2Egys',
    appId: '1:492196288552:ios:5825aea406c0e66b83bd1d',
    messagingSenderId: '492196288552',
    projectId: 'e-commerce-exam',
    storageBucket: 'e-commerce-exam.appspot.com',
    iosBundleId: 'com.example.contactDiary',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMqarM-j-stcjCp--A4wgf_te4KOtEz1I',
    appId: '1:492196288552:web:d5c3ea5a2e8e070e83bd1d',
    messagingSenderId: '492196288552',
    projectId: 'e-commerce-exam',
    authDomain: 'e-commerce-exam.firebaseapp.com',
    storageBucket: 'e-commerce-exam.appspot.com',
    measurementId: 'G-636KNPK0DQ',
  );
}
