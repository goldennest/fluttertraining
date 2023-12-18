import 'package:flutter/material.dart';
import 'package:vkmusic/screens/splash_screen.dart';
import 'package:vkmusic/utils/common_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: APPNAME,
         theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: AppTheme.primarycolor,
          ),
      home: SplashScreen(),
    );
  }
}