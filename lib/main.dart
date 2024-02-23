

import 'package:digital_attendance/routes.dart';
import 'package:digital_attendance/screens/splash_screen.dart';
import 'package:digital_attendance/theme.dart';

import 'package:flutter/material.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Attendance',
        theme: CustomTheme().baseTheme,
        //initial route is splash screen
        //mean first screen
        initialRoute: SplashScreen.routeName,
        //define the routes file here in order to access the routes any where all over the app
       routes: routes,
        
      );
    
  }
}
