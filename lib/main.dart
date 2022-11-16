import 'package:desafio_sprint_4/providers/home_screen_provider.dart';
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
        theme: ThemeData(
          primarySwatch: Colors.orange,
          brightness: Brightness.light,
          primaryColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 230, 230, 230),
          iconTheme: IconThemeData(color: Colors.black),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.black,
            backgroundColor: Colors.orange,
          ),
        ),

        // DARK THEME

        /* ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color.fromARGB(255, 50, 50, 50),
          backgroundColor: Colors.black54,
          iconTheme: IconThemeData(color: Colors.white),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 50, 50, 50),
          ),
          textSelectionTheme:
              TextSelectionThemeData(selectionHandleColor: Colors.white),
        ), */

        home: HomeScreenProvider(),
      ),
    );
  }
}
