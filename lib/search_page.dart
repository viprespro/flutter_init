/*
 * @Author: Ares
 * @Date: 2020-07-16 10:17:35
 * @version: 0.0.1
 * @LastEditors: Ares
 * @LastEditTime: 2020-09-01 18:19:04
 * @Description: 
 * @FilePath: \fllutter_demo\lib\search_page.dart
 */
import 'package:fllutter_demo/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Center(
          child: Loading(
              indicator: BallPulseIndicator(), size: 100.0, color: Colors.blue),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          // 测试使用flutter的
        },
        tooltip: '先不用',
        child: Icon(Icons.accessible_forward),
      ),
    );
  }
}
