import 'package:flutter/material.dart';
import 'package:desafio_sprint_4/models/todo.dart';
import 'package:desafio_sprint_4/widgets/todo_form.dart';
import 'package:provider/provider.dart';
import 'package:desafio_sprint_4/providers/todos.dart';

class EditTodoScreen extends StatefulWidget {
  final Todo todo;

  const EditTodoScreen({super.key, required this.todo});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: TodoForm(
            onChangedTitle: (title) {
              setState(() {
                this.title = title;
              });
            },
            onChangedDescription: (description) {
              setState(() {
                this.description = description;
              });
            },
            onChangedDate: (date) {
              setState(() {
                this.date = date;
              });
            },
            onSavedTodo: saveTodo,
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, description, date);

      Navigator.pop(context);
    }
  }
}
