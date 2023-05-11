import 'package:flutter/material.dart';
import 'classDashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
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
    Future createUser({required String email, required String password}) async {
      final docUser = FirebaseFirestore.instance.collection('users').doc();
      final user = {
        "id": docUser.id,
        "email": email,
        "password": password,
        "usertype": 0
      };
      await docUser.set(user);
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
                    height: 160,
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
                    height: 30,
                  ),
                ),
              ],
            ),
            Center(
              child: GoogleSignUpButton(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 50,
                    height: 45,
                  ),
                ),
              ],
            ),
            Text("OR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
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
                TextFormField(
                  // HIDDEN FIELD FOR USER TYPE
                  decoration: InputDecoration.collapsed(hintText: ''),
                  controller: usertype,
                ),
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
                    child: Text("Confirm Password",
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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 40, 56, 5),
                  alignment: Alignment.bottomRight,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      final passconf = confirmpassController.text;
                      if (password != passconf) print("Password dont match");
                      createUser(email: email, password: password);
                    },
                    child: Text("Confirm",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
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

class GoogleSignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.0),
      child: SizedBox(
        height: 50.0,
        child: ElevatedButton.icon(
          onPressed: () {
            // Handle button press
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          icon: Image.asset(
            'assets/google_logo.png', // Replace with your Google logo image path
            height: 24.0,
            width: 24.0,
          ),
          label: Text(
            'Sign up with Google',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


// FUNCTIONS

