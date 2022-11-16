import 'package:desafio_sprint_4/widgets/todo_list_search.dart';
import 'package:desafio_sprint_4/providers/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Pesquisar Tarefa'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).primaryColor,
                prefixIcon: Icon(Icons.search),
                hintText: 'Título da tarefa',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
              ),
              onChanged: (value) {
                Expanded(
                  child: TodoListSearch(controller: controller.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
