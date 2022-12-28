class TodoItem {
  const TodoItem({
    required this.contents,
    required this.date,
    this.isCompleted = false,
  });

  final String contents;
  final DateTime date;
  final bool isCompleted;
}
