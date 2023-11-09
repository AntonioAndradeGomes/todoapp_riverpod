import 'package:flutter/material.dart';
import 'package:todoapp_riverpod/config/config.dart';
import 'package:todoapp_riverpod/screens/screens.dart';

//MainApp
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
