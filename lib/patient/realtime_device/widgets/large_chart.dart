import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mp_chart/mp/chart/line_chart.dart';
import 'package:mp_chart/mp/controller/line_chart_controller.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';

import 'package:patient_repository/patient_repository.dart';

class LargeChart extends StatefulWidget {
  const LargeChart({
    Key key,
    @required this.device,
    // @required this.data,
  }) : super(key: key);

  final RealtimeDeviceModel device;

  // final List<int> data;

  @override
  _LargeChartState createState() => _LargeChartState();
}

class _LargeChartState extends State<LargeChart>
    implements OnChartValueSelectedListener {
  LineChartController controller;
  var random = Random(1);
  var isMultipleRun = false;

  @override
  void initState() {
    _initController();
    _addMultiple();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  @override
  void onNothingSelected() {}

  @override
  void onValueSelected(Entry e, Highlight h) {}

  Widget getBody() {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 200,
          child: LineChart(controller),
        ),
      ],
    );
  }

  void _initController() {
    var desc = Description()..enabled = false;
    controller = LineChartController(
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            // ..typeface = Util.LIGHT
            ..textColor = ColorUtils.WHITE
            ..drawGridLines = false
            ..avoidFirstLastClipping = true
            ..enabled = false;
        },
        legendSettingFunction: (legend, controller) {
          legend.enabled = false;
        },
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            // ..typeface = Util.LIGHT
            ..textColor = ColorUtils.WHITE
            ..axisMaximum = 10.0
            ..axisMinimum = 0.0
            ..drawGridLines = true
            ..setAxisMaximum(100)
            ..setAxisMinimum(0)
            ..setLabelCount1(2);
          // ..drawLabels = false;
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = false;
        },
        drawGridBackground: false,
        dragXEnabled: true,
        dragYEnabled: true,
        scaleXEnabled: true,
        scaleYEnabled: true,
        backgroundColor: const Color(0xFFC4C4C4).withOpacity(0.1),
        selectionListener: this,
        pinchZoomEnabled: false,
        description: desc);

    var data = controller?.data;

    if (data == null) {
      data = LineData();
      controller.data = data;
    }
  }
  int counterforgraph = 0;
  void _addEntry() {
    var data = controller.data;

    if (data != null) {
      var set = data.getDataSetByIndex(0);
      // set.addEntry(...); // can be called as well

      if (set == null) {
        set = _createSet();
        data.addDataSet(set);
      }

      data
        ..addEntry(
            Entry(
                x: set.getEntryCount().toDouble(),
                y: widget.device.data[counterforgraph].toDouble()),
            0)
        ..notifyDataChanged();

      // limit the number of visible entries
      controller
        ..setVisibleXRangeMaximum(70)
        ..setVisibleXRangeMinimum(70)
        ..moveViewToX(data.getEntryCount().toDouble())
        ..state?.setStateIfNotDispose();

      // chart.setVisibleYRange(30, AxisDependency.LEFT);
    }

    if (counterforgraph >= widget.device.data.length - 1) {
      counterforgraph = 0;
    }
    counterforgraph += 1;
  }

  // void _clearChart() {
  //   controller.data?.clearValues();
  //   controller.state?.setStateIfNotDispose();
  // }

  void _addMultiple() {
    if (isMultipleRun) {
      return;
    }

    isMultipleRun = true;
    var i = 0;
    Timer.periodic(const Duration(milliseconds: 110), (timer) {
      _addEntry();
      if (i++ > 100) {
        timer.cancel();
        isMultipleRun = false;
      }
    });
  }

  LineDataSet _createSet() {
    var set = LineDataSet(null, '')
      ..setAxisDependency(AxisDependency.LEFT)
      ..setColor1(widget.device.type.toColor)
      ..setCircleColor(Colors.transparent)
      ..setLineWidth(2.0)
      ..setDrawCircles(false)
      ..setCircleRadius(0.0)
      ..setFillAlpha(65)
      ..setFillColor(ColorUtils.getHoloBlue())
      ..setHighLightColor(const Color.fromARGB(255, 244, 117, 117))
      ..setValueTextColor(ColorUtils.WHITE)
      ..setValueTextSize(9.0)
      ..setDrawValues(false);
    return set;
  }
}

extension on String {
  Color get toColor {
    switch (this) {
      case 'Art':
        return const Color(0xFFD00404);
      case 'LAP':
        return const Color(0xFFD00404);
      case 'HR':
        return const Color(0xFF05FF2D);
      case 'RESP':
        return const Color(0xFFFFF500);
      case 'O2':
        return const Color(0xFFFF6E04);
      default:
        return Colors.blueGrey;
    }
  }
}
