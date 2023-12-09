import 'package:flutter/material.dart';
import 'package:jobfinder/pages/categories_page.dart';
import 'package:jobfinder/pages/home_page.dart';
import 'package:jobfinder/pages/profile_page.dart';
import 'package:jobfinder/theme/colors.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: primaryColor,
            ),
            label: ''),
        // BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: primaryColor), label: ''),
      ],
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // unselectedItemColor: Colors.grey.shade400,
      // selectedItemColor: Color.fromARGB(204, 11, 31, 2),
      currentIndex: selectedItem,
      iconSize: 30,
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: (int index) {
        // Tanggapi interaksi pengguna di sini
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoriesPage()),
          );
          // } else if (index == 2) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => BookmarkPage()),
          //   );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
      },
    );
  }
}
