import 'package:flutter/material.dart';

import 'providerlandingpage.dart';
import 'sliverlandingpage.dart';

class LandingPage extends StatelessWidget {
  final String email;
  const LandingPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ProviderLandingPage()),
                  );
                },
                child: const Text("Goto Provider Example page")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SilverLandingPage()),
                  );
                },
                child: const Text("Goto Silver Example page"))
          ],
        ),
      ),
    );
  }
}
