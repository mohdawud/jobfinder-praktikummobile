import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/auth/auth.dart';
import 'package:jobfinder/auth/login_or_register.dart';
import 'package:jobfinder/firebase_options.dart';
import 'package:jobfinder/models/job_model.dart';
import 'package:jobfinder/pages/categories_page.dart';
import 'package:jobfinder/pages/home_page.dart';
import 'package:jobfinder/pages/intro_page.dart';
import 'package:jobfinder/pages/jobdetail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/authpage': (context) => AuthPage(),
        '/loginorregister': (context) => LoginOrRegister(),
        '/homepage': (context) => HomePage(),
        '/jobdetailpage': (context) => JobDetailPage(
            job: ModalRoute.of(context)!.settings.arguments as JobModel),
        '/categoriespage': (context) => CategoriesPage(),
      },
    );
  }
}
