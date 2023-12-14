import 'package:intl/intl.dart';

enum IntervalType { DAY, HOUR, MIN }

class TimeSeries {
  final String exchange;
  final String symbol;
  final DateTime date;
  final num? open;
  final num? high;
  final num? low;
  final num? close;
  final num? volume;
  final IntervalType interval;

  TimeSeries({
    required this.exchange,
    required this.date,
    required this.symbol,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    this.interval = IntervalType.DAY,
  });

  factory TimeSeries.fromList(List<dynamic> row) {
    return TimeSeries(
      exchange: row[0],
      date: DateFormat("dd-MM-yyyy").parse(row[1]) ,
      symbol: row[2],
      open: row[3] as num,
      high: row[4] as num,
      low:row[5] as num,
      close: row[6] as num,
      volume: row[7] as num
    );
  }
}
