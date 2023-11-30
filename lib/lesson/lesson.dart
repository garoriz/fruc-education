import 'package:flutter/material.dart';

class LessonItem {
  final String uuid;
  final String type;
  final String data;
  final String? buttonName;

  LessonItem({
    required this.uuid,
    required this.type,
    required this.data,
    this.buttonName,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) {
    return LessonItem(
      uuid: json['uuid'] as String,
      type: json['type'] as String,
      data: json['data'] as String,
      buttonName: json['buttonName'] as String?,
    );
  }
}

class LessonContent {
  final List<LessonItem> items;

  LessonContent({
    required this.items,
  });

  factory LessonContent.fromJson(List<dynamic> jsonList) {
    final List<LessonItem> items =
        jsonList.map((json) => LessonItem.fromJson(json)).toList();
    return LessonContent(items: items);
  }
}
