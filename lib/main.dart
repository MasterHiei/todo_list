import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red,
      ),
      home: const TodoHome(),
    );
  }
}

class TodoHome extends StatelessWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Text(
            '編集',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onPressed: () {},
        ),
        title: const Text('Todo list'),
        actions: [
          TextButton(
            child: const Text(
              '完了',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: Checkbox(
                onChanged: (_) {},
                value: true,
              ),
              title: const Text('1.天気がいいから。'),
              onTap: () {
                debugPrint('11111');
              },
            ),
            ListTile(
              leading: Checkbox(
                onChanged: (_) {},
                value: true,
              ),
              title: const Text('2.天気がいいから。'),
              onTap: () {
                debugPrint('22222');
              },
            ),
            ListTile(
              leading: Checkbox(
                onChanged: (_) {},
                value: true,
              ),
              title: const Text('3.天気がいいから。'),
              onTap: () {
                debugPrint('33333');
              },
            ),
            ListTile(
              leading: Checkbox(
                onChanged: (_) {},
                value: true,
              ),
              title: const Text('4.天気がいいから。'),
              onTap: () {
                debugPrint('44444');
              },
            ),
          ],
        ).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('tap tap');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
