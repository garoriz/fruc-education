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
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        // Change seedColor to customize orange shades
        useMaterial3: true,
      ),
      home: LessonScreen(lessonId: 566),
    );
  }
}

class LessonScreen extends StatefulWidget {
  LessonScreen({Key? key, required this.lessonId});

  var lessonId;

  @override
  State<LessonScreen> createState() => _LessonScreenState(lessonId);
}

class _LessonScreenState extends State<LessonScreen> {
  late Future<List<LessonContent>> futureLessonContent;
  var lessonId;

  _LessonScreenState(this.lessonId);

  @override
  void initState() {
    super.initState();
    futureLessonContent = fetchLessonContent(lessonId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главный контент'), // Add title to the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
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
                    widgets.add(Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Текстовый контент',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              string,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ));
                  } /*else if (data[i].items[j].type == 'FILE') {
                    widgets.add(ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(data[i].items[j].buttonName.toString()),
                    ));
                    widgets.add(SizedBox(height: gap));
                  }*/ else if (data[i].items[j].type == 'IMAGE') {
                    widgets.add(CachedNetworkImage(
                      imageUrl:
                          //'https://apidev.baze.pro/v1/lesson/template/data/5661Jzggt3FyMJUSoBhe9LiapuSRRgQTESMRSVDLQ0As3qhsIxOIYh6RjXiR1lia906rgvMTgHWPodY6sWaBjKHye6S7d'
                          'https://img.freepik.com/premium-photo/successful-business-people-in-suits-on-business-meeting_85574-12066.jpg',
                      httpHeaders: {
                        'Authorization':
                            'APIKEY mh5PhBx4W19uqjfgNvQvRslDelnAVLLdr6vpCyrkvfxbbcAItMPPfpkghgRT0yufR92CvwXM35XOPcMU5Gc4Ud2eaO6fIwSCBgAREheuKPjMvimd7vzIYUkbfVH8EAOglFXff9jWPo7Z5PF3ao4FRLBXw3pGuXNY2srz7YJeWmeWjq7gOT4Km2hsqO9Kle1HoVrOF6K5qvjTM6EjX40Z98QEbVegVejgk90FgJI'
                      },
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
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
                    widgets.add(Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                            child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: YoutubePlayerScaffold(
                            controller: _controller,
                            aspectRatio: 16 / 9,
                            builder: (context, player) {
                              return Column(
                                children: [
                                  player,
                                ],
                              );
                            },
                          ),
                        ))
                      ],
                    ));
                    widgets.add(SizedBox(height: gap));
                  } /*else if (data[i].items[j].type == 'AUDIO') {
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
                  }*/
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
        ),
      ),
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
