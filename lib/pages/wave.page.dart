import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail")),
        body: Container(
          height: 300,
          child: WaveWidget(
            config: CustomConfig(
              gradients: [
                [Colors.blue, Colors.lightBlue],
              ],
              durations: [16000],
              heightPercentages: [0.50],
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            backgroundColor: Colors.white,
            size: Size(double.infinity, double.infinity),
          ),
        ));
  }
}