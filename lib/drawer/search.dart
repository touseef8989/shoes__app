import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
   SearchBox({super.key, required this.onChanged, required this.controller});
final SearchController controller;
final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextField(
controller: controller,
onChanged: onChanged,
decoration: InputDecoration(
  hintText: "Shoes search",
  prefixIcon: Icon(Icons.search),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
),
    );
    //  Container(
    //   width: 350,
    //   height: 50,
    //   decoration: BoxDecoration(
    //     color: const Color.fromARGB(255, 227, 227, 227),
    //     borderRadius: BorderRadius.circular(30),
        
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(12.0),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text("Search Shoes"),
    //         Icon(Icons.search)
    //       ],
    //     ),
    //   ),
    // );
  }
}