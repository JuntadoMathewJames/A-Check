import 'package:flutter/material.dart';
import 'sideBar.dart';
import 'bottomBar.dart';
class AttendanceApp extends StatefulWidget {
  @override
  _AttendanceApp createState() => _AttendanceApp();
}

class _AttendanceApp extends State<AttendanceApp>  {
  String selectedLetter = '';
  final List<String> names = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Brown',
    'David Wilson',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Sheet')),
      drawer: MySideBar(),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final name = names[index];
          return ListTile(
            title: Text(name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
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
                  value: 'L',
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
                  value: 'E',
                  groupValue: selectedLetter,
                  onChanged: (String? value) {
                    setState(() {
                      selectedLetter = value!;
                    });
                  },
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
