// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
/* Samantha Mae L. De Las Nieves
Team: The Beadles
Project Name: A-Checker
Feature: [ACHE-004] Login Page
Feature description:
As a user, I want to register.
Acceptance criteria: The user is able to register using Google or their own email address & password.
 */

import 'package:flutter/material.dart'; //created by google

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //method where widgets are created
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
            Text("Sign in to A-Check",
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
              // ),
              // Center(
              //   child: OutlinedButton(
              //     style: OutlinedButton.styleFrom(
              //       foregroundColor: Colors.black, side: BorderSide(
              //         color: Colors.black,
              //       ),
              //     ), onPressed: () {  },
              //   child: Text(
              //       "Sign in with Google",
              //     style: TextStyle(
              //       fontWeight: FontWeight.w500,
              //       fontSize: 16,
              //     )
              //   ),
              //   ),
              // ),
            ),
            Center(
              child: GoogleSignInButton(),
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
            Text(
              "OR",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(),
                      ),
                    )),
                RoundedCheckBox(),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 40, 56, 5),
                  alignment: Alignment.bottomRight,
                  child: Text("Confirm",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } //immutable widgets - state of these widgets don't CHANGE as app runs (e.g. texts)
}

class GoogleSignInButton extends StatelessWidget {
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
            'Sign in with Google',
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

//  CHECK BOX
class RoundedCheckBox extends StatefulWidget {
  @override
  _RoundedCheckBoxState createState() => _RoundedCheckBoxState();
}

class _RoundedCheckBoxState extends State<RoundedCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Container(
              width: 24.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                ),
                color: isChecked ? Colors.blue : Colors.transparent,
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: 16.0,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            'Keep me logged in',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
