import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/time_series.dart';
import '../provider/stock_provider.dart';

class TimeSeriesChart extends StatefulWidget {
  const TimeSeriesChart({super.key});

  @override
  State<TimeSeriesChart> createState() => _TimeSeriesChartState();
}

class _TimeSeriesChartState extends State<TimeSeriesChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StockProvider>(builder: (context, provider, _) {
      if (provider.isloadingchart) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ...Period.values.map((e) => GestureDetector(
                    onTap: () {
                      provider.filter(e);
                    },
                    child: Card(
                        color: provider.period == e
                            ? Colors.green[600]
                            : null,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                      
                        child: Text(e.title,style: TextStyle(color: provider.period == e
                            ? Colors.white
                            : null,),),
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                series: <ChartSeries>[
                  CandleSeries<TimeSeries, DateTime>(
                    dataSource: provider.dataList,
                    xValueMapper: (TimeSeries data, _) => data.date,
                    openValueMapper: (TimeSeries data, _) => data.open,
                    highValueMapper: (TimeSeries data, _) => data.high,
                    lowValueMapper: (TimeSeries data, _) => data.low,
                    closeValueMapper: (TimeSeries data, _) => data.close,
                    // pointColorMapper: (_ChartData data, _) => data.color,
                  ),
                ],
              )),
        ],
      );
    });
  }
}
