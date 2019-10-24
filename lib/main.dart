import 'package:flutter/material.dart';
import 'package:widgets/pages/bottom_navigation.page.dart';
import 'package:widgets/pages/chart.page.dart';
import 'package:widgets/pages/flip_panel.page.dart';
import 'package:widgets/pages/liquid_pulltorefresh.page.dart';
import 'package:widgets/pages/pin.page.dart';
import 'package:widgets/pages/scratcher.page.dart';
import 'package:widgets/pages/shimmer.page.dart';
import 'package:widgets/pages/wave.page.dart';

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

          // Pin Code
          Card(
              child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            title: Text("Pin Code", style: TextStyle(color: Colors.white)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PinPage())),
          )),
          Card(
              child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            title: Text("Shimmer", style: TextStyle(color: Colors.white)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShimmerPage())),
          )),

          // Liquid Pull To Refresh Indicator
          Card(
              child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            title: Text("Liquid Pull To Refresh", style: TextStyle(color: Colors.white)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LiquidPullToRefreshPage())),
          )),

          // Bottom Navy Bar
          Card(
              child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            title: Text("Bottom Navy Bar", style: TextStyle(color: Colors.white)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationPage())),
          )),

          // Circular Charts
          Card(
              child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            title: Text("Charts", style: TextStyle(color: Colors.white)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChartPage())),
          )),
        ]));
  }
}
