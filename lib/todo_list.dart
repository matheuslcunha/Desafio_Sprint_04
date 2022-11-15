import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:desafio_sprint_4/todo_card.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

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
