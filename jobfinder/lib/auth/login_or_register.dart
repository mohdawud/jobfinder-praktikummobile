import 'package:flutter/material.dart';
import 'package:jobfinder/pages/login_page.dart';
import 'package:jobfinder/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTab: tooglePages);
    } else {
      return RegisterPage(onTab: tooglePages);
    }
  }
}
