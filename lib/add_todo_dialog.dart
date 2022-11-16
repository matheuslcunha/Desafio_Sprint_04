import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:desafio_sprint_4/todo_form.dart';
import 'package:desafio_sprint_4/models/todo.dart';
import 'package:provider/provider.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String date = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adicionar Tarefa',
                style: TextStyle(),
              ),
              SizedBox(
                height: 5,
              ),
              TodoForm(onChangedTitle: (title) {
                setState(() {
                  this.title = title;
                });
              }, onChangedDescription: (description) {
                setState(() {
                  this.description = description;
                });
              }, onChangedDate: (date) {
                setState(() {
                  this.date = date;
                });
              }, onSavedTodo: () {
                addTodo();
              }),
            ],
          ),
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        title: title,
        description: description,
        date: date,
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.pop(context);
    }
  }
}
