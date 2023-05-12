import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/list.dart';
import 'package:to_do/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: const MaterialApp(
            title: 'Clothdia',
            debugShowCheckedModeBanner: false,
            home: SplashScreen()
    ));
  }
}
