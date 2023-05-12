import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list.dart';

class TodayPage extends StatelessWidget {

  const TodayPage({Key? key,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context).search;
    final tasks = Provider.of<TodoProvider>(context).search;
    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks found',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
  return Expanded(
    child: ListView.builder(
        itemCount: task.length,
        itemBuilder: ((context, index) {
          return  ListTile(
            onTap: (){
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            contentPadding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tileColor: Colors.white,
            leading:  Checkbox(
              activeColor: Colors.deepOrange,
              value: task[index].isDone,
              onChanged: (_){
                Provider.of<TodoProvider>(context, listen: false).toggleTask(tasks[index]);
              },
            ),
            title:  Text(task[index].title!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19
              ),),
            subtitle: Text(task[index].note!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            trailing: IconButton(
              onPressed: (){
                Provider.of<TodoProvider>(context, listen: false).deleteTask(tasks[index]);
              },
              color: Colors.white,
              iconSize: 18,
              icon: const Icon(Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            ),
          );
        })
    ),
  );
  }

}
