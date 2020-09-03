import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_boarding/signin/components/sign_form.dart';
import 'package:on_boarding/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: (SizeConfig.screenWidth * 0.04),
                ),
                Text(
                  'Welcome to Nikolai App',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sign in with your email and password',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: (SizeConfig.screenHeight * 0.08),
                ),
                SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
