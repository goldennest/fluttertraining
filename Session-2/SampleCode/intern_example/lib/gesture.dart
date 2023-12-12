import 'package:flutter/material.dart';

class MyGesturePage extends StatefulWidget {
  @override
  _MyGesturePageState createState() => _MyGesturePageState();
}

class _MyGesturePageState extends State<MyGesturePage> {
  String gestureStatus = 'No Gesture Detected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            updateGestureStatus('onTap');
          },
          onDoubleTap: () {
            updateGestureStatus('onDoubleTap');
          },
          onLongPress: () {
            updateGestureStatus('onLongPress');
          },
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.blue,
            child: Center(
              child: Text(
                gestureStatus,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateGestureStatus(String status) {
    setState(() {
      gestureStatus = status;
    });
  }
}
