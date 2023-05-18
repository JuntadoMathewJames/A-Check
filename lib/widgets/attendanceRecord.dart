import 'package:flutter/material.dart';
import 'sideBar.dart';
import "my_class.dart";
import 'bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AttendanceRecord extends StatefulWidget {
  final Classes myClass;
  const AttendanceRecord({super.key, required this.myClass});
  @override
  _AttendanceRecordState createState() => _AttendanceRecordState();
}

class _AttendanceRecordState extends State<AttendanceRecord> {
  final List<String> headers = ['Date'];
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Records'),
      ),
      drawer: MySideBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (var header in headers)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.blue,
                      child: Text(
                        header,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: widget.myClass.students?.length, // Replace with your actual data count
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.grey[200],
                          child: Text('John Doe'), // Replace with actual data
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.grey[200],
                          child: Text('2023-05-18'), // Replace with actual data
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.grey[200],
                          child: Text('Present'), // Replace with actual data
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:  BottomBreadcrumbBar(myClass: widget.myClass,selectedButtonIndex: 1),

    );
  }
}
