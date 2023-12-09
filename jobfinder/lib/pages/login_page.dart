import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/components/my_button.dart';
import 'package:jobfinder/components/my_textfield.dart';
import 'package:jobfinder/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTab;
  const LoginPage({super.key, required this.onTab});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) Navigator.pop(context);
    }
    //display any error
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  const Icon(
                    Icons.person,
                    size: 150,
                    color: Color.fromARGB(204, 11, 31, 2),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hello,',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //welcomback
                  Text(
                    'Welcome Back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  //email TextField
                  MyTextField(
                    controller: emailController,
                    hintText: 'email',
                    obcureText: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Password Textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obcureText: true,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  MyButton(
                    name: 'Sign In',
                    onTap: signIn,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTab,
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
