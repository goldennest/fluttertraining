import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/login.dart';
import 'provider/stock_provider.dart';

const ALLSTOCKLIST = ["INFY", "RELIANCE"];

void main() {
  runApp(const MyApp2());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.light(
              primary: Colors.lightGreen[900] ?? Colors.lightGreen)),
      title: 'Flutter Demo',
      home: const LoginWidget(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StockProvider>(
      create: (_) => StockProvider(),
      child: MaterialApp(
        theme: ThemeData.from(
            colorScheme: ColorScheme.light(
                primary: Colors.lightGreen[900] ?? Colors.lightGreen)),
        title: 'Flutter Demo',
        home: const LoginWidget(),
      ),
    );
  }
}
