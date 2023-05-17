import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MySideBar extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  MySideBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.person_2_rounded,
                  size: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // StreamBuilder<List<User>>(
                    //   stream: readUsers(),
                    //   builder: (context,snapshot){
                    //     if(snapshot.hasData){
                    //       final users = snapshot.data!;
                    //       print(users);
                    //     }else{
                    //       print('no data');
                    //     }
                    //     return AlertDialog(
                    //       title: Text('Error!'),
                    //       content: Text('Password did not match!'),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           child: Text('Close'),
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //         ),
                    //       ],
                    //     );
                    //   }
                    //
                    // ),
                    const Text('Logged in as a student',
                        style: TextStyle(color: Colors.black38)),
                    Text('${currentUser!.displayName}',
                        style: TextStyle(fontSize: 20)),
                    Text("${currentUser!.email}",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Item 1 Selected'),
                    content: Text('You selected Item 1 from the menu.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(
            height: 2.0,
          ),
          const Expanded(
              child: SizedBox(
            height: 20,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              leading: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                label: const Text("Settings"),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black),
                ),
              ),
              trailing: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  String id;
  final String email;
  final String password;
  final String fullName;
  final String schoolName;
  final String userType;

  User({
    this.id = '',
    required this.email,
    required this.password,
    required this.fullName,
    required this.schoolName,
    required this.userType,
  });
  // Map<String,dynamic> toJson() =>{
  //   'id':id,
  //   'email':email,
  //   'password':password,
  //   'fullName':fullName,
  //   'schoolName':schoolName,
  //   'userType':userType,
  // };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        fullName: json['fullName'],
        schoolName: json['schoolName'],
        userType: json['userType'],
      );
}
