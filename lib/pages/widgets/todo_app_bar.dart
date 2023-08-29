import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Simple To-Do List'),
      actions: [
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          icon: const Icon(FontAwesomeIcons.githubAlt),
          onPressed: () => launchUrl(
            Uri.parse('https://github.com/MasterHiei/todo_list'),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
