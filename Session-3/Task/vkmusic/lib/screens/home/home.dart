import 'package:flutter/material.dart';
import 'package:vkmusic/screens/screens_export.dart';
import 'package:vkmusic/utils/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(
          image: AssetImage('assets/images/home-img.webp'),
          fit: BoxFit.cover,
        ),
            
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppTheme.primarycolor.withOpacity(.5),
                AppTheme.primarycolor.withOpacity(.6),
                AppTheme.primarycolor.withOpacity(.7),
                AppTheme.primarycolor,

              ],
            )
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SongList(),
                    ));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.cyan, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 15),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
