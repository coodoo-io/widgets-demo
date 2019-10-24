import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

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

class ColorPalette {
  static final ColorPalette primary = new ColorPalette(<Color>[
    Colors.blue[400],
    Colors.blue[200],
    Colors.red[400],
    Colors.red[200],
    Colors.green[400],
    Colors.green[200],
    Colors.yellow[400],
    Colors.yellow[200],
    Colors.purple[400],
    Colors.purple[200],
    Colors.orange[400],
    Colors.orange[200],
    Colors.teal[400],
    Colors.teal[200],
  ]);

  ColorPalette(List<Color> colors) : _colors = colors {
    assert(colors.isNotEmpty);
  }

  final List<Color> _colors;

  Color operator [](int index) => _colors[index % length];

  int get length => _colors.length;

  Color random(Random random) => this[random.nextInt(length)];
}