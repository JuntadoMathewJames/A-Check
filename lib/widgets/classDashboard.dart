import 'package:flutter/material.dart';
import 'classLabel.dart';

class ClassDashboard extends StatefulWidget {
  const ClassDashboard({super.key});
  @override
  State<ClassDashboard> createState() => _ClassDashboard();
}

class _ClassDashboard extends State<ClassDashboard> {
  bool showWidget = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                setState(() {
                  showWidget = !showWidget;
                });
              },
              icon: const Icon(Icons.menu),
            ),
          ),
          body: Row(
            children: [
              SafeArea(
                child: showWidget
                    ? NavigationRail(
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.person_2_rounded,
                              size: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Logged in as a student',
                                    style: TextStyle(color: Colors.black38)),
                                Text('John Cena',
                                    style: TextStyle(fontSize: 20)),
                                Text('jcena@gbox.adnu.edu.ph',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                        groupAlignment: 1,
                        extended: constraints.maxWidth >= 400,
                        elevation: 5,
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.settings),
                            label: Text('Settings'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.logout),
                            label: Text('Sign-out'),
                          ),
                        ],
                        selectedIndex: 0,
                        onDestinationSelected: (value) {
                          setState(() {
                            selectedIndex = value;
                          });
                        },
                      )
                    : const Text(''),
              ),
              Expanded(
                child: Column(
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
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  autofocus: true,
                  focusColor: Colors.grey.shade400,
                  tooltip: 'List of Students',
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                ),
                IconButton(
                  focusColor: Colors.grey.shade400,
                  tooltip: 'Attendance Records',
                  icon: const Icon(Icons.checklist),
                  onPressed: () {},
                ),
              ],
            ),
          ),
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