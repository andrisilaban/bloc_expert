import 'package:bloc_expert/model/todo.model.dart';
import 'package:bloc_expert/widget/info.todo.dart';
import 'package:flutter/material.dart';

class AddEditTodo extends StatelessWidget {
  final String title;
  final TodoModel? todo;

  const AddEditTodo({Key? key, required this.title, this.todo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _todoController = TextEditingController();
    if (todo != null) {
      _todoController.text = todo!.todo;
    }
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
                controller: _todoController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    isDense: true,
                    fillColor: Colors.grey.shade100,
                    labelText: 'Todo',
                    hintText: 'Input Todo'))
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              if (_todoController.text.isEmpty) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const InfoTodo(
                          title: 'Error', content: 'Todo Harus Diisi');
                    });
              } else {}
              Navigator.pop(context);
            },
            child: const Text('Save')),
      ],
    );
  }
}
