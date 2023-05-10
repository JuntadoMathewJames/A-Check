import 'package:flutter/material.dart';

class CreateClass extends StatelessWidget {
  const CreateClass({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CREATE CLASS'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(5)),
              const SizedBox(
                child: Text("Create a Class",
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              const SizedBox(
                width: 500,
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Class Name",
                        hintText: "eg. English")),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              const SizedBox(
                width: 500,
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Class Code",
                        hintText: "eg. ENG101")),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              const SizedBox(
                width: 500,
                child: TextField(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const CreateClass()));
                          })))
            ],
          ),
        ));
  }
}
