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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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
    apiKey: 'AIzaSyACZ7IJWkhYI_1SHntvHpdpvgyYWwLK3Qk',
    appId: '1:344313898434:android:23770a1041b195bc97e25b',
    messagingSenderId: '344313898434',
    projectId: 'freelancing-fyp-cf954',
    storageBucket: 'freelancing-fyp-cf954.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNGzgUQWMOmvbx7WHbAtKeImr48mkhL_U',
    appId: '1:344313898434:ios:27720b40d6f0021697e25b',
    messagingSenderId: '344313898434',
    projectId: 'freelancing-fyp-cf954',
    storageBucket: 'freelancing-fyp-cf954.appspot.com',
    androidClientId: '344313898434-jkmu4rf0kpnh2br6gfn4ierghjv4i11b.apps.googleusercontent.com',
    iosClientId: '344313898434-63et3h1jvbndnd7laud5kld646u59i6h.apps.googleusercontent.com',
    iosBundleId: 'com.example.freelancingFyp',
  );
}
