import 'package:flutter/material.dart';
import 'classLabel.dart';
import 'sideBar.dart';
import 'bottomBar.dart';

class ClassDashboard extends StatefulWidget {
  const ClassDashboard({super.key});
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
              const MyDashBoard(),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(300, 25),
                ),
                onPressed: () {},
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        '0 students',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            tooltip: 'Check Attendance',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.check_circle_outline),
          ),
          bottomNavigationBar: const BottomBreadcrumbBar(),
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
