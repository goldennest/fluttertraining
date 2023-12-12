import 'package:flutter/material.dart';
import 'package:intern_example/lifecycle.dart';
import 'package:intern_example/statefull.dart';
import 'package:intern_example/stateless.dart';
import 'package:intern_example/tabviews.dart';

import 'alert.dart';
import 'cursolsilder.dart';
import 'form.dart';
import 'gesture.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Tabpage(), // Change Each Widget Here to view which widget you want to visible
    );
  }
}
