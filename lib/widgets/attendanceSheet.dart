import 'package:flutter/material.dart';
import 'sideBar.dart';
import "my_class.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AttendanceApp extends StatefulWidget {
  final Classes myClass;

  const AttendanceApp({super.key, required this.myClass});
  @override
  State<AttendanceApp> createState() => _AttendanceApp();
}

class _AttendanceApp extends State<AttendanceApp>  {

  final List<String> headers = ['Name', 'Attendance Status'];
  String selectedLetter = 'P';
  List<bool> attendanceList = [];
  @override
  void initState() {
    final len = widget.myClass.students?.length;
    super.initState();
    // Initialize the attendance list with false (absent) for all students
    attendanceList = List<bool>.filled(len!, true);
  }
  DateTime today = DateTime.now();
  final currentUser = FirebaseAuth.instance.currentUser;
  Future checkAttendance({
    required String today,
    required List<bool> attendanceList,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('attendance').doc();
    final attendance = {
      "id": docUser.id,
      "class_id": widget.myClass.id,
      "date": today,
      "students": widget.myClass.students,
      "attendance_list": attendanceList,
    };
    await docUser.set(attendance);
  }


  @override
  Widget build(BuildContext context) {
    String dateStr = "${today.day}-${today.month}-${today.year}";
    return LayoutBuilder(
      builder:(context,constraints){

        return Scaffold(
          appBar: AppBar(title: Text('Attendance Sheet/${dateStr}')),
          drawer: MySideBar(),
          body: Column(
            children:[
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
                  shrinkWrap: true,
                  itemCount: widget.myClass.students?.length,
                  itemBuilder: (context, index) {
                    final name = "${widget.myClass.students![index]}";
                    return ListTile(
                      title: Text(name),
                      trailing:Checkbox(
                        value: attendanceList[index],
                        onChanged: (value) {
                          setState(() {
                            attendanceList[index] = value!;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children:[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: (){
                        checkAttendance(
                            today: dateStr, attendanceList: attendanceList);
                        Navigator.of(context).pushNamed('/class_dashboard',arguments: widget.myClass);
                      }, child: Text("Generate Attendance"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/class_dashboard',arguments: widget.myClass);
                      }, child: Text("Cancel"),
                    ),
                  ),



                ],
              ),


            ],
          ),


        );
      },
    );
  }
}
