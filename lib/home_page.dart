import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';
import 'line-chart.dart';
import 'spline-chart.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to Critical Care"),
            LiveLineChart(scaffoldKey),
          ],
        )),
      ),
    );
  }
}

Map<String, dynamic> getSampleWidget() {
  return <String, dynamic>{
    'real_time_line_chart': (Key key) => LiveLineChart(key)
  };
}
