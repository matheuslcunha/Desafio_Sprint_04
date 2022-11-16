import 'package:desafio_sprint_4/edit_todo_screen.dart';
import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:desafio_sprint_4/models/todo.dart';

class EditTodoScreenProvider extends StatefulWidget {
  final Todo todo;

  const EditTodoScreenProvider({Key? key, required this.todo})
      : super(key: key);

  @override
  State<EditTodoScreenProvider> createState() => _EditTodoScreenProviderState();
}

class _EditTodoScreenProviderState extends State<EditTodoScreenProvider> {
  String title = '';
  String description = '';
  String date = '';

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
    date = widget.todo.date;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new TodosProvider(),
      child: EditTodoScreen(todo: widget.todo),
    );
  }
}
