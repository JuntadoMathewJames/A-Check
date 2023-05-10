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
                  onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
