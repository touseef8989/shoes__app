import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoes__app/models/onboarding_model.dart';
import 'package:shoes__app/onboarding/DotIndector.dart';
import 'package:shoes__app/onboarding/onBoardingContent.dart';
import 'package:shoes__app/user_profile/profile_selection.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController shoesPageController = PageController();
  int pageIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    shoesPageController = PageController(initialPage: 0);
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (pageIndex < 3) {
        pageIndex++;
      } else {
        pageIndex = 0;
      }
      shoesPageController.animateToPage(
        pageIndex,
        duration: Duration(microseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    shoesPageController.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 234, 234, 234),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  itemCount: shoesData.length,
                  controller: shoesPageController,
                  itemBuilder: (context, index) => OnBoardingContent(
                        description: shoesData[index].description,
                        image: shoesData[index].image,
                        title: shoesData[index].title,
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    shoesData.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: DotIndector(
                        isActive: index == pageIndex,
                     
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => UserPageSelected(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 111, 203, 114),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 40,
                width: 250,
                child: Center(child: Text("Next")),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
