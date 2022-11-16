import 'package:desafio_sprint_4/todos.dart';
import 'package:desafio_sprint_4/models/todo.dart';

class TitleConditionController {
  late List<Todo> todo;
  TodosProvider a = TodosProvider();

  bool isEqual(String title) {
    todo = a.getTodo(title);
    if (todo == null) {
      return true;
    } else {
      return false;
    }
  }
}
