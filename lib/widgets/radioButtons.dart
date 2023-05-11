import 'package:flutter/material.dart';

class RadioButtonsWidget extends StatefulWidget {
  @override
  _RadioButtonsWidgetState createState() => _RadioButtonsWidgetState();
}

class _RadioButtonsWidgetState extends State<RadioButtonsWidget> {
  String selectedLetter = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Radio<String>(
          value: 'P',
          groupValue: selectedLetter,
          onChanged: (String? value) {
            setState(() {
              selectedLetter = value!;
            });
          },
        ),
        Radio<String>(
          value: 'A',
          groupValue: selectedLetter,
          onChanged: (String? value) {
            setState(() {
              selectedLetter = value!;
            });
          },
        ),
        Radio<String>(
          value: 'L',
          groupValue: selectedLetter,
          onChanged: (String? value) {
            setState(() {
              selectedLetter = value!;
            });
          },
        ),
        Radio<String>(
          value: 'E',
          groupValue: selectedLetter,
          onChanged: (String? value) {
            setState(() {
              selectedLetter = value!;
            });
          },
        ),
      ],
    );
  }
}
