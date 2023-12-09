import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobfinder/components/intro_button.dart';
import 'package:jobfinder/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 50,
            ),
            //appname
            Text(
              "JOB FINDER",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),

            const SizedBox(
              height: 5,
            ),

            //icon
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset('lib/images/koper.png'),
            ),

            const SizedBox(
              height: 5,
            ),

            //title
            Text(
              "   FI N D   Y OUR          DRE AM   IT  J O B",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 34, color: Colors.white),
            ),

            const SizedBox(
              height: 25,
            ),

            //subtitle
            Text(
              "You can look for a job according to your passion in the company you dream of",
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),

            const SizedBox(
              height: 25,
            ),

            //get started button
            IntroButton(
              text: "Get Started",
              onTab: () {
                Navigator.pushNamed(context, '/authpage');
              },
            )
          ],
        ),
      ),
    );
  }
}
