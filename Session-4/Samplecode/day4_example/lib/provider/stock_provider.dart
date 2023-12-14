import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/stock_info.dart';
import '../models/time_series.dart';

enum Period { WEEK1, MONTH1, MONTH3, MONTH6, YEAR1, YEAR2, YEAR3, YEAR5, MAX }

extension PeriodExtension on Period {
  String get title {
    switch (this) {
      case Period.WEEK1:
        return "5D";
      case Period.MONTH1:
        return "1M";
      case Period.MONTH3:
        return "3M";
      case Period.MONTH6:
        return "6M";
      case Period.YEAR1:
        return "1Y";
      case Period.YEAR2:
        return "2Y";
      case Period.YEAR3:
        return "3Y";
      case Period.YEAR5:
        return "5Y";
      case Period.MAX:
        return "Max";
      default:
        return "";
    }
  }
}

class StockProvider with ChangeNotifier {
  bool isloadingchart = true;
  bool isloadinginfo = true;

  List<TimeSeries> _dataList = [];
  List<TimeSeries>? _filtered;
  List<TimeSeries> get dataList => _filtered ?? _dataList;

  StockInfo? info;

  Period period = Period.MONTH3;

  loadstock(String symbol) async {
    loadinfo(symbol);
    loadchart(symbol);
  }

  filter(period) async {
    DateTime today = DateTime.now();
    switch (period) {
      case Period.WEEK1:
        DateTime week1 = today.subtract(const Duration(days: 10));

        _filtered = _dataList
            .where((element) => element.date.difference(week1) > Duration.zero)
            .toList();

        break;
      case Period.MONTH1:
        DateTime week1 = today.subtract(const Duration(days: 30));

        _filtered = _dataList
            .where((element) => element.date.difference(week1) > Duration.zero)
            .toList();

        break;
      case Period.MONTH3:
        DateTime week1 = today.subtract(const Duration(days: 90));

        _filtered = _dataList
            .where((element) => element.date.difference(week1) > Duration.zero)
            .toList();

        break;
      case Period.MONTH6:
        DateTime week1 = today.subtract(const Duration(days: 180));

        _filtered = _dataList
            .where((element) => element.date.difference(week1) > Duration.zero)
            .toList();

        break;
      case Period.YEAR1:
        DateTime week1 = today.subtract(const Duration(days: 365));

        _filtered = _dataList
            .where((element) => element.date.difference(week1) > Duration.zero)
            .toList();

        break;
      case Period.YEAR2:
        DateTime week1 = today.subtract(const Duration(days: 2 * 365));

        _filtered = _dataList
            .where((element) => element.date.difference(week1) > Duration.zero)
            .toList();

        break;
      case Period.YEAR3:
        DateTime week1 = today.subtract(const Duration(days: 3 * 365));

        _filtered = _dataList
            .where((element) => element.date.difference(week1) > Duration.zero)
            .toList();

        break;
      case Period.YEAR5:
        DateTime week1 = today.subtract(const Duration(days: 5 * 365));

        _filtered = _dataList
            .where((element) => element.date.difference(week1) > Duration.zero)
            .toList();

        break;
      default:
        _filtered = [..._dataList];
    }
    this.period = period;

    notifyListeners();
  }

  loadinfo(String symbol) async {
    isloadinginfo = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 5));
    final myData = await rootBundle.loadString("assets/pricedata/$symbol.json");
    info = StockInfo.fromMap(jsonDecode(myData));
    isloadinginfo = false;
    notifyListeners();
  }

  loadchart(String symbol) async {
    isloadingchart = true;
    notifyListeners();
    final myData = await rootBundle.loadString("assets/pricedata/$symbol.csv");
    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(myData);
    _dataList =
        rowsAsListOfValues.skip(1).map((e) => TimeSeries.fromList(e)).toList();
    isloadingchart = false;
    filter(Period.MONTH3);

  }
}

num square(num x)=>x*x;

List<num> xlist=[1,2,2,3];
var h=xlist.map(square).toList();