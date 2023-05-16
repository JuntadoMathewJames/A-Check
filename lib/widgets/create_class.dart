import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CreateClass extends StatelessWidget {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController sectionController = new TextEditingController();
  final TextEditingController classController = new TextEditingController();
  final TextEditingController teacherController = new TextEditingController();
  Future createClass({
    required String name,
    required String section,
    required String classcode,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('classes').doc();
    final classes = {
      "id": docUser.id,
      "Class name": name,
      "Class Section": section,
      "Class Code": classcode,
      //"Teacher": teacher,
    };
    await docUser.set(classes);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CREATE CLASS'),
        ),
        body: Center(
          child: ListView(
            children:[
              Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(5)),
                  const SizedBox(
                    child: Text("Create a Class",
                        textAlign: TextAlign.justify,
                        style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  SizedBox(
                    width: 500,
                    child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Class Name",
                            hintText: "eg. English")),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  SizedBox(
                    width: 500,
                    child: TextField(
                        controller: classController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Class Code",
                            hintText: "eg. ENG101")),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  SizedBox(
                    width: 500,
                    child: TextField(
                        controller: sectionController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Class Section",
                            hintText: "eg. ZC23")),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Container(
                    width: 500,
                    height: 200,
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Container(
                    width: 500,
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            const MaterialStatePropertyAll<Color>(
                                Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Colors.black)))),
                        child: const Text(
                          'Add Class',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                        onPressed: () {
                          final name = nameController.text;
                          final section = sectionController.text;
                          final classcode = classController.text;

                          createClass(
                              name: name,
                              section: section,
                              classcode: classcode);
                        },
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),

    );

  }


  }
