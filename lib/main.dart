import 'package:flutter/material.dart';
import 'package:flutter_web_test/defaults.dart' as defaults;
import 'package:flutter_web_test/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_web_test/screens/login/login_screen.dart';
import 'package:flutter_web_test/screens/todo/todo_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: 'testscreen',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: 'todo',
            builder: (context, state) => const TodoScreen(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: defaults.ciColor),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.error)) {
              return Colors.red;
            }
            if (states.contains(MaterialState.focused)) {
              return defaults.ciColor;
            }
            return Colors.grey;
          }),
        ),
        // Workaround to prevent animation between screens https://github.com/flutter/flutter/issues/99052#issuecomment-1445252141
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: NoPageTransitionsBuilder(),
            TargetPlatform.iOS: NoPageTransitionsBuilder(),
            TargetPlatform.linux: NoPageTransitionsBuilder(),
            TargetPlatform.macOS: NoPageTransitionsBuilder(),
            TargetPlatform.windows: NoPageTransitionsBuilder(),
          },
        ),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class NoPageTransitionsBuilder extends PageTransitionsBuilder {
  const NoPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double>? secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
