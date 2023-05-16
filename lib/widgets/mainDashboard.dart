import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; //created by google
import 'sideBar.dart';
import 'circleButton.dart';
import 'bottomBar.dart';

// ignore: use_key_in_widget_constructors
class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CollectionReference classes =
        FirebaseFirestore.instance.collection('classes');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const MySideBar(),
      body: Center(
          child: Stack(
        children: <Widget>[
          Column(children: [
            StreamBuilder(
                stream: classes.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                                title: Text(documentSnapshot['name']),
                                subtitle: Text(documentSnapshot['section'])),
                          );
                        });
                  } else {
                    return Text("no data");
                  }
                })
          ]),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(42.0),
              child: CircleButton(),
            ),
          ),
        ],
      )),
      bottomNavigationBar: const BottomBreadcrumbBar(),
    );
  }
}
