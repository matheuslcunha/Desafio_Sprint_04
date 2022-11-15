import 'package:desafio_sprint_4/providers/add_todo_dialog_provider.dart';
import 'package:desafio_sprint_4/providers/search_screen_provider.dart';
import 'package:desafio_sprint_4/todo_list.dart';
import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:desafio_sprint_4/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchScreenProvider()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.replay_outlined),
            onPressed: () {
              setState(() {});
            },
          ),
          SizedBox(width: 25),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 230, 230, 230),
        child: TodoList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showDialog(
            context: context,
            builder: ((context) {
              return AddTodoDialogProvider();
            }),
            barrierDismissible: false,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
