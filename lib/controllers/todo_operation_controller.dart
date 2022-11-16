import 'package:desafio_sprint_4/providers/edit_todo_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:desafio_sprint_4/providers/todos.dart';
import 'package:desafio_sprint_4/models/todo.dart';

class TodoOperationController {
  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    // Utilizar o SnackBar para o feedback de 'Tarefa Removida'

    //showSnackBar(context, 'Tarefa removida');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditTodoScreenProvider(todo: todo)));
  }
}
