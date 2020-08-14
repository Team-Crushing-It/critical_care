import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mp_chart/mp/chart/line_chart.dart';
import 'package:mp_chart/mp/controller/line_chart_controller.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_line_data_set.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';

import 'package:patient_repository/patient_repository.dart';

import 'action_state.dart';
import 'util.dart';


class SmallChart extends StatefulWidget {
  const SmallChart({
    Key key,
    @required this.device,
  }) : super(key: key);

  final RealtimeDeviceModel device;
  @override
  _SmallChartState createState() => _SmallChartState();
}

class _SmallChartState extends State<SmallChart> 
implements OnChartValueSelectedListener
{
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
          height:90,
          width: 100,
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
            ..typeface = Util.LIGHT
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
            ..typeface = Util.LIGHT
            ..textColor = ColorUtils.WHITE
            ..axisMaximum = 10.0
            ..axisMinimum = 0.0
            ..drawGridLines = false
            ..setAxisMaximum(100)
            ..setAxisMinimum(0)
            ..setLabelCount1(2)
            ..drawLabels = false;
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = false;
        },
        drawGridBackground: false,
        dragXEnabled: true,
        dragYEnabled: true,
        scaleXEnabled: true,
        scaleYEnabled: true,
        backgroundColor: Colors.transparent,
        selectionListener: this,
        pinchZoomEnabled: false,
        description: desc);

    LineData data = controller?.data;

    if (data == null) {
      data = LineData();
      controller.data = data;
    }
  }

  List<int> chartDataListTemp = [
    50,
    50,
    50,
    65,
    50,
    45,
    100,
    15,
    50,
    50,
    65,
    50,
    50,
    50,
    50,
    50,
    50,
    50,
    50,
  ];
  int counterforgraph = 0;

  void _addEntry() {
    LineData data = controller.data;

    if (data != null) {
      ILineDataSet set = data.getDataSetByIndex(0);
      // set.addEntry(...); // can be called as well

      if (set == null) {
        set = _createSet();
        data.addDataSet(set);
      }

      data.addEntry(
          Entry(
              x: set.getEntryCount().toDouble(),
              y: chartDataListTemp[counterforgraph].toDouble()),
          0);

      data.notifyDataChanged();

      // limit the number of visible entries
      controller
        ..setVisibleXRangeMaximum(18)
        ..setVisibleXRangeMinimum(18);

      // chart.setVisibleYRange(30, AxisDependency.LEFT);

      // move to the latest entry
      controller.moveViewToX(data.getEntryCount().toDouble());

      controller.state?.setStateIfNotDispose();
    }

    if (counterforgraph >= chartDataListTemp.length - 1) {
      counterforgraph = 0;
    }
    counterforgraph += 1;
  }

  void _clearChart() {
    controller.data?.clearValues();
    controller.state?.setStateIfNotDispose();
  }

  void _addMultiple() {
    if (isMultipleRun) {
      return;
    }

    isMultipleRun = true;
    var i = 0;
    Timer.periodic(Duration(milliseconds: 110), (timer) {
      _addEntry();
      if (i++ > 18) {
        timer.cancel();
        isMultipleRun = false;
      }
    });
  }

  LineDataSet _createSet() {
    LineDataSet set = LineDataSet(null, "")
      ..setAxisDependency(AxisDependency.LEFT)
      ..setColor1(widget.device.type.toColor)
      ..setCircleColor(Colors.transparent)
      ..setLineWidth(2.0)
      ..setDrawCircles(false)
      ..setCircleRadius(0.0)
      ..setFillAlpha(65)
      ..setFillColor(ColorUtils.getHoloBlue())
      ..setHighLightColor(Color.fromARGB(255, 244, 117, 117))
      ..setValueTextColor(Colors.transparent)
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
