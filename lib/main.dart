import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("01884edd-3182-432c-a706-e9831f4c7cc5");
  OneSignal.Notifications.requestPermission(true);
  //Instead this code we can also use In-App Message for Notification Allow request prompt.
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}



