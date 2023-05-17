import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'my_class.dart';

class AddStudentsToClassList extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final Classes classes;

  AddStudentsToClassList({super.key, required this.classes});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invite students to this class',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter an e-mail address',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'People recently added',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            //,** THERE MUST BE A LOGO, FULL NAME AND AN EMAIL ADDRESS OF ADDED INDIVIDUALS IN HERE, **
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle done button click
                  String email = _emailController.text;
                  // Perform necessary actions with the email
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  firestore
                      .collection('classes')
                      .doc(classes.id.toString())
                      .update({
                        'students': FieldValue.arrayUnion([email])
                      })
                      .then((value) => print("Updated"))
                      .catchError((error) => print("Failed ${error}"));
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Dark button background color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
