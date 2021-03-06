import 'package:flutter/material.dart';
import 'package:on_boarding/onboarding/onboarding_screen.dart';
import 'package:on_boarding/routes.dart';
import 'package:on_boarding/theme.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.white,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: OnBoardingScreen.routeName,
      routes: routes,
    );
  }
}