import 'package:flutter/material.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: TextButton(
        child: const Text(
          '編集',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
      title: const Text('Todo list'),
      actions: [
        TextButton(
          child: const Text(
            '完了',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
