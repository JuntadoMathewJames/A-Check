import 'package:flutter/material.dart';

class StudentWidget extends StatelessWidget {
  final String fullName;
  final String emailAddress;

  StudentWidget({
    required this.fullName,
    required this.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //removed avatar
        SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              emailAddress,
            ),
          ],
        ),
      ],
    );
  }
}
