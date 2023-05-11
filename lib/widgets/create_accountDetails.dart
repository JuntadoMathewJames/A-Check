import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Create an A-check account',
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Handle image upload
                // Proceed to phone gallery
              },
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/upload_image.png'),
                backgroundColor: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Juan B. Dela Cruz',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: schoolNameController,
              decoration: InputDecoration(
                labelText: 'School Name',
                hintText: 'Ateneo de Naga University',
              ),
            ),
            SizedBox(height: 100.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Confirm button click
                    String fullName = fullNameController.text;
                    String schoolName = schoolNameController.text;
                    // Perform further actions
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Dark color for the button
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}