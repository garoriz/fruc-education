import 'package:flutter/material.dart';
import 'package:fruc_education/model/lessons.dart';
import 'package:fruc_education/request.dart';

// ToDo: импортнуть этот пакет для того, чтобы иконки уроков загружать
/*import 'package:photo_view/photo_view.dart';*/

import 'Widgets/Home/MyHomePage.dart';
import 'model/courses.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

