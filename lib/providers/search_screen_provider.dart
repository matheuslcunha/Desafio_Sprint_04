import 'package:desafio_sprint_4/views/search_screen.dart';
import 'package:desafio_sprint_4/providers/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreenProvider extends StatelessWidget {
  const SearchScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new TodosProvider(),
      child: SearchScreen(),
    );
  }
}
