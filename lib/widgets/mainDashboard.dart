import 'package:flutter/material.dart'; //created by google
import 'sideBar.dart';
import 'circleButton.dart';
import 'bottomBar.dart';
class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const MySideBar(),
      body: Center(
        child: Scaffold(
          body: Stack(
            children: [
              // Main content
              Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    ' ',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
              // Sidebar overlay
              // Bottom round button
              const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(42.0),
                  child:  CircleButton(),
                ),
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar: const BottomBreadcrumbBar(),
    );
  }
}
