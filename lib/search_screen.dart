import 'package:desafio_sprint_4/providers/add_todo_dialog_provider.dart';
import 'package:desafio_sprint_4/providers/home_screen_provider.dart';
import 'package:desafio_sprint_4/todo_list.dart';
import 'package:desafio_sprint_4/todo_list_search.dart';
import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:desafio_sprint_4/todo_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreenProvider(),
              ),
            );
          },
        ),
        title: Text('Pesquisar Tarefa'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 230, 230, 230),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: false,
                prefixIcon: Icon(Icons.search),
                hintText: 'Título da tarefa',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.orange)),
              ),
              onSubmitted: (value) {
                Expanded(
                  child: TodoListSearch(controller: controller.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
