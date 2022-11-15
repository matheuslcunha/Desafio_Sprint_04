import 'package:desafio_sprint_4/add_todo_dialog.dart';
import 'package:desafio_sprint_4/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoDialogProvider extends StatelessWidget {
  const AddTodoDialogProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new TodosProvider(),
      child: AddTodoDialog(),
    );
  }
}
