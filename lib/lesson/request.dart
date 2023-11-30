import 'dart:convert';
import 'dart:io';

import 'package:fruc_education/lesson/lesson.dart';

import 'package:http/http.dart' as http;

Future<List<LessonContent>> fetchLessonContent() async {
  final response = await http.get(
    Uri.parse('https://apidev.baze.pro/v1/lesson/566/template'),
    headers: {
      HttpHeaders.authorizationHeader:
          'APIKEY mh5PhBx4W19uqjfgNvQvRslDelnAVLLdr6vpCyrkvfxbbcAItMPPfpkghgRT0yufR92CvwXM35XOPcMU5Gc4Ud2eaO6fIwSCBgAREheuKPjMvimd7vzIYUkbfVH8EAOglFXff9jWPo7Z5PF3ao4FRLBXw3pGuXNY2srz7YJeWmeWjq7gOT4Km2hsqO9Kle1HoVrOF6K5qvjTM6EjX40Z98QEbVegVejgk90FgJI',
    },
  );

  if (response.statusCode == 200) {
    // If the server returned a 200 OK response, parse the JSON.
    final dynamic jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
    if (jsonResponse is List<dynamic> &&
        jsonResponse.isNotEmpty) {
      return jsonResponse.map((lessonJsonList) => LessonContent.fromJson(lessonJsonList)).toList();
    } else {
      throw Exception('Invalid or unexpected JSON format');
    }
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load lesson content');
  }
}
