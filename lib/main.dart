import 'package:flutter/material.dart';
import 'package:fruc_education/MyHomePage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'ErrorLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade100),
          useMaterial3: true,
        ),
        home: const MyHomePage2(title: 'FRUC'),
        routes:{
          MyHomePage.routeName: (BuildContext context) => const MyHomePage(title:"Course"),
          ErrorLoginPage.routeName:(BuildContext context) => const ErrorLoginPage()
        }
    );
  }
}

class MyHomePage2 extends StatefulWidget {


  const MyHomePage2({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {

  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  String _login = '';
  String _password = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void login(login,password) {
    print("${_login}");
    print("${_password}");
  }

  void goNext() {
    Navigator.of(context).pushNamed(MyHomePage.routeName);
  }

  void goErrorLogin() {
    Navigator.of(context).pushNamed(ErrorLoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter login and password',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 200),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    _login = value;
                  });
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 200),
              child: TextField(
                controller: _controller2,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
            ),
            const Text(
              '',
            ),
            ElevatedButton(
              onPressed: () {
                //if( _login=="demofranch2@test.test" && _password=="demofranchpass123")
                if(_login=="1" && _password=="1")
                  goNext();
                else {
                  showDialog(
                    context: context,
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
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
