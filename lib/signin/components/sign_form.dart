

import 'package:flutter/material.dart';
import 'package:on_boarding/components/custom_suffix_icon.dart';
import 'package:on_boarding/components/default_button.dart';
import 'package:on_boarding/components/form_error.dart';
import 'package:on_boarding/constants.dart';
import 'package:on_boarding/onboarding/onboarding_screen.dart';
import 'package:on_boarding/size_config.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if(!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}){
    if(errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenWidth(30),),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenWidth(30),),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value){
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text('Remember me'),
            ],
          ),
          FormError(errors: errors,),
          SizedBox(height: getProportionateScreenWidth(20),),
          DefaultButton(
            text: "Continue",
            press: (){
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
                Navigator.pushNamed(context, OnBoardingScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField(){
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kPassNullError);
        }else if(value.length >= 8){
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value){
        if(value.isEmpty){
          addError(error: kPassNullError);
          return "";
        }else if(value.length < 8){
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon:  CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg",)
      ),
    );
  }

  TextFormField buildEmailFormField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kEmailNullError);
        }else if(emailValidatorRegExp.hasMatch(value)){
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value){
        if(value.isEmpty){
          addError(error: kEmailNullError);
          return "";
        }else if(!emailValidatorRegExp.hasMatch(value)){
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon:  CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg",)
      ),
    );
  }
}
