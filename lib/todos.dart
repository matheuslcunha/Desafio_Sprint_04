import 'package:flutter/cupertino.dart';
import 'package:desafio_sprint_4/models/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      title: 'matheus',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '2022-11-20',
    ),
    Todo(
      title: 'andrey',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '2022-11-16',
    ),
    Todo(
      title: 'ruan',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '2022-11-18',
    ),
    Todo(
      title: 'lucas',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '2022-11-20',
    )
  ];

  List<Todo> get todos {
    return _todos.toList();
  }

  List<Todo> searchByTitle(String query) {
    final suggestions = _todos.where((todo) {
      final todoTitle = todo.title.toLowerCase();
      final input = query.toLowerCase();

      return todoTitle.contains(input);
    }).toList();

    return suggestions;
  }

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }
}
