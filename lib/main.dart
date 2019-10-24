import 'dart:async';
import 'dart:math';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:scratcher/scratcher.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:widgets/color_palette.dart';

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

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final GlobalKey<AnimatedCircularChartState> _chartKey1 = new GlobalKey<AnimatedCircularChartState>();

  List<CircularStackEntry> data1 = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  final GlobalKey<AnimatedCircularChartState> _chartKeyRand = new GlobalKey<AnimatedCircularChartState>();
  final _chartSizeRand = const Size(300.0, 300.0);
  final Random random = new Random();
  List<CircularStackEntry> data;

  void _randomize() {
    setState(() {
      data = _generateRandomData();
      _chartKeyRand.currentState.updateData(data);
    });
  }

  @override
  void initState() {
    super.initState();
    data = _generateRandomData();
  }

  List<CircularStackEntry> _generateRandomData() {
    int stackCount = random.nextInt(10);
    List<CircularStackEntry> data = new List.generate(stackCount, (i) {
      int segCount = random.nextInt(10);
      List<CircularSegmentEntry> segments = new List.generate(segCount, (j) {
        Color randomColor = ColorPalette.primary.random(random);
        return new CircularSegmentEntry(random.nextDouble(), randomColor);
      });
      return new CircularStackEntry(segments);
    });

    return data;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context).textTheme.title.merge(new TextStyle(color: labelColor));

    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // PIE CHART
            // AnimatedCircularChart(
            //   key: _chartKey1,
            //   size: const Size(300.0, 300.0),
            //   initialChartData: data1,
            //   chartType: CircularChartType.Pie,
            // ),
            AnimatedCircularChart(
              key: _chartKeyRand,
              size: _chartSizeRand,
              initialChartData: data,
              chartType: CircularChartType.Radial,
            ),
            FlatButton(
              child: Text(
                'Refresh',
                style: TextStyle(color: Colors.white),
              ),
              // PIE CHART
              // onPressed: _cycleSamples,
              onPressed: _randomize,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: new AnimatedCircularChart(
                key: _chartKey,
                size: _chartSize,
                initialChartData: _generateChartData(value),
                chartType: CircularChartType.Radial,
                edgeStyle: SegmentEdgeStyle.round,
                percentageValues: true,
                holeLabel: '$value%',
                labelStyle: _labelStyle,
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: _decrement,
                  child: const Icon(Icons.remove),
                  shape: const CircleBorder(),
                  color: Colors.red[200],
                  textColor: Colors.white,
                ),
                new RaisedButton(
                  onPressed: _increment,
                  child: const Icon(Icons.add),
                  shape: const CircleBorder(),
                  color: Colors.blue[200],
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _cycleSamples() {
    var rng = new Random();
    List<CircularStackEntry> nextData = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(rng.nextInt(5) * 1500.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(rng.nextInt(5) * 750.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(rng.nextInt(5) * 2000.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(rng.nextInt(5) * 1000.0, Colors.yellow[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    setState(() {
      _chartKey1.currentState.updateData(nextData);
    });
  }

  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(200.0, 200.0);

  double value = 50.0;
  Color labelColor = Colors.blue[200];

  void _increment() {
    setState(() {
      value += 10;
      List<CircularStackEntry> data = _generateChartData(value);
      _chartKey.currentState.updateData(data);
    });
  }

  void _decrement() {
    setState(() {
      value -= 10;
      List<CircularStackEntry> data = _generateChartData(value);
      _chartKey.currentState.updateData(data);
    });
  }

  List<CircularStackEntry> _generateChartData(double value) {
    Color dialColor = Colors.blue[200];
    if (value < 0) {
      dialColor = Colors.red[200];
    } else if (value < 50) {
      dialColor = Colors.yellow[200];
    }
    labelColor = dialColor;

    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value,
            dialColor,
            rankKey: 'percentage',
          )
        ],
        rankKey: 'percentage',
      ),
    ];

    if (value > 100) {
      labelColor = Colors.green[200];

      data.add(new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value - 100,
            Colors.green[200],
            rankKey: 'percentage',
          ),
        ],
        rankKey: 'percentage2',
      ));
    }

    return data;
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
