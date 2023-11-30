import 'package:flutter/material.dart';

class ErrorLoginPage extends StatefulWidget {
  const ErrorLoginPage({Key?key}) : super(key: key) ;

  static const routeName="/loginError";

  @override
  State<ErrorLoginPage> createState() => _ErrorLoginPageState();
}

class _ErrorLoginPageState extends State<ErrorLoginPage> {
  @override
  Widget build(BuildContext buildContext) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: buildContext,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Login or password entered incorrectly'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Show error'),
        ),
      ),
    );
  }
}