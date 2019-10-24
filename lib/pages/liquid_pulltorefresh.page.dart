import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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