//import 'dart:ffi';

import 'package:flutter/material.dart'; //created by google
import 'sideBar.dart';
import 'circleButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'classDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'my_class.dart';

// ignore: use_key_in_widget_constructors
class MainDashboard extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: MySideBar(),
      body: Column(children: [
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('classes')
                .withConverter(
                    fromFirestore: Classes.fromFirestore,
                    toFirestore: (Classes classes, _) => classes.toJson())
                .snapshots(),
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
                final cluss = snapshot.data!.docs.map((e) => e.data()).toList();
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cluss.length,
                      itemBuilder: (context, index) {
                        // for(int i = 0; i < )
                        if (cluss[index]
                                .students!
                                .contains("${currentUser?.email}") ==
                            true) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: GestureDetector(
                              // When the child is tapped, show a snackbar.
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    '/class_dashboard',
                                    arguments: cluss[index]);
                              },
                              // The custom button
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ),
                                title: Text(
                                    "${cluss[index].name} - ${cluss[index].code} - ${cluss[index].section}"),
                                subtitle: Text(cluss[index].creator),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
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
