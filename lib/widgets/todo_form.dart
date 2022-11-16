import 'package:desafio_sprint_4/controllers/title_condition_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoForm extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedDate;
  final VoidCallback onSavedTodo;

  const TodoForm({
    Key? key,
    this.title = '',
    this.description = '',
    this.date = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedDate,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  TitleConditionController titleConditionController =
      TitleConditionController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildTitle(),
        SizedBox(height: 5),
        buildDescription(),
        SizedBox(height: 5),
        buildDate(),
        SizedBox(height: 5),
        buildButton(),
      ],
    ));
  }

  Widget buildTitle() {
    return TextFormField(
      initialValue: widget.title,
      onChanged: widget.onChangedTitle,
      validator: (title) {
        if (title!.isEmpty) {
          return 'Este campo não pode ser vazio!';
        }
        if (titleConditionController.isEqual(title) == true) {
          return 'Este título já existe!';
        }
        return null;
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Título',
      ),
    );
  }

  Widget buildDescription() {
    return TextFormField(
      maxLines: 2,
      initialValue: widget.description,
      onChanged: widget.onChangedDescription,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Descrição',
      ),
    );
  }

  Widget buildDate() {
    return TextFormField(
      initialValue: widget.date,
      onChanged: widget.onChangedDate,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Data de expiração',
        icon: Icon(Icons.calendar_today),
      ),

      // Trocar para o DatePicker

      /*readOnly: true,
       onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          String formattedDate =
              DateFormat('yyyy-MM-dd').format(pickedDate); //2021-03-16

        } else {}
      }, */
    );
  }

  Widget buildButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: widget.onSavedTodo,
        child: Text('Salvar'),
      ),
    );
  }
}
