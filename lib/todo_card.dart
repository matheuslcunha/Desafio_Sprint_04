import 'package:flutter/material.dart';
import 'package:desafio_sprint_4/model/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
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
              //função pra mudar de cor,
              decoration: BoxDecoration(
                color: Colors.blue,
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
                        'Expira em: ${todo.date}',
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
