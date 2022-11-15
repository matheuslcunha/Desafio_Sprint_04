import 'package:flutter/material.dart';
import 'package:desafio_sprint_4/models/todo.dart';
import 'package:desafio_sprint_4/controllers/expiration_controller.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    ExpirationController expirationController = ExpirationController();
    //DateTime dateTest = DateTime.parse("2022-11-30");

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 175,
      child: Column(
        children: [
          Container(
              height: 30,
              decoration: BoxDecoration(
                color: expirationController.expirationFeedback(
                    DateTime.parse(todo.date)), //nao necessita parse depois
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
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
                      ),
                    ],
                  )),
                  IconButton(
                    onPressed: () {
                      print('aaaaa');
                    },
                    icon: Icon(Icons.more_horiz),
                  )
                ],
              )),
          Container(
            child: Row(
              children: [
                SizedBox(width: 10),
                Container(
                  //height: 5,
                  //width: 500,
                  //color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        todo.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        todo.description,
                        style: TextStyle(fontSize: 20),
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
