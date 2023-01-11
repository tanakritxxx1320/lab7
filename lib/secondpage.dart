import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required double bmi, required String weight, required String hight});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ผลคำนวณBMI"),
        
      ),
      
      
    );
  }
}