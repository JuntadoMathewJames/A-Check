//To be used in classDashboard.dart:  bottomNavigationBar: BottomBreadcrumbBar()

import 'package:flutter/material.dart';
import 'my_class.dart';
class BottomBreadcrumbBar extends StatefulWidget {
  final Classes myClass;
  final selectedButtonIndex;
  const BottomBreadcrumbBar({super.key,required this.myClass, this.selectedButtonIndex});

  @override
  _BottomBreadcrumbBarState createState() => _BottomBreadcrumbBarState();
}

class _BottomBreadcrumbBarState extends State<BottomBreadcrumbBar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/class_dashboard',arguments: widget.myClass);
              },
              child: Container(
                color: widget.selectedButtonIndex == 0 ? Colors.grey : Colors.white,
                padding: EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/person.png', // Replace with your logo image path
                  width: 25.0,
                  height: 25.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/check_record',arguments: widget.myClass);
              },
              child: Container(
                color: widget.selectedButtonIndex == 1 ? Colors.grey : Colors.white,
                padding: EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/check.png', // Replace with your logo image path
                  width: 25.0,
                  height: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
