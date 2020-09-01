import 'package:flutter/material.dart';
import 'package:on_boarding/onboarding/body.dart';
import 'package:on_boarding/size_config.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = "/onBoarding";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
