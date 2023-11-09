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
    apiKey: 'AIzaSyBxkFjV5z8uEQ1C0YDNEuMoN92N7xtXBYo',
    appId: '1:540691123390:web:6b1a347c39a2d9ddf1e2ef',
    messagingSenderId: '540691123390',
    projectId: 'michael-baking-app',
    authDomain: 'michael-baking-app.firebaseapp.com',
    storageBucket: 'michael-baking-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKUuN2H_MGKWP76eKqVIWg39p3gspA2s8',
    appId: '1:540691123390:android:9e6cc1cd9d443dbaf1e2ef',
    messagingSenderId: '540691123390',
    projectId: 'michael-baking-app',
    storageBucket: 'michael-baking-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDGcrMn8Im0hZcmiN5a1ZgLZ_kOMX4Rfw',
    appId: '1:540691123390:ios:860b86f538a0420ff1e2ef',
    messagingSenderId: '540691123390',
    projectId: 'michael-baking-app',
    storageBucket: 'michael-baking-app.appspot.com',
    iosClientId: '540691123390-j2kd693ntimrcv4v52nqjffj5jkohpll.apps.googleusercontent.com',
    iosBundleId: 'noassociatedwebsite.com.bakingapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDGcrMn8Im0hZcmiN5a1ZgLZ_kOMX4Rfw',
    appId: '1:540691123390:ios:f801bdc47859848ef1e2ef',
    messagingSenderId: '540691123390',
    projectId: 'michael-baking-app',
    storageBucket: 'michael-baking-app.appspot.com',
    iosClientId: '540691123390-3d4jar85iva1tjjig4euhraitjij6r1s.apps.googleusercontent.com',
    iosBundleId: 'noassociatedwebsite.com.bakingapp.RunnerTests',
  );
}
