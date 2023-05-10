import 'package:flutter/material.dart'; //created by google

class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.menu, // Black three horizontal lines icon
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Bottom round button
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(42.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle button click
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
    );
  }
}
