import 'package:flutter/material.dart';
import 'package:desafio_sprint_4/models/todo.dart';
import 'package:desafio_sprint_4/controllers/expiration_controller.dart';
import 'package:desafio_sprint_4/controllers/todo_operation_controller.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    ExpirationController expirationController = ExpirationController();
    TodoOperationController operationController = TodoOperationController();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 175,
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: expirationController
                  .expirationFeedback(DateTime.parse(todo.date)),
              // Quando o addTodo funcionar, trocar a entrada de
              // 'date' de texto para DateTime,
              // parse não será mais necessário
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Tarefa expira em: ${expirationController.formatDate(DateTime.parse(todo.date))}',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        operationController.editTodo(context, todo);
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        operationController.deleteTodo(context, todo);
                      },
                      icon: Icon(
                        Icons.delete_forever,
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                SizedBox(width: 10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          todo.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          todo.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
