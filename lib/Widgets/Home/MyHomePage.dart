import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/courses.dart';
import '../../model/lessons.dart';
import '../../request.dart';
import '../LessonPage/LessonDetailPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Course>> futureCourses;
  late List<String> lessonsName = ["lesson1", "lesson2", "lesson3", "lesson4"];

  @override
  void initState() {
    super.initState();
    futureCourses = fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCourses,
      builder: (context, AsyncSnapshot<List<Course>> snapshot) {
        if (snapshot.connectionState == ConnectionState. done) {
          if (snapshot.data == null) {
            return const Center(child: Text('Something went wrong'));
          }
          return Scaffold(
            appBar: AppBar(
                title: Container(
                  alignment: Alignment.center,
                  child: Text('Courses'),
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
                  children: lessonsName
                      .map((lessonName) => Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: ListTile(
                        title: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              lessonName,
                              textDirection: TextDirection.ltr,
                            )),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonDetailPage(
                                  lesson: Lessons(
                                      name: lessonName,
                                      description: "sdfd")),
                            ),
                          );
                        },
                      )
                    )
                  ).toList(),
                );
              },
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

