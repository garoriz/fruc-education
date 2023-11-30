import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fruc_education/knowledgebase/request.dart';
import 'package:fruc_education/lesson/lesson.dart';
import 'package:fruc_education/lesson/request.dart';


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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Future<List<LessonContent>> futureLessonContent;

  @override
  void initState() {
    super.initState();
    futureLessonContent = fetchLessonContent();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    /*return FutureBuilder(
      future: futureLessonContent,
      builder: (context, AsyncSnapshot<List<LessonContent>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return const Center(child: Text('Something went wrong'));
          }

          return Text(snapshot.data![0].items[0].data);
        }
        return const CircularProgressIndicator();
      },
    );*/
    return Html(data: """
        <h1>Hello, World!</h1>
        <p><span style="font-style:italic;">flutter_html</span> supports a variety of HTML and CSS tags and attributes.</p>
        <p>Over a hundred static tags are supported out of the box.</p>
        <p>Or you can even define your own using an <code>Extension</code>: <flutter></flutter></p>
        <p>Its easy to add custom styles to your Html as well using the <code>Style</code> class:</p>
        <p class="fancy">Here's a fancy &lt;p&gt; element!</p>
        """,
    );
  }
}
