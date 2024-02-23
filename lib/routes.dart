
import 'package:digital_attendance/screens/login_screen.dart';
import 'package:digital_attendance/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginPage.routeName: (context) => LoginPage(),

  //HomeScreen.routeName: (context) => HomeScreen(),
  //MyProfileScreen.routeName: (context) => MyProfileScreen(),
  //FeeScreen.routeName: (context) => FeeScreen(),
  //AssignmentScreen.routeName: (context) => AssignmentScreen(),
  //DateSheetScreen.routeName: (context) => DateSheetScreen(),
};