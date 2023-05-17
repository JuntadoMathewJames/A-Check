import 'package:flutter/material.dart';

class CreateUserType extends StatefulWidget {

  @override
  _CreateUserTypeState createState() => _CreateUserTypeState();
}

class _CreateUserTypeState extends State<CreateUserType> {

  int _selectedOption = 0;

  void _handleOptionChange(int? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Create user as...',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 50.0),
            Row(
              children: [
                Radio<int?>(
                  value: 1,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                Text('Teacher'),
              ],
            ),
            Row(
              children: [
                Radio<int>(
                  value: 2,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                Text('Student'),
              ],
            ),
            SizedBox(height: 100.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: OutlinedButton(
                  onPressed: () {
                    if(_selectedOption == 1){
                      Navigator.of(context).pushNamed('/create_account', arguments: "Teacher");
                    }else if(_selectedOption == 2){
                      Navigator.of(context).pushNamed('/create_account', arguments: "Student");
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error!'),
                            content: Text('Choosing a user type is required before signing up.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
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
