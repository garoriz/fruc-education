import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/lessons.dart';

class LessonDetailPage extends StatelessWidget {
  final Lessons lesson;

  LessonDetailPage({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(lesson.description),
      ),
    );
  }
}
