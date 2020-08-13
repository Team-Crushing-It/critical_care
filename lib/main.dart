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

// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:oscilloscope/oscilloscope.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Oscilloscope Display Example',
//       home: Shell(),
//     );
//   }
// }

// class Shell extends StatefulWidget {
//   @override
//   _ShellState createState() => _ShellState();
// }

// List<double> chartDataListTemp = [
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   53.75,
//   57.5,
//   57.5,
//   61.25,
//   65,
//   65,
//   65,
//   61.25,
//   57.5,
//   57.5,
//   53.75,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   62.5,
//   75.0,
//   75.0,
//   87.5,
//   100,
//   100,
//   78.75,
//   57.5,
//   57.5,
//   36.25,
//   15,
//   15,
//   15,
//   27.5,
//   40.0,
//   40.0,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50,
//   50.0,
//   52.5,
//   60,
//   60,
//   60,
//   56.25,
//   55.5,
//   55.5,
//   52.75,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50,
//   50,
//   50.0,
//   50,
//   50,
//   50.0,
//   50.0,
//   50.0,
//   50.0,
//   50
// ];

// int counterForGraph = 0;

// class _ShellState extends State<Shell> {
//   List<double> traceSine = [];
//   double radians = 0.0;
//   Timer _timer;

//   /// method to generate a Test  Wave Pattern Sets
//   /// this gives us a value between +1  & -1 for sine & cosine
//   void _generateTrace(Timer t) {
//     // generate our  values
//     setState(() {
//       traceSine.add((chartDataListTemp[counterForGraph] - 50) / 10);
//     }); // adjust to recyle the radian value ( as 0 = 2Pi RADS)
//     radians += 0.05;
//     if (radians >= 2.0) {
//       radians = 0.0;
//     }
//     if (counterForGraph >= chartDataListTemp.length - 1) {
//       counterForGraph = 0;
//     }
//     counterForGraph += 1;
//   }

//   @override
//   initState() {
//     super.initState();
//     // create our timer to generate test values
//     _timer = Timer.periodic(const Duration(milliseconds: 100), _generateTrace);
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Create A Scope Display for Sine
//     Oscilloscope scopeOne = Oscilloscope(
//       showYAxis: true,
//       yAxisColor: Colors.orange,
//       padding: 20.0,
//       backgroundColor: Colors.black,
//       traceColor: Colors.green,
//       yAxisMax: 5.0,
//       yAxisMin: -5.0,
//       dataSet: traceSine,
//     ); // Generate the Scaffold
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("OscilloScope Demo"),
//       ),
//       body: Column(
//         children: <Widget>[
//           SizedBox(width: double.infinity, height: 200, child: scopeOne),
//         ],
//       ),
//     );
//   }
// }
