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

/*
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:oscilloscope/oscilloscope.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oscilloscope Display Example',
      home: Shell(),
    );
  }
}

class Shell extends StatefulWidget {
  @override
  _ShellState createState() => _ShellState();
}

List<double> chartDataListTemp = [
  50,
  50,
  50,
  65,
  50,
  100,
  15,
  65,
  50,
  50,
  50,
  50,
  50,
  50,
  50,
  50,
  50,
  50,
  50
];

int counterForGraph = 0;

class _ShellState extends State<Shell> {
  List<double> traceSine = [];
  double radians = 0.0;
  Timer _timer;

  /// method to generate a Test  Wave Pattern Sets
  /// this gives us a value between +1  & -1 for sine & cosine
  void _generateTrace(Timer t) {
    // generate our  values
    setState(() {
      traceSine.add((chartDataListTemp[counterForGraph] - 50) / 10);
    }); // adjust to recyle the radian value ( as 0 = 2Pi RADS)
    radians += 0.05;
    if (radians >= 2.0) {
      radians = 0.0;
    }
    if (counterForGraph >= 18) {
      counterForGraph = 0;
    }
    counterForGraph += 1;
  }

  @override
  initState() {
    super.initState();
    // create our timer to generate test values
    _timer = Timer.periodic(const Duration(milliseconds: 100), _generateTrace);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Create A Scope Display for Sine
    Oscilloscope scopeOne = Oscilloscope(
      showYAxis: true,
      yAxisColor: Colors.orange,
      padding: 20.0,
      backgroundColor: Colors.black,
      traceColor: Colors.green,
      yAxisMax: 1.0,
      yAxisMin: -1.0,
      dataSet: traceSine,
    ); // Generate the Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text("OscilloScope Demo"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(width: double.infinity, height: 200, child: scopeOne),
        ],
      ),
    );
  }
}
*/
