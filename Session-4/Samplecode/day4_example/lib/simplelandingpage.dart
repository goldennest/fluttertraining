import 'package:flutter/material.dart';

class SimpleLandingPage extends StatelessWidget {
  final String email;
  const SimpleLandingPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hi ${email}"),
            const SizedBox(
              height: 15,
            ),
            const Text("Welcome to Landing page"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
