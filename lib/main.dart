import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(59, 66, 84, 1),
          fontFamily: "Verdana",
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.transparent),
          cardTheme: CardTheme(
              elevation: 5,
              color: Color.fromRGBO(84, 93, 110, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ))),
      darkTheme: ThemeData.dark(),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Widgets Demo"),
        ),
        body: ListView(padding: EdgeInsets.all(10), children: <Widget>[
          // Wave
          Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                title: Text("Wave", style: TextStyle(color: Colors.white)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WavePage())),
              )),

          // Flip Panel
          Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                title: Text("Flip Panel", style: TextStyle(color: Colors.white)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FlipPanelPage())),
              )),

          // Scratcher
          Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                title: Text("Scratcher", style: TextStyle(color: Colors.white)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScratcherPage())),
              )),
        ]));
  }
}

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

class FlipPanelPage extends StatelessWidget {
  final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flip Panel")),
      body: Center(
        child: FlipPanel.builder(
          itemBuilder: (context, index) => Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              '${digits[index]}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0, color: Colors.white),
            ),
          ),
          itemsCount: digits.length,
          period: const Duration(milliseconds: 1000),
          loop: 1,
        ),
      ),
    );
  }
}

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
