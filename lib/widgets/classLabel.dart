import 'package:flutter/material.dart';
import 'dialogAssignBeadle.dart';
class MyDashBoard extends StatelessWidget {
  const MyDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade400,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                ),
                label: const Text('Edit Class',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("ITMC101\t\t\tZT12"),
                      Text("INTRODUCTION TO COMPUTING",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("Room: P217", style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black),
                        onPressed: () {
                          print("you pressed generate code");
                        },
                        child: const Text("Generate Code"),
                      ),
                      const SizedBox(height: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AssignBeadleDialog();
                            },
                          );
                        },
                        child: const Text("Assign Beadle"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
