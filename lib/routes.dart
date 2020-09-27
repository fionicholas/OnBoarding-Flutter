
import 'package:flutter/material.dart';
import 'package:on_boarding/onboarding/onboarding_screen.dart';
import 'package:on_boarding/otp/otp_screen.dart';
import 'package:on_boarding/signin/signin_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  OTPScreen.routeName: (context) => OTPScreen(),
};