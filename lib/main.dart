import 'dart:async';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:scratcher/scratcher.dart';
import 'package:shimmer/shimmer.dart';
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
        ]));
  }
}

class LiquidPullToRefreshPage extends StatelessWidget {
  final numbers = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liquid Pull To Refresh')),
      body: LiquidPullToRefresh(
        onRefresh: () => listViewRefresh(),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            if (index == 5) {
              return Row(
                children: <Widget>[
                  Text(
                    'Pull me!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 30,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              );
            }
            return ListTile(
              title: Text(
                'Example ${numbers[index]}',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.list,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> listViewRefresh() async {
    print('refresh triggered');
    return Future.delayed(Duration(seconds: 4)).then((value) {
      print('refresh done');
    });
  }
}

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final PageController _pageController = PageController();
  num _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navy Bar")),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Center(child: Text('Home', style: TextStyle(color: Colors.white))),
          Center(child: Text('Users', style: TextStyle(color: Colors.white))),
          Center(child: Text('Messages', style: TextStyle(color: Colors.white))),
          Center(child: Text('Settings', style: TextStyle(color: Colors.white))),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(icon: Icon(Icons.apps), title: Text('Home'), activeColor: Colors.red),
          BottomNavyBarItem(icon: Icon(Icons.people), title: Text('Users'), activeColor: Colors.purpleAccent),
          BottomNavyBarItem(icon: Icon(Icons.message), title: Text('Messages'), activeColor: Colors.pink),
          BottomNavyBarItem(icon: Icon(Icons.settings), title: Text('Settings'), activeColor: Colors.blue),
        ],
      ),
    );
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

class ShimmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey,
          child: Text('Shimmer'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 10,
                    width: 300,
                    color: Colors.red,
                  ),
                  Text(
                    'SHIMMER',
                    style: TextStyle(fontSize: 60),
                  ),
                  Container(
                    height: 10,
                    width: 300,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    height: 10,
                    width: 125,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    height: 10,
                    width: 65,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PingPageState();
  }
}

class PingPageState extends State<PinPage> {
  TextEditingController controller = TextEditingController();
  String thisText = "";
  int pinLength = 4;

  bool hasError = false;
  String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pin Code Text Field Example"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Text(thisText, style: Theme.of(context).textTheme.title),
              ),
              PinCodeTextField(
                autofocus: false,
                controller: controller,
                hideCharacter: true,
                highlight: true,
                highlightColor: Colors.blue,
                defaultBorderColor: Colors.black,
                hasTextBorderColor: Colors.green,
                maxLength: pinLength,
                hasError: hasError,
                maskCharacter: "😎",
                onTextChanged: (text) {
                  setState(() {
                    hasError = false;
                  });
                },
                onDone: (text) {
                  print("DONE $text");
                },
                pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                wrapAlignment: WrapAlignment.start,
                pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                pinTextStyle: TextStyle(fontSize: 30.0),
                pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
              ),
              Visibility(
                child: Text(
                  "Wrong PIN!",
                  style: TextStyle(color: Colors.red),
                ),
                visible: hasError,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("+"),
                      onPressed: () {
                        setState(() {
                          this.pinLength++;
                        });
                      },
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("-"),
                      onPressed: () {
                        setState(() {
                          this.pinLength--;
                        });
                      },
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("SUBMIT"),
                      onPressed: () {
                        setState(() {
                          this.thisText = controller.text;
                        });
                      },
                    ),
                    MaterialButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("SUBMIT Error"),
                      onPressed: () {
                        setState(() {
                          this.hasError = true;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
