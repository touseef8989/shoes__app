import 'package:flutter/material.dart';
import 'package:shoes_app/constants/shoes_textstyle.dart';
import 'package:shoes_app/home/home_screen.dart';
import 'package:shoes_app/user_profile/user_login.dart';
import 'package:shoes_app/user_profile/user_signup.dart';
import 'package:shoes_app/widget/shoes_button.dart';
import 'package:shoes_app/widget/shoes_textfield.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameC = TextEditingController();

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confrimPasswordC = TextEditingController();

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
      appBar: AppBar(title: const Text("Signup Page")),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text("")),
          Container(
            decoration: BoxDecoration(
            color: const Color.fromARGB(255, 2, 17, 30),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
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
                controller: nameC,
                hinttext: "Enter name",
                icons: const Icon(Icons.person),
                validate: (v) {
                  if(v==null|| v.isEmpty){
                    return "name is required";
                  }
                  return null;
                },
              ),
               SizedBox(
                height: 15
              ),
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
               SizedBox(
                height: 15
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
              ShoesTextField(
                controller: confrimPasswordC,
                hinttext: "Confrim Password",
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
                    MaterialPageRoute(builder: (_) => const UserLoginScreen()),
                  );
                },
                child: Text("Login",style: ShoesTextstyle.heading,)),
              const SizedBox(height: 10),
             
              ShoesButton(
                title: "Login button",
                onPress: isButtonEnabled ? loginUser : null,
                color: isButtonEnabled ? Colors.blue : Colors.grey,
              ),
              const SizedBox(height: 15),

            ],
                    ),
                  ),
              
            ),
          )
        ],
      ),
    );
  }
}
