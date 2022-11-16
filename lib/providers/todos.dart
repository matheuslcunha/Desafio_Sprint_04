import 'package:flutter/cupertino.dart';
import 'package:desafio_sprint_4/models/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      title: 'Dar uma caminhada',
      description:
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      date: '2022-11-21',
    ),
    Todo(
      title: 'Arrumar o rádio',
      description: 'aaaaaaaaaaaaaaaaaaaa',
      date: '2022-11-17',
    ),
    Todo(
      title: 'Completar o Desafio',
      description: 'Sonhar* em completar o desafio, melhor dizendo',
      date: '2022-11-19',
    ),
    Todo(
      title: 'Comprar um vinil',
      description: 'The Smiths? Belchior? Manoel Gomes?',
      date: '2022-11-21',
    )
  ];

  List<Todo> get todos {
    return _todos.toList();
  }

  getTodo(String title) {
    return todos.where((element) {
      return title == element.title;
    }).toList();
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

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  void updateTodo(Todo todo, String title, String description, String date) {
    todo.title = title;
    todo.description = description;
    todo.date = date;
  }
}
