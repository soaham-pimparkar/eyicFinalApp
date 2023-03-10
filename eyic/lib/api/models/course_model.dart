import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  String title;
  String uid;
  String description;
  //String description;
  //String title;
  //String link;

  CourseModel({
    //required this.courseId,
    //required this.authorName,
    //required this.uploadDate,
    required this.description,
    required this.title,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //'courseId': courseId,
      //'authorName': authorName,
      //'uploadDate': uploadDate,
      'description': description,
      'title': title,
      'uid': uid,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      //courseId: map['courseId'] as String,
      //authorName: map['authorName'] as String,
      //uploadDate: map['uploadDate'] as String,
      description: map['description'] as String,
      title: map['title'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
