import 'package:flutter/material.dart';
import 'classDashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  final String userType;
  final String fullName;
  final String schoolName;
  SignUp({
    super.key,
    required this.userType,
    required this.fullName,
    required this.schoolName,
  });
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //method where widgets are created
    final TextEditingController passwordController =
        new TextEditingController();
    final TextEditingController confirmpassController =
        new TextEditingController();
    final TextEditingController usertype = new TextEditingController();
    final TextEditingController emailController = new TextEditingController();
    final _formkey = GlobalKey<FormState>();
    final _auth = FirebaseAuth.instance;
    Future<bool> checkIfEmailInUse(String emailAddress) async {
      try {
        // Fetch sign-in methods for the email address
        final list = await FirebaseAuth.instance
            .fetchSignInMethodsForEmail(emailAddress);

        // In case list is not empty
        if (list.isNotEmpty) {
          // Return true because there is an existing
          // user using the email address
          return true;
        } else {
          // Return false because email adress is not in use
          return false;
        }
      } catch (error) {
        // Handle error
        // ...
        return true;
      }
    }

    Future createUser({required String email, required String password}) async {
      final docUser = FirebaseFirestore.instance.collection('users').doc();
      final user = {
        "id": docUser.id,
        "email": email,
        "usertype": userType,
        "fullname": fullName,
        "schoolName": schoolName,
      };
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then(
              (value) async => {
                await docUser.set(user),
                await FirebaseAuth.instance.currentUser
                    ?.updateDisplayName(fullName),
                Navigator.of(context).pushNamed('/dashboard')
              },
            );
      } catch (e) {
        print(e.toString());
        return null;
      }
    }

    return Material(
      color: Colors.white,
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 50,
                    height: 100,
                  ),
                ),
              ],
            ),
            const Text("Create an A-Check account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 35,
                )),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 50,
                    height: 25,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 26,
                  child: Container(
                    child: Text("E-mail Address",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        )),
                  ),
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(),
                      ),
                    )),
                SizedBox(
                  width: 300,
                  height: 26,
                  child: Container(
                    child: Text("Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        )),
                  ),
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(),
                      ),
                    )),
                SizedBox(
                  width: 300,
                  height: 26,
                  child: Container(
                    child: const Text("Confirm Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        )),
                  ),
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      obscureText: true,
                      controller: confirmpassController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(),
                      ),
                    )),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () async {
                    final email = emailController.text;
                    final password = passwordController.text;
                    final passconf = confirmpassController.text;
                    if (await checkIfEmailInUse(email) == true) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error!'),
                            content: const Text('Email is in use!'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (password.length < 6) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error!'),
                            content: const Text(
                                'Password should be more than 6 characters'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (password != passconf) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error!'),
                            content: const Text('Password did not match!'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      createUser(email: email, password: password);
                    }
                  },
                  child: Text("Register",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text("Go to Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } //immutable widgets - state of these widgets don't CHANGE as app runs (e.g. texts)
}



// FUNCTIONS

