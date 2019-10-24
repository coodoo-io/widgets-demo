import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratcherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scratcher")),
      body: Center(
        child: Scratcher(
          brushSize: 30,
          threshold: 50,
          color: Colors.red,
          onChange: (value) {
            print("Scratch progress: $value%");
          },
          onThreshold: () {
            print("Threshold reached, you won!");
          },
          child: Container(
            height: 300,
            width: 300,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}