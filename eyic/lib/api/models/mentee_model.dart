// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MenteeModel {
  String uid;
  String name;
  String email;
  List<String> interestedSkills;
  int age;
  String role;
  String gender;
  List<String> languages;
  String description;
  int tokens;

  MenteeModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.interestedSkills,
    required this.age,
    required this.role,
    required this.gender,
    required this.languages,
    required this.description,
    required this.tokens,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'interestedSkills': interestedSkills,
      'age': age,
      'role': role,
      'gender': gender,
      'languages': languages,
      'description': description,
      'tokens': tokens
    };
  }

  factory MenteeModel.fromMap(Map<String, dynamic> map) {
    return MenteeModel(
        uid: map['uid'] as String,
        name: map['name'] as String,
        email: map['email'] as String,
        interestedSkills: map['interestedSkills'],
        age: map['age'] as int,
        role: map['role'] as String,
        gender: map['gender'] as String,
        languages: map['languages'],
        description: map['description'] as String,
        tokens: map['tokens'] as int);
  }

  String toJson() => json.encode(toMap());

  factory MenteeModel.fromJson(String source) =>
      MenteeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
