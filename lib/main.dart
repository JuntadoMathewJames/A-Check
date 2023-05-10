import 'package:flutter/material.dart';
import 'widgets/navdrawer.dart';
import 'widgets/dashboard.dart';
import 'widgets/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A-Check',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: SignUp(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showWidget = false;
  Widget navDraw = const NavDrawer();
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
