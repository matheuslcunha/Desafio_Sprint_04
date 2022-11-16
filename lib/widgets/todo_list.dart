import 'package:desafio_sprint_4/providers/todos.dart';
import 'package:flutter/material.dart';
import 'package:desafio_sprint_4/widgets/todo_card.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'Sua lista de tarefas está vazia!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView(
            children: [
              ListView.separated(
                padding: EdgeInsets.all(10),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  final todo = todos[index];
                  return TodoCard(todo: todo);
                }),
                itemCount: todos.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
              ),
            ],
          );
  }
}
