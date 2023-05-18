import 'package:flutter/material.dart';
import 'classLabel.dart';
import 'sideBar.dart';
import 'bottomBar.dart';
import 'dialogAddStudentsToClass.dart';
import "my_class.dart";

class ClassDashboard extends StatefulWidget {
  final Classes myClass;

  const ClassDashboard({super.key, required this.myClass});
  @override
  State<ClassDashboard> createState() => _ClassDashboard();
}

class _ClassDashboard extends State<ClassDashboard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
          ),
          drawer: MySideBar(),
          body: Column(
            children: [
              MyDashBoard(
                classes: widget.myClass,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(300, 25),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddStudentsToClassList(
                        classes: widget.myClass,
                      );
                    },
                  );
                },
                child: const Text(
                  'Add Students',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.grey.shade200,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        '${widget.myClass.students?.length} students',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.myClass.students?.length,
                  itemBuilder: (context, index) {
                    // for(int i = 0; i < )

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),

                      // The custom button
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ),
                        title: Text("${widget.myClass.students![index]}"),
                      ),
                    );
                  }),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/check_attendance', arguments: widget.myClass);
            },
            tooltip: 'Check Attendance',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.check_circle_outline),
          ),
          bottomNavigationBar:  BottomBreadcrumbBar(myClass: widget.myClass,selectedButtonIndex: 0),
        );
      },
    );
  }
}

class JoinClassPopup extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Join Class',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                hintText: 'Enter the code sent by your teacher',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle "Done" button click
                String code = codeController.text;
                // Perform further actions
              },
              child: Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Dark color for the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
