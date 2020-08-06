/// Dart imports
import 'dart:async';
import 'dart:math' as math;

/// Package imports
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import './model/sample_view.dart';

/// Renders the realtime line chart sample.
class LiveLineChart extends SampleView {
  const LiveLineChart(Key key) : super(key: key);

  @override
  _LiveLineChartState createState() => _LiveLineChartState();
}

int currentindex = 0;
List<int> chartDataListTemp = [
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

/// State class of the realtime line chart.
class _LiveLineChartState extends SampleViewState {
  _LiveLineChartState() {
    timer = Timer.periodic(const Duration(milliseconds: 100), updateDataSource);
  }

  Timer timer;
  List<_ChartData> chartData = <_ChartData>[
    _ChartData(0, chartDataListTemp[0]),
    _ChartData(1, chartDataListTemp[1]),
    _ChartData(2, chartDataListTemp[2]),
    _ChartData(3, chartDataListTemp[3]),
    _ChartData(4, chartDataListTemp[4]),
    _ChartData(5, chartDataListTemp[5]),
    _ChartData(6, chartDataListTemp[6]),
    _ChartData(7, chartDataListTemp[7]),
    _ChartData(8, chartDataListTemp[8]),
    _ChartData(9, chartDataListTemp[9]),
    _ChartData(10, chartDataListTemp[10]),
    _ChartData(11, chartDataListTemp[11]),
    _ChartData(12, chartDataListTemp[12]),
    _ChartData(13, chartDataListTemp[13]),
    _ChartData(14, chartDataListTemp[14]),
    _ChartData(15, chartDataListTemp[15]),
    _ChartData(16, chartDataListTemp[16]),
    _ChartData(17, chartDataListTemp[17]),
    _ChartData(18, chartDataListTemp[18]),
  ];
  int count = 19;
  ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getLiveLineChart();
  }

  /// Returns the realtime Cartesian line chart.
  SfCartesianChart getLiveLineChart() {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            axisLine: AxisLine(width: 0),
            majorTickLines: MajorTickLines(size: 0)),
        series: <LineSeries<_ChartData, int>>[
          LineSeries<_ChartData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: const Color.fromRGBO(192, 108, 132, 1),
            xValueMapper: (_ChartData sales, _) => sales.country,
            yValueMapper: (_ChartData sales, _) => sales.sales,
            animationDuration: 0,
            dataLabelSettings: DataLabelSettings(
                isVisible: false, labelAlignment: ChartDataLabelAlignment.top),
          )
        ]);
  }

  void updateDataSource(Timer timer) {
    if (isCardView != null) {
      chartData.add(_ChartData(count, getNextNewInt(10, 100)));
      if (chartData.length == 20) {
        chartData.removeAt(0);
        _chartSeriesController.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
          removedDataIndexes: <int>[0],
        );
      } else {
        _chartSeriesController.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
        );
      }
      count = count + 1;
    }
  }

  num getNextNewInt(num min, num max) {
    currentindex += 1;
    if (currentindex >= 19) {
      currentindex = 0;
    }
    return chartDataListTemp[currentindex];
  }
}

/// Private calss for storing the chart series data points.
class _ChartData {
  _ChartData(this.country, this.sales);
  final num country;
  final num sales;
}
