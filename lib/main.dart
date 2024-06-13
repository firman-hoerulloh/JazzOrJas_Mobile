import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/models/Product.dart';
import 'routes.dart';
import 'theme.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: FirebaseOptions(
  apiKey: "AIzaSyBB0dBQeTFxVBgcrm10gktrQc5aU_6mjX0", 
  appId: "1:931033159054:android:42cd80b8ceec5e390cc0df", 
  messagingSenderId: "931033159054", 
  projectId: "jazzorjas-4a781")
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
