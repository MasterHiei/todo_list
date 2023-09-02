import 'package:flutter/material.dart';

class TodoConfirmDeleteBottomSheet extends StatelessWidget {
  const TodoConfirmDeleteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          style: TextButton.styleFrom(
            foregroundColor: Colors.amber,
            backgroundColor: Colors.red,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              '削除',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('キャンセル'),
          ),
        ),
      ],
    );
  }
}
