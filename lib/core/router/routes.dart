import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/archives/todo_archives_page.dart';
import '../../pages/home/todo_home_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TodoHomePage();
  }
}

@TypedGoRoute<ArchivesRoute>(path: '/archives')
@immutable
class ArchivesRoute extends GoRouteData {
  const ArchivesRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      fullscreenDialog: true,
      child: TodoArchivesPage(),
    );
  }
}
