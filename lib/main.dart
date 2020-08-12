import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_repository/hospital_repository.dart';
import 'package:patient_repository/patient_repository.dart';

import 'app.dart';
import 'simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    hospitalRepository: const HospitalRepository(),
    patientRepository: PatientRepository(),
  ));
}

//===========================================================

// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math' as math;

// /// Package imports
// import 'package:flutter/foundation.dart';

// final List<DataPoints> data = [];

// /*
// Art Graph
// List<int> chartDataListTemp = [
//   10,
//   15,
//   20,
//   30,
//   35,
//   50,
//   60,
//   62,
//   63,
//   62,
//   52,
//   40,
//   39,
//   25,
//   25,
//   20,
//   17,
//   15,
//   10,
//   10,
//   10
// ];
// */

// /*
// Lap Graph
// List<int> chartDataListTemp = [
//   4,
//   5,
//   6,
//   5,
//   4,
//   3,
//   2,
//   2,
//   1,
//   3,
//   4,
//   5,
//   7,
//   8,
//   9,
//   6,
//   4,
//   2,
//   3,
//   4,
//   4,
// ];
// */

// //Heart Graph
// List<int> chartDataListTemp = [
//   50,
//   50,
//   50,
//   70,
//   50,
//   50,
//   40,
//   100,
//   15,
//   50,
//   50,
//   50,
//   50,
//   65,
//   50,
//   50,
//   50,
//   50,
//   50,
//   50,
//   50,
// ];

// /*
// O2Fi Graph
// List<int> chartDataListTemp = [
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
//   25,
// ];
// */

// class SimpleLineChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   /// Creates a [LineChart] with sample data and no transition.
//   factory SimpleLineChart.withSampleData() {
//     return SimpleLineChart(
//       _createSampleData(),
//       animate: false,
//     );
//   }

//   SimpleLineChart(this.seriesList, {this.animate});

//   @override
//   Widget build(BuildContext context) {
//     return charts.LineChart(
//       seriesList,
//       animate: animate,
//       //intFactory: const charts.LocalintFactory(),
//     );
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<DataPoints, int>> _createSampleData() {
//     return [
//       charts.Series<DataPoints, int>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//         domainFn: (DataPoints variable, _) => variable.x,
//         measureFn: (DataPoints variable, _) => variable.y,
//         data: data,
//       )
//     ];
//   }
// }

// /// Sample time series data type.
// class DataPoints {
//   final int x;
//   final int y;

//   DataPoints(this.x, this.y);
// }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     final timer = Timer.periodic(
//         const Duration(milliseconds: 300), (Timer t) => _incrementCounter());
//   }

//   int _counter = 0;
//   int _globalCounter = 0; //The global

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//       _globalCounter++;
//       if (_globalCounter >= 21) {
//         _globalCounter = 0;
//         print("yoyo yo");
//       }
//       data.add(DataPoints(_counter, chartDataListTemp[_globalCounter]));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF050B2C),
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.add),
//               tooltip: 'Increment',
//               onPressed: _incrementCounter,
//             ),
//             Expanded(flex: 5, child: SimpleLineChart.withSampleData()),
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // 