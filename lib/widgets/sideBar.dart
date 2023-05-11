import 'package:flutter/material.dart';


class MySideBar extends StatelessWidget {
  const MySideBar({super.key});
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
                    children: const [
                      Text('Logged in as a student',
                          style: TextStyle(color: Colors.black38)),
                      Text('John Cena',
                          style: TextStyle(fontSize: 20)),
                      Text('jcena@gbox.adnu.edu.ph',
                          style: TextStyle(color: Colors.grey)),
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
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(height: 2.0,),
            const Expanded(child: SizedBox(height: 20,)),
             Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: OutlinedButton.icon (
                onPressed: (){
                  Navigator.of(context).pushNamed('/settings');
                },
                icon: const Icon(Icons.settings),
                 label: const Text("Settings"),
                  style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                  ),
              ),

                trailing: OutlinedButton.icon (
                  onPressed: (){
                    Navigator.of(context).pushNamed('/');
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                  ),
                ),
              ),
            ),


          ],
        ),
      );
  }
}
