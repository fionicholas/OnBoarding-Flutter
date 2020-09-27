import 'package:flutter/material.dart';
import 'package:on_boarding/components/default_button.dart';
import 'package:on_boarding/constants.dart';
import 'package:on_boarding/size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode field2FocusNode;
  FocusNode field3FocusNode;
  FocusNode field4FocusNode;

  @override
  void initState() {
    super.initState();
    field2FocusNode = FocusNode();
    field3FocusNode = FocusNode();
    field4FocusNode = FocusNode();
  }
  @override
  void dispose() {
    super.dispose();
    field2FocusNode.dispose();
    field3FocusNode.dispose();
    field4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode){
    if(value.length ==1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, field2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: field2FocusNode,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, field3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: field3FocusNode,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, field4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: field4FocusNode,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if(value.length == 1) {
                      field4FocusNode.unfocus();
                    }
                  },
                ),
              )
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15,),
          DefaultButton(
            text: 'Continue',
            press: (){
              // next page
            },
          )
        ],
      ),
    );
  }
}
