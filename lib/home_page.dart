import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';
import 'line-chart.dart';
import 'spline-chart.dart';
import 'o2fi-graph.dart';
import 'heart-graph.dart';
import 'art-graph.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> scaffoldKey3 = GlobalKey<ScaffoldState>();

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
            HeartGraph(scaffoldKey),
            ArtGraph(scaffoldKey2),
            //O2FiChart(scaffoldKey3),
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
