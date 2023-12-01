import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/block.dart';
import '../../model/courses.dart';
import 'BlockDetailPage.dart';
import 'CourseDetailPage.dart';
import 'request.dart';
import 'package:http/http.dart' as http;

class CourseDetailPage extends StatefulWidget {
  CourseDetailPage({super.key, required this.course});

  var course;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState(course["id"]);
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  List<dynamic> blocks = [];
  late var courseId;

  _CourseDetailPageState(this.courseId);

  @override
  void initState() {
    super.initState();
    fetchBlocks(courseId);
  }

  Future<void> fetchBlocks(var courseId) async {
    var url = Uri.parse('https://apidev.baze.pro/v1/block?courseId=$courseId');
    var headers = {
      'Authorization':
          'APIKEY mh5PhBx4W19uqjfgNvQvRslDelnAVLLdr6vpCyrkvfxbbcAItMPPfpkghgRT0yufR92CvwXM35XOPcMU5Gc4Ud2eaO6fIwSCBgAREheuKPjMvimd7vzIYUkbfVH8EAOglFXff9jWPo7Z5PF3ao4FRLBXw3pGuXNY2srz7YJeWmeWjq7gOT4Km2hsqO9Kle1HoVrOF6K5qvjTM6EjX40Z98QEbVegVejgk90FgJI',
    };
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        blocks = data;
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Modules'),
        ),
      ),
      body: ListView.builder(
        itemCount: blocks.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            // Add padding to the left and right sides
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange, alignment: Alignment.center),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BlockDetailPage(blocks[index], courseId)),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    blocks[index]["name"],
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

/*

class BlockState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureBlocks,
        builder: (context, AsyncSnapshot<List<Block>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return const Center(child: Text('Something went wrong'));
            }

            return Scaffold(
              appBar: AppBar(
                  title: Container(
                    alignment: Alignment.center,
                    child: Text('Modules'),
                  )),
              body: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(snapshot.data![index].name)),
                    // можно было вынести часть логики в отдельный виджет,
                    // но я не стал
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        }
    );


  }
}
*/
