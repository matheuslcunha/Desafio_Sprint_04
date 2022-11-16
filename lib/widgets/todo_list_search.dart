import 'package:desafio_sprint_4/providers/todos.dart';
import 'package:flutter/material.dart';
import 'package:desafio_sprint_4/widgets/todo_card.dart';
import 'package:provider/provider.dart';

class TodoListSearch extends StatefulWidget {
  final String controller = '';

  const TodoListSearch({super.key, required controller});

  @override
  State<TodoListSearch> createState() => _TodoListSearchState();
}

class _TodoListSearchState extends State<TodoListSearch> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    final search = provider.searchByTitle(widget.controller);

    return search.isEmpty
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
                  final a = search[index];
                  return TodoCard(todo: a);
                }),
                itemCount: search.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
              ),
            ],
          );
  }
}
