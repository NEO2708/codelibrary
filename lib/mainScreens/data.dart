import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Datamodel {
  static List<Data> Courses = [
    Data(course_id: "001", title: "Java", price: "1444", details: [])
  ];
}

class Data {
  final String course_id;
  final String title;
  final String price;
  final List details;

  Data({
    required this.course_id,
    required this.title,
    required this.price,
    required this.details,
  });

  Data copyWith({
    String? course_id,
    String? title,
    String? price,
    List? details,
  }) {
    return Data(
      course_id: course_id ?? this.course_id,
      title: title ?? this.title,
      price: price ?? this.price,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'course_id': course_id,
      'title': title,
      'price': price,
      'details': details,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
        course_id: map['course_id'] as String,
        title: map['title'] as String,
        price: map['price'] as String,
        details: List.from(
          (map['details'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(course_id: $course_id, title: $title, price: $price, details: $details)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.course_id == course_id &&
        other.title == title &&
        other.price == price &&
        listEquals(other.details, details);
  }

  @override
  int get hashCode {
    return course_id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        details.hashCode;
  }
}
