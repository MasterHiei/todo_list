import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

final router = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: kDebugMode,
);
