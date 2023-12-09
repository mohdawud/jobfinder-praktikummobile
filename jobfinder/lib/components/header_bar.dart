import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                'FInd your dream job bro! 👋',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
