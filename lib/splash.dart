import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomePage()
      )
      );
      
    });
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 210,),
              Image.asset("images/clock.png",
              height: 230,
              width: 470,),
              const SizedBox(height: 15,),
              const Text("My ToDo",
              style: TextStyle(
                color: Colors.purple,
                fontStyle: FontStyle.italic,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                wordSpacing: 5
              ),),
              const SizedBox(height: 85,),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple),
                backgroundColor: Colors.red,
                strokeWidth: 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}
