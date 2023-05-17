import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  final String data;
  CreateAccount({super.key,
    required this.data,
  });

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(children: [
          Column(
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
                    if(fullName == "" || schoolName == ""){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error!'),
                            content: const Text('All fields must have an input.'),
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
                    }else{
                      Navigator.of(context).pushNamed('/sign_up', arguments: AccountArguments(data,fullName,schoolName));
                    }

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
            ],),
      ),
    );
  }
}

class AccountArguments{
  final String userType;
  final String fullName;
  final String schoolName;
  AccountArguments(this.userType, this.fullName, this.schoolName);
}
