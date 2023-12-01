import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../lesson/lesson_screen.dart';

class BlockDetailPage extends StatefulWidget {
  var block;
  var courseId;

  BlockDetailPage(this.block, this.courseId);

  @override
  State<StatefulWidget> createState() =>
      _BlockDetailPage(block["id"], courseId);
}

class _BlockDetailPage extends State<BlockDetailPage> {
  var lessons;
  late var blockId;
  late var courseId;

  _BlockDetailPage(this.blockId, this.courseId);

  @override
  void initState() {
    super.initState();
    fetchLessons(courseId, blockId);
  }

  Future<void> fetchLessons(var courseId, var blockId) async {
    var url = Uri.parse(
        'https://apidev.baze.pro/v1/lesson?courseId=$courseId&blockId=$blockId');
    var headers = {
      'Authorization':
          'APIKEY mh5PhBx4W19uqjfgNvQvRslDelnAVLLdr6vpCyrkvfxbbcAItMPPfpkghgRT0yufR92CvwXM35XOPcMU5Gc4Ud2eaO6fIwSCBgAREheuKPjMvimd7vzIYUkbfVH8EAOglFXff9jWPo7Z5PF3ao4FRLBXw3pGuXNY2srz7YJeWmeWjq7gOT4Km2hsqO9Kle1HoVrOF6K5qvjTM6EjX40Z98QEbVegVejgk90FgJI',
    };
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        lessons = data['content'];
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (lessons == null) {
      return const CircularProgressIndicator();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Lessons'),
          ),
        ),
        body: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              // Add padding to the left and right sides
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors
                      .orange, // Change button color              elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LessonScreen(lessonId: lessons[index]["id"])),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      lessons[index]["name"],
                      style: TextStyle(
                        color: Colors.white, // Change text color
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}

class LessonDetailPage extends StatelessWidget {
  var lesson;

  LessonDetailPage(this.lesson);

  @override
  Widget build(BuildContext context) {
    return Text(lesson["name"]);
  }
}
