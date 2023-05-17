// To parse this JSON data, do
//
//     final classes = classesFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Classes classesFromJson(String str) => Classes.fromJson(json.decode(str));

String classesToJson(Classes data) => json.encode(data.toJson());

class Classes {
  final String code;
  final String creator;
  final String section;
  final String id;
  final String name;
  final List<String>? students;

  Classes({
    required this.code,
    required this.creator,
    required this.section,
    required this.id,
    required this.name,
    required this.students,
  });

  factory Classes.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Classes(
      code: data?['code'],
      creator: data?['creator'],
      section: data?['section'],
      id: data?['id'],
      name: data?['name'],
      students:
          data?['students'] is Iterable ? List.from(data?['students']) : null,
    );
  }
/*
  Map<String, dynamic> toFirestore() {
    return {
      if (code != null) "name": code,
      if (creator != null) "creator": creator,
      if (section != null) "section": section,
      if (id != null) "capital": capital,
      if (name != null) "population": population,
      if (students != null) "regions": regions,
    };
  }
*/
  /////////////
  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
        code: json["code"],
        creator: json["creator"],
        section: json["section"],
        id: json["id"],
        name: json["name"],
        students: List<String>.from(json["students"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "creator": creator,
        "section": section,
        "id": id,
        "name": name,
        if (students != null) "students": students,
      };
}
