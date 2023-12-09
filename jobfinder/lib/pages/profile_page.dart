import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/auth/auth.dart';
import 'package:jobfinder/components/bottom_navbar.dart';
import 'package:jobfinder/components/my_textbox.dart';
import 'package:jobfinder/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signOut() {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AuthPage()));
    });
  }

  //user
  final User? currentUser = FirebaseAuth.instance.currentUser!;

  //all users
  final userCollection = FirebaseFirestore.instance.collection("Users");

  //future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  //edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[800],
        title: Text(
          "Edit " + field,
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );

    //update in firestore
    if (newValue.trim().length > 0) {
      await userCollection.doc(currentUser!.email).update({field: newValue});
    }
  }

  //Delete
  Future<void> deleteAccount() async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[800],
        title: Text(
          "Confirm Delete",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "Are you sure you want to delete your account?",
          style: TextStyle(color: Colors.grey[300]),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirmDelete != null && confirmDelete) {
      await deleteUserData();
      await deleteAuthAccount();
      // Update state if needed
      setState(() {});
      navigateToAuthPage();
    }
  }

  Future<void> deleteUserData() async {
    await userCollection.doc(currentUser!.email).delete();
  }

  Future<void> deleteAuthAccount() async {
    await currentUser!.delete();
  }

  void navigateToAuthPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          child: BottomNavBar(),
        ),
        appBar: AppBar(
          title: Text("Profil Page"),
          backgroundColor: primaryColor,
          actions: [
            IconButton(
              onPressed: signOut,
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserDetails(),
          builder: (context, snapshot) {
            //loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              //extraxt data
              Map<String, dynamic>? user = snapshot.data!.data();
              return ListView(
                children: [
                  //profil picture
                  const SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.person,
                    color: primaryColor,
                    size: 80,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //user email
                  Text(
                    user!['email'],
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'My Details',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),

                  //username
                  MyTextBox(
                    text: user['username'],
                    sectionName: 'username',
                    onPressed: () => editField('username'),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  GestureDetector(
                    onTap: deleteAccount,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 110),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 152, 10, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Delete Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )

                  //status

                  //user details

                  //usernmae

                  //status

                  //
                ],
              );
            } else {
              return Text("No Data");
            }
          },
        ));
  }
}
