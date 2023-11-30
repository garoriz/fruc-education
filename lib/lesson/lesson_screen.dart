import 'package:flutter/material.dart';
import 'package:fruc_education/lesson/lesson.dart';
import 'package:fruc_education/lesson/request.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
    return FutureBuilder(
      future: futureLessonContent,
      builder: (context, AsyncSnapshot<List<LessonContent>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return const Center(child: Text('Something went wrong'));
          }
          const double gap = 10;
          var data = snapshot.data;
          List<Widget> widgets = [];
          for (int i = 0; i < data!.length; i++) {
            for (int j = 0; j < data[i].items.length; j++) {
              if (data[i].items[j].type == 'TEXT') {
                var string = getRawString(data[i].items[j].data);
                widgets.add(Text(string,
                    style: Theme.of(context).textTheme.headlineMedium));
              } else if (data[i].items[j].type == 'FILE') {
                widgets.add(ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(data[i].items[j].buttonName.toString()),
                ));
                widgets.add(SizedBox(height: gap));
              } else if (data[i].items[j].type == 'IMAGE') {
                widgets.add(CachedNetworkImage(
                  imageUrl:
                      'https://apidev.baze.pro/v1/lesson/template/data/5661Jzggt3FyMJUSoBhe9LiapuSRRgQTESMRSVDLQ0As3qhsIxOIYh6RjXiR1lia906rgvMTgHWPodY6sWaBjKHye6S7d',
                  httpHeaders: {
                    'Authorization':
                        'APIKEY mh5PhBx4W19uqjfgNvQvRslDelnAVLLdr6vpCyrkvfxbbcAItMPPfpkghgRT0yufR92CvwXM35XOPcMU5Gc4Ud2eaO6fIwSCBgAREheuKPjMvimd7vzIYUkbfVH8EAOglFXff9jWPo7Z5PF3ao4FRLBXw3pGuXNY2srz7YJeWmeWjq7gOT4Km2hsqO9Kle1HoVrOF6K5qvjTM6EjX40Z98QEbVegVejgk90FgJI'
                  },
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ));
                widgets.add(SizedBox(height: gap));
              } else if (data[i].items[j].type == 'VIDEO') {
                final _controller = YoutubePlayerController(
                  params: YoutubePlayerParams(
                    mute: false,
                    showControls: true,
                    showFullscreenButton: true,
                  ),
                );
                _controller.loadVideoById(videoId: data[i].items[j].data);
                widgets.add(YoutubePlayerScaffold(
                  controller: _controller,
                  aspectRatio: 16 / 9,
                  builder: (context, player) {
                    return Column(
                      children: [
                        player,
                      ],
                    );
                  },
                ));
                widgets.add(SizedBox(height: gap));
              } else if (data[i].items[j].type == 'AUDIO') {
                final player = AudioPlayer();
                widgets.add(ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    elevation: 0,
                  ),
                  onPressed: () async {
                    await player.setUrl(
                        'https://apidev.baze.pro/v1/lesson/template/data/566tvRGQzTC7QxuEUU9iRDdZLodLMBXO5IuZ0yQq0WMOfpIb0joEm0MDyk2ErzUB0SpuXXFHIHaOJqWGfzZvrTYytOQLy',
                        headers: {
                          'Authorization':
                              'APIKEY mh5PhBx4W19uqjfgNvQvRslDelnAVLLdr6vpCyrkvfxbbcAItMPPfpkghgRT0yufR92CvwXM35XOPcMU5Gc4Ud2eaO6fIwSCBgAREheuKPjMvimd7vzIYUkbfVH8EAOglFXff9jWPo7Z5PF3ao4FRLBXw3pGuXNY2srz7YJeWmeWjq7gOT4Km2hsqO9Kle1HoVrOF6K5qvjTM6EjX40Z98QEbVegVejgk90FgJI'
                        });
                    await player.play();
                  },
                  child: Text(data[i].items[j].buttonName.toString()),
                ));
                widgets.add(SizedBox(height: gap));
              }
            }
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

String getRawString(String html) {
  String result = '';
  int count = 0;
  for (int i = 0; i < html.length; i++) {
    if (html[i] == '&') {
      while (html[i] != ';') {
        i++;
      }
      i++;
    }
    if (html[i] == '<') {
      count++;
    } else if (html[i] == '>') {
      count--;
      result += '\n';
    } else if (count == 0) {
      result += html[i];
    }
  }
  return result;
}
