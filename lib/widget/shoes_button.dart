import 'package:flutter/material.dart';

class ShoesButton extends StatelessWidget {
  final String? title;
  final bool? isLoginButton;
  final VoidCallback? onPress;
  final bool? isLoading;
  final Color? color;
  const ShoesButton(
      {super.key,
      this.title,
      this.isLoginButton,
      this.onPress,
      this.isLoading,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        
        height: 55,
        width: 200,
        decoration: BoxDecoration(
            color: color ?? const Color.fromARGB(255, 5, 19, 33),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: color ?? Colors.grey,
            )),
        child: Center(
          child: Stack(
            children: [
              Visibility(
                visible: !(isLoading??false),
                  child: Center(
                child: Text(
                  title ?? "Button",
                  style: TextStyle(
                      color: isLoading == false ? Colors.white : Colors.white,
                      fontSize: 16),
                ),
              )),
              Visibility(
                  visible: isLoading ?? false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
