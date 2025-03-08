import 'package:flutter/material.dart';

class DotIndector extends StatelessWidget {
  // const DotIndector({super.key});
    final bool isActive;
    DotIndector({this.isActive=false});
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: 8,
      width: isActive ?24 :8,
      decoration: BoxDecoration(
        color: isActive? Colors.black: Colors.green,
        border: isActive ? null : Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(12),),
      ),
    );
  }
}