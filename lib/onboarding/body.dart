import 'package:flutter/material.dart';
import 'package:on_boarding/components/default_button.dart';
import 'package:on_boarding/constants.dart';
import 'package:on_boarding/onboarding/onboarding_content.dart';
import 'package:on_boarding/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> onBoardingData = [
    {
      "text": "Welcome to Nikolai Apps",
      "image": "assets/images/image_one"},
    {
      "text": "Nikolai adalah seorang pria berkebangsaan indonesia",
      "image": "assets/images/image_two"
    },
    {
      "text": "Lahir di Tangerang, 5 Mei 1997",
      "image": "assets/images/image_three"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: onBoardingData[index]["image"],
                  text: onBoardingData[index]["text"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onBoardingData.length,
                          (index) => buildDot(index: index)),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        //
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
