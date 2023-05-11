import 'package:flutter/material.dart'; //created by google
import 'sideBar.dart';

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
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(42.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/create_class');
                    },
                    child: Icon(
                      Icons.add, // Black plus sign icon
                      size: 50.0,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(5.0),
                      primary: Colors.white, // Black background color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
