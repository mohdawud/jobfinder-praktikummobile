import 'package:flutter/material.dart';
import 'package:jobfinder/theme/colors.dart';

class IntroButton extends StatelessWidget {
  final String text;
  final void Function()? onTab;
  const IntroButton({super.key, required this.text, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            //icon

            const SizedBox(
              width: 5.0,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
