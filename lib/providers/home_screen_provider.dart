import 'package:desafio_sprint_4/home_screen.dart';
import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new TodosProvider(),
      child: HomeScreen(),
    );
  }
}
