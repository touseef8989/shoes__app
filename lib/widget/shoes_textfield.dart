import 'package:flutter/material.dart';

class ShoesTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final Widget? icons;
  final String? Function(String?)? validate;
  final Function(String?)? ontap;
  final Function(String)? onchanged;

  ShoesTextField(
      {required this.controller,
      required this.hinttext,
      this.icons,
      this.onchanged,
      this.ontap,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hinttext,
          suffixIcon: icons,
          contentPadding: EdgeInsets.all( 12)
        ),
        onChanged: onchanged,
        validator: validate,
        onTap: (){
          if(ontap!=null){
            ontap!(controller.text);
          }
        },
      ),
    );
  }
}
