import 'package:flutter/material.dart';
import 'package:shoes__app/constants/shoes_textstyle.dart';
import 'package:shoes__app/user_profile/user_login.dart';
import 'package:shoes__app/user_profile/user_signup.dart';


class UserPageSelected extends StatelessWidget {
  const UserPageSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/onb-2.png",height: 200,)),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(("Welcome to Shoes Store"),style: ShoesTextstyle.heading,)),
               SizedBox(
                height: 10,
              ),
              Center(child: Text(("select your account"),style: ShoesTextstyle.subheading,)),

            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 2, 17, 30),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>UserLoginScreen()));
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Login",style: TextStyle(color: Colors.white),)
                ),
              ),
              SizedBox(
                height: 20,
              ),
               SizedBox(
                width: 200,
                child: OutlinedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignupPage()));
                }, 
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Signup",style: TextStyle(color: Colors.white),)
                ),
              ),
            ],
          ),
        )),
      ],
      ),
    );
  }
}