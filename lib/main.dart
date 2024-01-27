import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'core/utils/size_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
  Future main() async{
    // Ensure that the firebase database is initialized before runApp
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  } catch (e) {
    print('Firebase initialization failed: $e');
  }
  // Set landscape orientation
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'dyslexiadetectorapp',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.q1Screen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
