import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../collections/todo.dart';

part 'isar_provider.g.dart';

@riverpod
Isar isar(IsarRef ref) => throw UnimplementedError();

Future<Override> isarOverride() async {
  final schemas = [TodoSchema];
  final directory = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(schemas, directory: directory.path);

  return isarProvider.overrideWith((ref) => isar);
}
