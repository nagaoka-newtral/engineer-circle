// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:engineer_circle/global/config/environment.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        if (isProd) {
          return android;
        } else {
          return androidDev;
        }
      case TargetPlatform.iOS:
        if (isProd) {
          return ios;
        } else {
          return iosDev;
        }
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA72sQzNzr8JxiLD-i2sdrvy6dtp73Fa_A',
    appId: '1:226820269023:android:1fc68fd87dd358f9cd1a6a',
    messagingSenderId: '226820269023',
    projectId: 'engineer-circle',
    storageBucket: 'engineer-circle.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRMdwOvCSTSyd4feqQauAcKG7OU2EKp5g',
    appId: '1:226820269023:ios:40a38df21ba4281acd1a6a',
    messagingSenderId: '226820269023',
    projectId: 'engineer-circle',
    storageBucket: 'engineer-circle.appspot.com',
    iosBundleId: 'com.engineercircle.engineerCircle',
  );

  static const FirebaseOptions androidDev = FirebaseOptions(
    apiKey: 'AIzaSyBcIM05ww7K-HXQFrhhrWRbKJB5JJJYBxk',
    appId: '1:34416412021:android:edf1a7848f87b6f3b37f3c',
    messagingSenderId: '34416412021',
    projectId: 'engineer-circle-dev',
    storageBucket: 'engineer-circle-dev.appspot.com',
  );

  static const FirebaseOptions iosDev = FirebaseOptions(
    apiKey: 'AIzaSyDE2GcN_17ena7OjSzr6MoIulXXxawf5no',
    appId: '1:34416412021:ios:438850a9ff46f85eb37f3c',
    messagingSenderId: '34416412021',
    projectId: 'engineer-circle-dev',
    storageBucket: 'engineer-circle-dev.appspot.com',
    iosBundleId: 'com.engineercircle.engineerCircle',
  );
}
