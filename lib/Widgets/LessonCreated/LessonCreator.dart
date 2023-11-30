import 'package:flutter/material.dart';

// Ниже есть комментарий, по возможности пофикситть
class _CreateLessonPageState extends State<CreateLessonPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _blockIdController = TextEditingController();
  TextEditingController _openConditionController = TextEditingController();
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 40),
          child: Text('Create Lesson')
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _blockIdController,
                  decoration: InputDecoration(
                    labelText: 'Block ID',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _openConditionController,
                  decoration: InputDecoration(
                    labelText: 'Open Condition',
                  ),
                ),
              ),
              Padding(
                // ToDo
                // если много текста вводить, то будет ощибка
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Enter your text',
                    border: OutlineInputBorder(),
                    hintText: 'Type here...',
                  ),
                  maxLines: null, // Многорядный ввод текста
                  keyboardType: TextInputType.multiline,
                )
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    // Сохранение данных
                  },
                  child: Text('Create'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class CreateLessonPage extends StatefulWidget {
  @override
  _CreateLessonPageState createState() => _CreateLessonPageState();
}
