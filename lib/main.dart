import 'package:desafio_sprint_4/home_screen.dart';
import 'package:desafio_sprint_4/providers/home_screen_provider.dart';
import 'package:desafio_sprint_4/providers/search_screen_provider.dart';
import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        TodosProvider();
      },
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        home: HomeScreenProvider(),
      ),
    );
  }
}
