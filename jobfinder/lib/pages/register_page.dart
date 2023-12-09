import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/components/my_button.dart';
import 'package:jobfinder/components/my_textfield.dart';
import 'package:jobfinder/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTab;
  const RegisterPage({super.key, required this.onTab});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void signUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      displayMessageToUser("Password don't match!", context);
    } else {
      //try creating user
      try {
        //create userr
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        //create a user doc and add to firestore
        createUserDocument(userCredential);

        //pop loaading circl
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
                    size: 70,
                    color: Color.fromARGB(204, 11, 31, 2),
                  ),

                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Hello,',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  //welcomback
                  Text(
                    'Lets create an account for you!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //email TextField
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obcureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //email TextField
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
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
                    height: 10,
                  ),

                  //Confirm Password Textfield
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obcureText: true,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  MyButton(
                    name: 'Sign Up',
                    onTap: signUp,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTab,
                        child: const Text(
                          'Login now',
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
