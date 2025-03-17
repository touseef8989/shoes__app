import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 227, 227, 227),
        borderRadius: BorderRadius.circular(30),
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search Shoes"),
            Icon(Icons.search)
          ],
        ),
      ),
    );
  }
}