import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'courses.dart';

Future<List<Course>> fetchCourses() async {
  final response = await http.get(
    Uri.parse('https://apidev.baze.pro/v1/course?limit=999&page=0'),
    headers: {
      HttpHeaders.authorizationHeader: 'APIKEY mh5PhBx4W19uqjfgNvQvRslDelnAVLLdr6vpCyrkvfxbbcAItMPPfpkghgRT0yufR92CvwXM35XOPcMU5Gc4Ud2eaO6fIwSCBgAREheuKPjMvimd7vzIYUkbfVH8EAOglFXff9jWPo7Z5PF3ao4FRLBXw3pGuXNY2srz7YJeWmeWjq7gOT4Km2hsqO9Kle1HoVrOF6K5qvjTM6EjX40Z98QEbVegVejgk90FgJI',
    },
  );

  if (response.statusCode == 200) {
    // If the server returned a 200 OK response, parse the JSON.
    final dynamic jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
    if (jsonResponse is Map<String, dynamic> &&
        jsonResponse.containsKey('content') &&
        jsonResponse['content'] is List) {
      final List<dynamic> coursesJson = jsonResponse['content'];
      return coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
    } else {
      throw Exception('Invalid or unexpected JSON format');
    }
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load courses');
  }
}
