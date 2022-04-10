import 'package:bloc_expert/provider/todo.list.provider.dart';
import 'package:bloc_expert/widget/add.edit.todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Provider'),
      ),
      body: Consumer<TodoListProvider>(
        builder: (context, todoListProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: todoListProvider.todoList.isNotEmpty
                ? []
                : [
                    SizedBox(
                      width: width,
                      height: height,
                      child: const Text('Data Kosong'),
                    )
                  ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AddEditTodo(title: 'ADD EDIT TODO');
            });
      }),
    );
  }
}
