import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';
import 'line-chart.dart';
import 'resp-graph.dart';
import 'o2fi-graph.dart';
import 'heart-graph.dart';
import 'art-graph.dart';
import 'lap-graph.dart';

//Creates seperate scaffold keys
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> scaffoldKey3 = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> scaffoldKey4 = GlobalKey<ScaffoldState>();

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
            //ArtGraph(scaffoldKey),
            //LapGraph(scaffoldKey2),
            //HeartGraph(scaffoldKey3),
            //RespGraph(),
            O2FiChart(scaffoldKey4),
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
