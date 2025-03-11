import 'package:flutter/material.dart';

class UserCheckoutScreen extends StatelessWidget {
  const UserCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("checkout screen"),
        backgroundColor: Colors.green,
      ),
    );
  }
}