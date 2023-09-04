import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:dartx/dartx.dart';

import '../../../core/extensions/date_time_format.dart';
import '../../../models/entities/unsaved_todo.dart';
import '../../../providers/todo/draft_todo_provider.dart';

class TodoInputBottomSheet extends ConsumerStatefulWidget {
  const TodoInputBottomSheet({
    Key? key,
    this.initialData = const UnsavedTodo(),
  }) : super(key: key);

  final UnsavedTodo initialData;

  @override
  ConsumerState<TodoInputBottomSheet> createState() =>
      _TodoInputBottomSheetState();
}

class _TodoInputBottomSheetState extends ConsumerState<TodoInputBottomSheet> {
  final _dateTimeController = TextEditingController();

  DraftTodoProvider get _draftTodoProvider =>
      draftTodoProvider(widget.initialData);

  @override
  void initState() {
    ref.listenManual(
      _draftTodoProvider,
      (_, next) {
        final deadline = next.deadline?.toMMMEdHmString();
        _dateTimeController.text = deadline ?? '';
      },
      fireImmediately: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _dateTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: _buildInputForm(context),
      ),
    );
  }

  Widget _buildInputForm(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: widget.initialData.contents,
                decoration: const InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: '新しいタスクを追加しましょう',
                ),
                autofocus: true,
                maxLines: null,
                onChanged:
                    ref.read(_draftTodoProvider.notifier).onContentsChanged,
                validator: (_) => ref.read(_draftTodoProvider).errorMessage,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateTimeController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.today),
                  hintText: '締め切りを設定しましょう',
                  border: InputBorder.none,
                ),
                readOnly: true,
                onTap: _showDateTimePicker,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('キャンセル'),
                  ),
                  const SizedBox(width: 12),
                  Consumer(
                    builder: (_, ref, __) => ElevatedButton(
                      onPressed: ref.watch(
                        _draftTodoProvider.select((todo) => todo.isValid),
                      )
                          ? _save
                          : null,
                      child: const Text('保存'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Future<void> _showDateTimePicker() async {
    final now = DateTime.now();
    final deadline = await showOmniDateTimePicker(
      context: context,
      separator: const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Text(
          '時刻の設定',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      initialDate: ref.read(_draftTodoProvider).deadline ?? now,
      firstDate: now,
      lastDate: now + 365.days,
      is24HourMode: true,
      isShowSeconds: false,
      barrierDismissible: false,
    );
    if (deadline != null) {
      ref.read(_draftTodoProvider.notifier).setDeadline(deadline);
    }
  }

  Future<void> _save() async {
    await ref.read(_draftTodoProvider.notifier).save();
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
