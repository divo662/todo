import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/list.dart';
class Completed extends StatelessWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: task.completedTask.length,
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
                value: task.completedTask[index].isDone,
                onChanged: (_){
                  task.toggleTask(task.completedTask[index]);
                },
              ),
              title:  Text(task.completedTask[index].title!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19
                ),),
              subtitle: Text(task.completedTask[index].note!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
              trailing: IconButton(
                onPressed: (){
                  task.deleteTask(task.completedTask[index]);
                },
                color: Colors.white,
                iconSize: 18,
                icon: const Icon(Icons.delete,
                color: Colors.red,
                size: 25,),
              ),
            );
          })
      ),
    );
  }
}
