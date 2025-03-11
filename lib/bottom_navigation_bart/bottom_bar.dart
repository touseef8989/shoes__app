import 'package:flutter/material.dart';
import 'package:shoes__app/home/detail_screen.dart';
import 'package:shoes__app/home/favourite_screen.dart';
import 'package:shoes__app/home/home_screen.dart';
import 'package:shoes__app/home/notification.dart';
import 'package:shoes__app/home/user_cart.dart';
import 'package:shoes__app/home/user_checkOut.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class ShoesBottomNavigationBar extends StatefulWidget {
  const ShoesBottomNavigationBar({super.key});

  @override
  State<ShoesBottomNavigationBar> createState() => _ShoesBottomNavigationBarState();
}

class _ShoesBottomNavigationBarState extends State<ShoesBottomNavigationBar> {

  int selectIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    DetailScreen(),
    FavouriteScreen(),
    // NotificationScreen(),
    UserCheckoutScreen(),

  ];
  void onSelected(int index) {
    setState(() {
      selectIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  pages[selectIndex],
      bottomNavigationBar: WaterDropNavBar(
         selectedIndex: selectIndex,
          onItemSelected: onSelected,
          backgroundColor: Colors.white,
          waterDropColor: Colors.blue,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined
          ),
           BarItem(
            filledIcon: Icons.details,
            outlinedIcon: Icons.details_outlined
          ), BarItem(
            filledIcon: Icons.favorite,
            outlinedIcon: Icons.favorite_border_outlined
          ),
          //  BarItem(
          //   filledIcon: Icons.notification_add,
          //   outlinedIcon: Icons.notification_add_outlined
          // ),
           BarItem(
            filledIcon: Icons.shopping_bag,
            outlinedIcon: Icons.shopping_bag_outlined
          ),
        ],

        ),
    );
  }
}