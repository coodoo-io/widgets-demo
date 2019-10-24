import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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