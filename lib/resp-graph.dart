/// Dart imports
import 'dart:async';
import 'dart:math' as math;

/// Package imports
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import 'model/model.dart';
import 'model/sample_view.dart';
import 'package:oscilloscope/oscilloscope.dart';
import 'dart:math';

class RespGraph extends SampleView {
  @override
  _ShellState createState() => _ShellState();
}

class _ShellState extends SampleViewState {
  List<double> traceSine = List();
  List<double> traceCosine = List();
  double radians = 0.0;
  Timer _timer;

  /// method to generate a Test  Wave Pattern Sets
  /// this gives us a value between +1  & -1 for sine & cosine
  _generateTrace(Timer t) {
    // generate our  values
    var sv = sin((radians * pi));
    var cv = cos((radians * pi));

    // Add to the growing dataset
    setState(() {
      traceSine.add(sv);
      traceCosine.add(cv);
    });

    // adjust to recyle the radian value ( as 0 = 2Pi RADS)
    radians += 0.05;
    if (radians >= 2.0) {
      radians = 0.0;
    }
  }

  @override
  initState() {
    super.initState();
    // create our timer to generate test values
    _timer = Timer.periodic(Duration(milliseconds: 60), _generateTrace);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Create A Scope Display for Cosine
    Oscilloscope scopeTwo = Oscilloscope(
      showYAxis: true,
      padding: 20.0,
      backgroundColor: Colors.black,
      traceColor: Colors.yellow,
      yAxisMax: 2.0,
      yAxisMin: -2.0,
      dataSet: traceCosine,
    );

    // Generate the Scaffold
    return Container(
      child: Expanded(flex: 1, child: scopeTwo),
    );
  }
}
