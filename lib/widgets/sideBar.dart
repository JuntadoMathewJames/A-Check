import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MySideBar extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
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
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed('/dashboard');
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
                  FirebaseAuth.instance.signOut();
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
