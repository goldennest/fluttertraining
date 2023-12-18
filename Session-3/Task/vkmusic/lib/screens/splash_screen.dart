

import 'package:flutter/material.dart';
import 'package:vkmusic/utils/common_export.dart';
import 'dart:async';

import 'screens_export.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    _startTime();
  }
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage('images/ic_background_image.png'),
        //   fit: BoxFit.cover,
        // ),
      color: AppTheme.primarycolor,

        ),
        alignment: Alignment.center,
        child: Hero(
          tag: 'App_logo',
          child: Image.asset('assets/images/logo-white.png'),
        ),
      ),
      backgroundColor: AppTheme.primarycolor,
    );
  }
    _startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, _navigationPage);
  }
  Future<void> _navigationPage() async {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Home(),
      ),
    );
}
}