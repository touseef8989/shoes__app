import 'package:flutter/material.dart';
import 'package:shoes__app/constants/shoes_textstyle.dart';
import 'package:shoes__app/home/home_screen.dart';
import 'package:shoes__app/user_profile/user_signup.dart';
import 'package:shoes__app/widget/shoes_button.dart';
import 'package:shoes__app/widget/shoes_textfield.dart';


class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isButtonEnabled = false;
  bool isEmailValid = true;
  bool isPasswordValid = true;

  void checkFormValidation() {
    setState(() {
      isButtonEnabled = emailC.text.isNotEmpty && passwordC.text.length >= 6;
    });
  }

  void loginUser() {
    setState(() {
      if (emailC.text == "test@gmail.com" && passwordC.text == "123456") {
        isEmailValid = true;
        isPasswordValid = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        isEmailValid = false;
        isPasswordValid = false;
      }
    });

    formkey.currentState!
        .validate(); // Re-trigger form validation to show error messages
  }

  @override
  void initState() {
    super.initState();
    emailC.addListener(checkFormValidation);
    passwordC.addListener(checkFormValidation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Login")),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                "Login part",
                style: ShoesTextstyle.subheading,
              )),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
          color: const Color.fromARGB(255, 2, 17, 30),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )
        ),
            child: Expanded(
              flex: 5,
              child:
              Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: Text("Welcome to Login Screen")),
                    const SizedBox(height: 30),
                    ShoesTextField(
                      controller: emailC,
                      hinttext: "Enter Email",
                      icons: const Icon(Icons.email),
                      validate: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Email is required';
                        } else if (!v.contains('@')) {
                          return 'Email must contain @';
                        } else if (!isEmailValid) {
                          return "Invalid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    ShoesTextField(
                      controller: passwordC,
                      hinttext: "Enter Password",
                      icons: const Icon(Icons.remove_red_eye),
                      validate: (v) {
                        if (v == null || v.isEmpty) {
                          return "Password cannot be empty";
                        } else if (v.length < 6) {
                          return "Password must be at least 6 characters";
                        } else if (!isPasswordValid) {
                          return "Incorrect password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                onTap: (){
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupPage()),
                  );
                },
                child: Text("Singup",style: ShoesTextstyle.heading,)),
              const SizedBox(height: 10),
                    ShoesButton(
                      title: "Login button",
                      onPress: isButtonEnabled ? loginUser : null,
                      color: isButtonEnabled ? Colors.blue : Colors.grey,
                    ),
                  
                    const SizedBox(height: 15),
                  
                  ]
                ),
              ),
            
            ),
          )
        
        ],
      ),
    );
  }
}
