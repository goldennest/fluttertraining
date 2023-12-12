import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
                height: 100,
                width: 100,
                color: const Color.fromARGB(255, 241, 237, 237),
                child: Text('This is a Stateless Widget')),
            Container(
                height: 100,
                width: 100,
                color: const Color.fromARGB(255, 241, 237, 237),
                child: Text('This is a Stateless Widget')),
          ],
        ),
      ),
    );
  }
}
