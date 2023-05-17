import 'package:flutter/material.dart'; //created by google
import 'sideBar.dart';
import 'circleButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'classDashboard.dart';

// ignore: use_key_in_widget_constructors
class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: MySideBar(),
      body: Column(children: [
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('classes').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Container();
              }
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child:
                            GestureDetector(
                              // When the child is tapped, show a snackbar.
                              onTap: () {
                                Navigator.of(context).pushNamed('/class_dashboard');
                              },
                              // The custom button
                              child:  ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ),
                                title:
                                Text(snapshot.data!.docs[index]['name']),
                              ),
                            ),

                        );
                      }),
                );
              }
              return CircularProgressIndicator();
            }),
        const Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(42.0),
            child: CircleButton(),
          ),
        ),
      ]),

    );
  }
}
