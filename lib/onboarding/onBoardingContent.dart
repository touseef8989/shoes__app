import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  // const OnBoardingContent({super.key});
  String image;
  String title;
  String description;
  OnBoardingContent({
    super.key,
    required this.description,
    required this.image,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(description,style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
        Spacer(),
        Image.asset(image),
      ],
    );
  }
}
