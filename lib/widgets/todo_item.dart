import "package:flutter/material.dart";
import "package:todoapplication/constants/colors.dart";
import "package:todoapplication/model/todo.dart";

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onDeleteItem,
      required this.onToDoChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 18,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          child: IconButton(
            alignment: Alignment.center,
            icon: Icon(Icons.delete),
            iconSize: 18,
            color: Colors.white,
            onPressed: () {
              //print('clicked on delete');
              onDeleteItem(todo.id);
            },
          ),
          height: 35,
          width: 30,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
