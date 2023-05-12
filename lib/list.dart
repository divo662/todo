import 'dart:collection';

import 'package:flutter/material.dart';

class MyTodo  {
  String? title;
  String? note;
  bool isDone;
  MyTodo({required this.title,required this.note, this.isDone = false});
void toggleCompleted(){
  isDone = !isDone;
}
}

class TodoProvider extends ChangeNotifier{
  List <MyTodo> tasks = [];

  UnmodifiableListView<MyTodo> get allTasks => UnmodifiableListView(tasks);
  UnmodifiableListView<MyTodo> get completedTask =>  UnmodifiableListView(tasks.where((todo)
  => todo.isDone));
  String username = "Divine"; // Default username

  void changeUsername(String newUsername) {
    username = newUsername;
    notifyListeners();
  }
  String getUser(String newUsername) {
    return newUsername;
  }

  void addTask(String task, String notes){
    tasks.add(MyTodo(title: task, note: notes,  isDone: false));
    notifyListeners();
  }


  final List _cartItem = [];
  get cartItems => _cartItem;

  void toggleTask(MyTodo task){
    final taskIndex = tasks.indexOf(task);
    tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(MyTodo task){
    tasks.remove(task);
    notifyListeners();
  }
  String _searchString = "";

  UnmodifiableListView<MyTodo> get search {
    if (_searchString.isEmpty) {
      return UnmodifiableListView(tasks);
    } else {
      List<MyTodo> filteredTasks = tasks
          .where((task) => task.title!.toLowerCase().contains(_searchString.toLowerCase()))
          .toList();
      return UnmodifiableListView(filteredTasks);
    }
  }

  void changeSearchString(String searchTitle) {
    _searchString = searchTitle;
    notifyListeners();
  }
  // void changeSearchString(String searchString) {
  //   _searchString = searchString;
  //   print(_searchString);
  //   notifyListeners();
  // }
  //
  // ...
  //
  // onChanged: (value) {
  // Provider.of<Dogs>(context, listen: false)
  //     .changeSearchString(value);
  // },
  // late List results = tasks;
  //  runFilers(String enteredKeyword){
  //   if(enteredKeyword.isEmpty){
  //     results =tasks;
  //   } else {
  //     results = tasks
  //         .where((tasks) =>
  //         title.title!.toLowerCase()
  //             .contains(enteredKeyword
  //             .toLowerCase())).toList();
  //   }
  //   notifyListeners();
  // }
  // List<Todo> get todos => _todos;
  //
  // void searchTodos(String query) {
  //   if (query.isEmpty) {
  //     // If the search query is empty, show all todos
  //     return;
  //   }
  //
  //   // Filter the list of todos based on the search query
  //   final List<Todo> searchResults = _todos.where((todo) {
  //     final title = todo.title.toLowerCase();
  //     final searchQuery = query.toLowerCase();
  //     return title.contains(searchQuery);
  //   }).toList();
  //
  //   // Update the list of todos displayed in the app
  //   _todos = searchResults;
  //   notifyListeners();
  // }
}