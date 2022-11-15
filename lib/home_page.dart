import 'package:desafio_sprint_4/add_todo_dialog_provider.dart';
import 'package:desafio_sprint_4/todo_list.dart';
import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Container(
        color: Color.fromARGB(255, 230, 230, 230),
        //padding: EdgeInsets.all(10),
        child:
            TodoList(), /* ListView(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                final todo = todos[index];

                return TodoCard(todo: todo);
              }),
              itemCount: todos.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
            ),
          ],
        ), */
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
