import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobfinder/theme/colors.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search a job',
                  border: InputBorder.none,
                  icon: Icon(Iconsax.search_normal, color: primaryColor),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.only(left: 20),
            ),
          ),
        ],
      ),
    );
  }
}
