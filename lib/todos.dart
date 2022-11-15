import 'package:flutter/cupertino.dart';
import 'package:desafio_sprint_4/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    /* Todo(
      title: 'asdawaa',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '20/12/2022',
    ),
    Todo(
      title: 'asdawaa',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '20/12/2022',
    ),
    Todo(
      title: 'asdawaa',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '20/12/2022',
    ),
    Todo(
      title: 'asdawaa',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '20/12/2022',
    ) */
  ];

  List<Todo> get todos {
    return _todos.toList();
    /* _todos.where((todo) => false) */
  }

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }
}
