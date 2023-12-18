import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/theme.dart';

import 'myhomepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).getCurrentTheme(),
      home:  WalletScreen(),
    );
  }
}
