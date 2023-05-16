import 'package:flutter/material.dart'; //created by google
import 'sideBar.dart';
import 'circleButton.dart';
import 'bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: use_key_in_widget_constructors
class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const MySideBar(),
      body: Row(children: [
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('classes').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) =>
                        Text(snapshot.data!.docs[index]['name']));
              } else {
                return Container();
              }
            }),
        const Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(42.0),
            child: CircleButton(),
          ),
        ),
      ]),
      bottomNavigationBar: const BottomBreadcrumbBar(),
    );
  }
}
