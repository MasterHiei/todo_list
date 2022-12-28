import 'package:flutter/material.dart';

import 'pages/todo_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      theme: ThemeData.light(),
      home: TodoHomePage(),
    );
  }
}
